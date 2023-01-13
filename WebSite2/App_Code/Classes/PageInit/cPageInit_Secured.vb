﻿Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Web.UI.WebControls

Public Class cPageInit_Secured
    Inherits System.Web.UI.Page
    Dim _clsCMSPermission As New clsCMSPermission

    Dim _strScript As String

    Protected Overrides Sub OnInitComplete(ByVal e As System.EventArgs)
        MyBase.OnInitComplete(e)

        If IsDBNull(Master) = False Then
            Dim mph As ContentPlaceHolder = DirectCast(Master.FindControl("cphSContent"), ContentPlaceHolder)
            If IsDBNull(mph) = False Then
                Dim btnDelete As Button = DirectCast(mph.FindControl("btnDelete"), Button)

                If IsNothing(btnDelete) = False Then
                    btnDelete.Attributes.Add("onclick", "return confirm('Are you sure you would like to delete selected item(s)?');")
                End If
            End If
        End If
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Init

        If Session("UserId") = Nothing Then
            Response.Redirect("~/admin.aspx")
        End If

        If Not Page.IsPostBack Then
            savePage()
        End If

    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.LoadComplete

        If Not Page.IsPostBack Then
            GetUserPermission()
        End If

    End Sub

    Protected Sub GetUserPermission()

        Dim cph As ContentPlaceHolder
        cph = Master.FindControl("cphSContent")
        Dim _btnSave As Button = cph.FindControl("btnSave")
        Dim _btnCancel As Button = cph.FindControl("btnCancel")
        Dim _btnAdd As Button = cph.FindControl("btnAdd")
        Dim _btnDelete As Button = cph.FindControl("btnDelete")
        Dim _btnBack As Button = cph.FindControl("btnBack")
        Dim _gv As GridView = cph.FindControl("_gv")


        Dim _bolControl As Boolean()
        _bolControl = _clsCMSPermission.getMenuPermission(Session("UserId"), Session("UserRoleId"), _strScript)

        
        'Access 
        If _bolControl(0) = False Then
            Response.Redirect("~/Secured/Default.aspx")
        End If


        ' Create
        If Not IsNothing(_btnAdd) Then
            _btnAdd.Visible = _bolControl(1)
        End If

        'Add/Edit
        If Session("AE_STATUS") = "ADD" Then

            If Not IsNothing(_btnSave) Then
                _btnSave.Visible = _bolControl(1)
                If Not IsNothing(_btnCancel) Then
                    _btnCancel.Visible = _bolControl(1)
                End If
            End If
        ElseIf Session("AE_STATUS") = "EDIT" Then
            If Not IsNothing(_btnSave) Then
                _btnSave.Visible = _bolControl(2)
                If Not IsNothing(_btnCancel) Then
                    _btnCancel.Visible = _bolControl(2)
                End If
            End If
        End If

        ' Delete
        If Not IsNothing(_btnDelete) Then
            _btnDelete.Visible = _bolControl(3)
        End If



    End Sub

    Protected Sub savePage()
        ' save in apageguide
        Dim _dtPage As New DataTable
        Dim _strPageName As String, _strQuery As String, _strPage As String()
        _strQuery = Request.ServerVariables("QUERY_STRING").ToString()
        _strScript = Request.ServerVariables("SCRIPT_NAME").ToString()
        _strPage = _strScript.Split("/")
        _strScript = _strPage(_strPage.Length - 1)
        _strPageName = _strScript.Remove(_strScript.ToString().Length - 5, 5)

        '_dtPage = clsAdmin.fnapageguide_getpage(LCase(_strScript))
        'If _dtPage.Rows.Count <= 0 Then
        '    clsAdmin.fnapageguide_Save(0, Trim(_strPageName), "", LCase(Trim(_strScript)), 1, 1, Session("UserId"))
        'End If

    End Sub

    Public Function redirectAlert(ByVal url As String, ByVal msg As String) As String

        Dim strMsg As String = msg
        If msg = "" Then
            strMsg = "Transaction has been successfully saved."
        End If

        Dim strScript As String = "<script language=JavaScript>"
        strScript += "alert('" & strMsg & "');"
        strScript += "window.location='" & url & "'"
        strScript += "</script>"

        Return strScript

    End Function


    Public Function setCurrentPage(ByVal _intPageIndex As Integer, ByVal _dt As DataTable) As String
        Dim _strReturn As String

        Dim _intTotalRec As Integer, _intTotalPage As Integer

        _intTotalRec = 0
        If _dt.Rows.Count > 0 Then
            _intTotalRec = _dt.Rows.Count
        End If

        If _intTotalRec < 11 Then
            _intTotalPage = 1
        Else
            _intTotalPage = Math.Truncate((_intTotalRec / 10))
            If (_intTotalRec Mod 10) <> 0 Then
                _intTotalPage += 1
            End If
        End If

        If _intPageIndex < 1 Then
            _intPageIndex = 1
        End If

        If _intTotalPage < 1 Then
            _intTotalPage = 1
        End If

        _strReturn = " Page " & _intPageIndex.ToString() & " of " & _intTotalPage.ToString() & ", Total Records: " & _intTotalRec.ToString

        Return _strReturn

    End Function
End Class
