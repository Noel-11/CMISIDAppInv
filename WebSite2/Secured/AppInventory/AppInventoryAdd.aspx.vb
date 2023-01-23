Imports System.Data
Partial Class Secured_AppInventory_AppInventoryAdd
    Inherits cPageInit_Secured_BS

    Dim _clsDB As New clsDatabase

    Dim _clsApplication As New clsApplication
    Dim _clsApplicationVersion As New clsApplicationVersion
    Dim _clsApplicationAssignedPersonnel As New clsApplicationAssignedPersonnel

    Dim _btnOK As New HtmlButton

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            getDll()
            fillGridViewPersonnel()
            ''Initialize Personnel DT
            'Dim dt As New DataTable

            'dt = _clsDB.Fill_DataTable("SELECT application_assisgned_personnel_id, application_version_id, personnel_id FROM tbl_application_assigned_personnel WHERE is_active = 'X' LIMIT 0")

            'Session("DT_PERSONNEL") = dt
        End If

        _btnOK = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click

    End Sub

    Private Sub getDll()

        _clsDB.populateDDLB(ddlDepartment, "client_name", "client_id", "tbl_ref_clients", "client_name", " WHERE is_active = 'Y'", , "")
        _clsDB.populateDDLB(ddlRole, "user_role_description", "user_role_id", "tbl_user_role", "user_role_description", " WHERE is_active = 'Y' AND user_role_id NOT IN ('1','4')", , "")
        _clsDB.populateDDLB(ddlPersonnel, "personnel_name", "personnel_id", "tbl_ref_personnels", "personnel_name", " WHERE is_active = 'Y' AND personnel_role_id = '" & ddlRole.SelectedValue & "'", , "")

    End Sub

    Protected Sub ddlRole_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlRole.SelectedIndexChanged
        _clsDB.populateDDLB(ddlPersonnel, "personnel_name", "personnel_id", "tbl_ref_personnels", "personnel_name", " WHERE is_active = 'Y' AND personnel_role_id = '" & ddlRole.SelectedValue & "'", , "")
    End Sub



    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If thisMsgBox.getModalType = "SAVE" Then
            saveApplication()
            thisMsgBox.setModalType("OKSAVE")
            thisMsgBox.setInfo("INFO", "Application saved successfully!")
            thisMsgBox.showConfirmBox()
        ElseIf thisMsgBox.getModalType = "OKSAVE" Then
            Response.Redirect("AppInventory.aspx")
        ElseIf thisMsgBox.getModalType = "ADD PERSONNEL" Then
            'savePersonnelDT()
            savePersonnel()
            fillGridViewPersonnel()
        ElseIf thisMsgBox.getModalType = "CLEAR" Then
            Session("APPV_ID") = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
            Response.Redirect("AppInventoryAdd.aspx")
        End If

    End Sub

