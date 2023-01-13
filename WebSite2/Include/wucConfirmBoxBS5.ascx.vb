﻿
Partial Class Include_wucConfirmBoxBS5
    Inherits System.Web.UI.UserControl


    Public Function getModalType() As String
        Return hfModalType.Value.ToString
    End Function

    Public Sub setModalType(ByVal _modalType As String)
        hfModalType.Value = _modalType
    End Sub

    Public Sub setHeaderText(ByVal _header As String)
        lblMsgBoxHeader.Text = _header
    End Sub

    Public Sub setMessage(ByVal _msg As String)
        lblMsgBoxMessage.Text = _msg
    End Sub

    Public Sub showConfirmBox()
        'ScriptManager.RegisterStartupScript(Page, Page.GetType(), "pnlDisplay", "$('#pnlPending2').modal();", True)
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "pnlDisplay", "var myModal = new bootstrap.Modal(document.getElementById('pnlPending2'), {});  myModal.show();", True)
    End Sub

    Public Sub setYesButton(Optional isVisible As Boolean = True, Optional thisText As String = "Yes", Optional thisColor As String = "BLUE")
        Dim thisClass As String = ""

        btnMsgBoxYes.Visible = isVisible
        If Not isVisible Then
            Exit Sub
        End If

        btnMsgBoxYes.InnerText = thisText

        Select Case thisColor
            Case "ORANGE"
                thisClass = "btn btn-warning"
            Case "RED"
                thisClass = "btn btn-danger"
            Case "GREEN"
                thisClass = "btn btn-success"
            Case Else
                thisClass = "btn btn-primary"
        End Select


        btnMsgBoxYes.Attributes.Add("class", thisClass)
        'btnMsgBoxYes.Attributes.Add("onserverclick", "btnOK_Click")
    End Sub

    Public Sub setNoButton(Optional isVisible As Boolean = True, Optional thisText As String = "No", Optional thisColor As String = "RED")
        Dim thisClass As String = ""

        btnMsgBoxNo.Visible = isVisible
        If Not isVisible Then
            Exit Sub
        End If

        btnMsgBoxNo.InnerText = thisText

        Select Case thisColor
            Case "ORANGE"
                thisClass = "btn btn-warning"
            Case "RED"
                thisClass = "btn btn-danger"
            Case "GREEN"
                thisClass = "btn btn-success"
            Case Else
                thisClass = "btn btn-primary"
        End Select


        btnMsgBoxNo.Attributes.Add("class", thisClass)
    End Sub

    Public Sub setHeader(Optional thisBackColor As String = "GRAY", Optional thisFontColor As String = "BLACK")
        Dim thisStyle As String = "text-align: center; font-weight: bold; font-size: large;"

        If thisBackColor = "GRAY" Then
            thisBackColor = ""
        Else
            thisBackColor = ";background-color:" & thisBackColor.ToLower
        End If

        thisFontColor = ";color:" & thisFontColor.ToLower

        thisStyle = thisStyle & thisBackColor & thisFontColor

        divHeader.Attributes.Add("style", thisStyle)
    End Sub

    Public Sub setError(Optional thisErrorHeader As String = "ERROR", Optional thisErrorMessage As String = "")
        setHeaderText(thisErrorHeader)
        setMessage(thisErrorMessage)
        setHeader("RED", "YELLOW")
        setYesButton(False)
        setNoButton(True, "OK")
    End Sub

    Public Sub setConfirm(Optional thisHeader As String = "CONFIRM", Optional thisMessage As String = "")
        setHeaderText(thisHeader)
        setMessage(thisMessage)
        setHeader("GREEN", "YELLOW")
        setYesButton()
        setNoButton()
    End Sub

    Public Sub setInfo(Optional thisHeader As String = "Info", Optional thisMessage As String = "")
        setHeaderText(thisHeader)
        setMessage(thisMessage)
        setHeader("BLUE", "YELLOW")
        setYesButton(True, "OK")
        setNoButton(False)
    End Sub

End Class
