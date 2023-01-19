Imports System.Data
Imports System.Net
Imports System.Net.Sockets

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim _dt As New DataTable

    Dim clsLibrary As New clsLibrary
    Dim _clsUser As New clsUser
    Dim _clsDB As New clsDatabase
    Dim _dtCV As New DataTable

    Dim _clsLoginLog As New clsLoginLog


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'lblIPAddress.Text = LocalIPAddress()
        If Not IsPostBack Then
            txtUserId.Focus()
            Session.RemoveAll()
            Session("UserName") = "."
            ''ancIctAboutUs.HRef = ConfigurationManager.AppSettings("preUrl").ToString & "Secured/AboutUs/AboutUs.aspx"
            'Session("SENDSMS") = _clsDB.Get_DB_Item("SELECT default_value FROM tbl_system_default WHERE default_desc = 'notify_sms' LIMIT 1")

        End If
    End Sub

     Protected Sub btnLogin_Click1(sender As Object, e As EventArgs) Handles btnLogin.Click
        logIn()
    End Sub

    Private Sub saveLoginLog(ByVal _status As String)
        'With _clsLoginLog
        '    .initialize()
        '    .userId = Session("UserId")
        '    .loginIp = GetIPAddress()
        '    .loginDatetime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
        '    .loginStatus = _status
        '    .saveLoginLog()
        'End With
    End Sub

    Public Sub logIn()

        If _clsUser.validateUserLogon(txtUserId.Text.Trim, txtPassword.Value.Trim) = True Then

            With _clsUser
                .getUserInformation(txtUserId.Text)
                Session("UserId") = .userID
                Session("UserRoleId") = .userRoleID
                Session("UserName") = .userName
            End With

            Response.Redirect("~/Secured/Default.aspx")
        End If


    End Sub

   
  
End Class