#Region "PERSONNEL"

    Protected Sub fillGridViewPersonnel()
        Dim dt As New DataTable
        dt = _clsApplicationAssignedPersonnel.browseApplicationAssignedPersonnel(Session("APPV_ID"))
        _gv.DataSource = dt
        _gv.DataBind()

    End Sub

    Protected Sub _gv_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles _gv.PageIndexChanging
        Session("NewPageIndex") = e.NewPageIndex
        _gv.PageIndex = e.NewPageIndex
        fillGridViewPersonnel()
        ' _lblPaging.Text = clsLibrary.fnSetCurrentPage(e.NewPageIndex + 1, _dtGV, _gv.PageSize)
    End Sub

    Protected Sub btnAddPersonnel_ServerClick(sender As Object, e As EventArgs) Handles btnAddPersonnel.ServerClick
        Dim dtCheckExist As New DataTable

        dtCheckExist = _clsDB.Fill_DataTable("SELECT application_assisgned_personnel_id FROM tbl_application_assigned_personnel WHERE is_active = 'Y' AND application_version_id = '" & Session("APPV_ID").ToString & "' AND personnel_id = '" & ddlPersonnel.SelectedValue.ToString & "' LIMIT 1")

        If dtCheckExist.Rows.Count > 0 Then
            thisMsgBox.setModalType("ADD PERSONNELXX")
            thisMsgBox.setInfo("Cannot Add", "Personnel already added!<br/>" & _
                               "Name: " & ddlPersonnel.SelectedItem.Text & "<br/>" &
                               "Role: " & ddlRole.SelectedItem.Text.Trim & "<br/>")
        Else

            thisMsgBox.setConfirm()
            thisMsgBox.setModalType("ADD PERSONNEL")
            thisMsgBox.setHeaderText("ADD PERSONNEL")
            thisMsgBox.setMessage("Are you sure to add this personnel?<br/>" & _
                                  "Name: " & ddlPersonnel.SelectedItem.Text & "<br/>" &
                                  "Role: " & ddlRole.SelectedItem.Text.Trim & "<br/>")

        End If


        thisMsgBox.showConfirmBox()
    End Sub

    'Private Sub savePersonnelDT()
    '    Dim dt As New DataTable
    '    dt = Session("DT_PERSONNEL")

    '    Dim nr As DataRow = dt.NewRow

    '    nr("application_assisgned_personnel_id") = ""
    '    nr("application_version_id") = ""
    '    nr("personnel_id") = ddlPersonnel.SelectedValue

    '    dt.Rows.Add(nr)

    '    Session("DT_PERSONNEL") = dt

    'End Sub

    Private Sub savePersonnel()
        With _clsApplicationAssignedPersonnel
            .initialize()
            .applicationVersionId = Session("APPV_ID")
            .personnelId = ddlPersonnel.SelectedValue
            .lastUser = Session("UserName")
            .saveApplicationAssignedPersonnel()
        End With

    End Sub

#End Region

    Protected Sub btnSubmit_ServerClick(sender As Object, e As EventArgs) Handles btnSubmit.ServerClick
        thisMsgBox.setConfirm()
        thisMsgBox.setModalType("SAVE")
        thisMsgBox.setHeaderText("NEW APPLICATION")
        thisMsgBox.setMessage("Are you sure to save this application?")
        thisMsgBox.showConfirmBox()
    End Sub

    Private Sub saveApplication()

        With _clsApplication
            .initialize()
            .clientId = ddlDepartment.SelectedValue
            .applicationName = txtApplicationName.Text.Trim.ToUpper
            .applicationDetails = txtDescription.Text.Trim.ToUpper
            .applicationUrl = txtUrl.Text.Trim
            .applicationStartDate = CDate(dtpStartDate.Value).ToString("yyyy-MM-dd")
            .applicationDeploymentDate = CDate(dtpDeploymentDate.Value).ToString("yyyy-MM-dd")
            .contactPerson = txtContactPerson.Text.Trim.ToUpper
            .contactNumber = txtContactNumber.Text.Trim
            .contactEmailAddress = txtContactEmailAddress.Text.Trim
            .lastUser = Session("UserName")
            .saveApplication()
        End With

        With _clsApplicationVersion
            .initialize()
            .applicationVersionId = Session("APPV_ID")
            .applicationId = _clsApplication.applicationId
            .applicationVersionStartDate = CDate(dtpStartDate.Value).ToString("yyyy-MM-dd")
            .applicationVersionEndDate = CDate(dtpDeploymentDate.Value).ToString("yyyy-MM-dd")
            .applicationFeatures = txtFeatures.Text.Trim
            .deploymentLetterUrl = txtDeploymentLetterLink.Text.Trim
            .systemAnalysisDesignUrl = txtSADLink.Text.Trim.ToUpper
            .deploymentAgreementUrl = txtDeploymentAgreementLink.Text.Trim
            .lastUser = Session("UserName")
            .saveApplicationVersion()
        End With

    End Sub

    Protected Sub btnClear_ServerClick(sender As Object, e As EventArgs) Handles btnClear.ServerClick
        thisMsgBox.setConfirm()
        thisMsgBox.setModalType("CLEAR")
        thisMsgBox.setHeaderText("CLEAR")
        thisMsgBox.setMessage("Are you sure to clear?")
        thisMsgBox.showConfirmBox()
    End Sub
End Class
