﻿Imports System.Data
Partial Class Include_wucMainMenuBS
    Inherits System.Web.UI.UserControl

    Dim _clsDB As New clsDatabase
    Dim _clsCMS As New clsCMS
    Dim menuWidth As Integer
   

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' MsgBox(Session("MODULE"))
        If Request("module") <> "" Then
            Session("MODULE") = "CMISID"
            Response.Redirect("~/Secured/Default.aspx")
        End If

        'If IsNothing(Session("navMenu")) Then
        GetMenuData()
        lblTextUser.Text = "CURRENT USER"
        'Else
        ' navMenu.Controls.Add(CType(Session("navMenu"), LiteralControl))
        ' End If

    End Sub
    Protected Sub lnkLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles logout.ServerClick
        Session("accPaneIndex") = 0
        Session.Abandon()
        'CType(Application("userList"), Dictionary(Of String, String())).Remove(Session("UserCode").ToString)
        'If Session("_strScript") = "VerifySoloParent.aspx" Then
        '    Response.Redirect("~/EstablishmentAdmin.aspx")
        'Else
        Response.Redirect("~/default.aspx")
        ' End If

    End Sub

    Protected Sub lnkChangePassword_Command(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChangePassword.ServerClick
        Response.Redirect("~/Secured/SystemAdministration/adUserChangePassword.aspx?nUserId=" & Session("UserId"))
    End Sub
    Private Sub GetMenuData()

        Dim dtMenu As New DataTable
        Dim htmlStringHeadButton As String = ""
        Dim htmlString As String = ""
        Dim urlString As String = ""
        Dim preUrl As String = ConfigurationManager.AppSettings("preUrl").ToString
        dtMenu = _clsCMS.browseSecureCMSMenuHeaderPermissionByModule(Session("UserId"), Session("UserRoleId"), "CMISID")


        Dim liList As New LiteralControl

        For Each row As DataRow In dtMenu.Rows
            menuWidth = menuWidth + 180
            urlString = row("page_url").ToString().Replace("~/", preUrl)
            Dim dt As New DataTable
            dt = _clsCMS.browseSecureCMSSubMenuPermission(Session("UserId"), Session("UserRoleId"), row("menu_id").ToString())

            If row("page_url") <> "" Then
                htmlString = htmlString & "<div data-kt-menu-trigger='click' class='menu-item menu-accordion mb-1'>"
                htmlString = htmlString & "<a href='" & urlString & "' class='menu-link'><span class='menu-icon'><i class='bi bi-card-checklist'></i></span><span class='menu-title'>" & row("menu_name").ToString() & "</span><span class='menu-arrow'></span></a>"
                ' htmlString = htmlString & "<li><a href='" & urlString & "'><button id='' type='button' class='btn btn-lg btn-block btn-success' style='backgroud-color:yellow'><span class=''></span>&nbsp;" & row("menu_name").ToString() & "</button></a></li>"
            Else

                Dim _menuId As String = row("menu_name").ToString() & row("menu_id").ToString()

                htmlString = htmlString & "<div data-kt-menu-trigger='click' class='menu-item menu-accordion mb-1'>"
                htmlString = htmlString & "<a href='" & urlString & "' class='menu-link'><span class='menu-icon'><i class='bi bi-card-checklist'></i></span><span class='menu-title'>" & row("menu_name").ToString() & "</span><span class='menu-arrow'></span></a>"

                htmlString = htmlString & "<div class='menu-sub menu-sub-accordion'>"

                For Each childView As DataRow In dt.Rows
                    urlString = childView("page_url").ToString().Replace("~/", preUrl)
                    htmlString = htmlString & "<div class='menu-item'><a href='" & urlString & "' class='menu-link'>" & childView("menu_name").ToString() & "<span class='menu-icon'></span></a></div>"
                    'htmlString = htmlString & "<li><a href='" & urlString & "'><button type='button' class='btn btn-block btn-warning'><span class=''></span>&nbsp;" & childView("menu_name").ToString() & "</button></a></li>"
                Next

                htmlString = htmlString + "</ul></div></div>"

            End If

            'If row("page_url") = "" Then
            '    htmlString = htmlString + "</ul></li>"
            'End If
        Next

        liList.Text = htmlString
        navMenu.Controls.Add(liList)
        Session("navMenu") = liList

    End Sub
 
End Class
