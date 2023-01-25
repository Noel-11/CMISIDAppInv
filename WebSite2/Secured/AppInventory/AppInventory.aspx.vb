Imports System.Data
Partial Class Secured_AppInventory_AppInventory
    Inherits cPageInit_Secured_BS

    Dim _clsDB As New clsDatabase

    Dim _clsApplication As New clsApplication
    Dim _clsApplicationVersion As New clsApplicationVersion
    Dim _clsApplicationAssignedPersonnel As New clsApplicationAssignedPersonnel

    Dim _dtGV As New DataTable

    Dim _btnOK As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Session.Remove("APP_ID")

            fillGridView(txtSearch.Text.Trim)
        End If

        _btnOK = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click

    End Sub
    Protected Sub fillGridView(ByVal _strSearch As String)

        _dtGV = _clsApplication.browseApplication(_strSearch.Trim)
        _gv.DataSource = _dtGV
        _gv.DataBind()
       
    End Sub

    Protected Sub _gv_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles _gv.PageIndexChanging
        Session("NewPageIndex") = e.NewPageIndex
        _gv.PageIndex = e.NewPageIndex
        fillGridView(txtSearch.Text.Trim)
        ' _lblPaging.Text = clsLibrary.fnSetCurrentPage(e.NewPageIndex + 1, _dtGV, _gv.PageSize)
    End Sub

    Protected Sub btnSearch_ServerClick(sender As Object, e As EventArgs) Handles btnSearch.ServerClick
        fillGridView(txtSearch.Text.Trim)
    End Sub

    Protected Sub btnAdd_ServerClick(sender As Object, e As EventArgs) Handles btnAdd.ServerClick
        Session("APPV_ID") = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
        Response.Redirect("AppInventoryAdd.aspx")
    End Sub

    Protected Sub cmdGVSelect(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("APP_ID") = e.CommandArgument.ToString
        getDll()
        fillInfo()
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlApplicationDetails", "var myModal = new bootstrap.Modal(document.getElementById('mdlApplicationDetails'), {});  myModal.show();", True)
    End Sub

    Private Sub getDll()

        _clsDB.populateDDLB(ddlDepartment, "client_name", "client_id", "tbl_ref_clients", "client_name", " WHERE is_active = 'Y'", , "")
        _clsDB.populateDDLB(ddlRole, "user_role_description", "user_role_id", "tbl_user_role", "user_role_description", " WHERE is_active = 'Y' AND user_role_id NOT IN ('1','4')", , "")
        _clsDB.populateDDLB(ddlPersonnel, "personnel_name", "personnel_id", "tbl_ref_personnels", "personnel_name", " WHERE is_active = 'Y' AND personnel_role_id = '" & ddlRole.SelectedValue & "'", , "")

    End Sub

    Protected Sub ddlRole_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlRole.SelectedIndexChanged
        _clsDB.populateDDLB(ddlPersonnel, "personnel_name", "personnel_id", "tbl_ref_personnels", "personnel_name", " WHERE is_active = 'Y' AND personnel_role_id = '" & ddlRole.SelectedValue & "'", , "")
    End Sub

    Private Sub fillInfo()

        With _clsApplication
            .getApplication(Session("APP_ID"))
            txtApplicationName.Text = .applicationName
            dtpStartDate.Value = CDate(.applicationStartDate).ToString("yyyy-MM-dd")
            dtpDeploymentDate.Value = CDate(.applicationDeploymentDate).ToString("yyyy-MM-dd")
            ddlDepartment.SelectedValue = .clientId
            txtDescription.Text = .applicationDetails
            txtUrl.Text = .applicationUrl


            txtContactPerson.Text = .contactPerson
            txtContactNumber.Text = .contactNumber
            txtContactEmailAddress.Text = .contactEmailAddress

            'rdlisactive.SelectedValue = .isActive

        End With

        With _clsApplicationVersion
            .getApplicationVersionCurrent(Session("APP_ID"))
            txtFeatures.Text = .applicationFeatures
            txtSADLink.Text = .systemAnalysisDesignUrl
            txtDeploymentAgreementLink.Text = .deploymentAgreementUrl
            txtDeploymentLetterLink.Text = .deploymentLetterUrl

        End With

        fillGridViewVersions()
        fillGridViewPersonnel()
    End Sub


    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If thisMsgBox.getModalType = "SAVE APPDETAILS" Then
            updateApplicationDetails()
            fillGridView(txtSearch.Text.Trim)
            thisMsgBox.setModalType("OKSAVE")
            thisMsgBox.setInfo("INFO", "Application Details Saved Successfully!")
            thisMsgBox.showConfirmBox()
        ElseIf thisMsgBox.getModalType = "SAVE CONTACT" Then
            updateContactDetails()
            thisMsgBox.setModalType("OKSAVE")
            thisMsgBox.setInfo("INFO", "Application Details Saved Successfully!")
            thisMsgBox.showConfirmBox()
        ElseIf thisMsgBox.getModalType = "ADD PERSONNEL" Then
            savePersonnel()
            fillGridViewVersionPersonnel()
        ElseIf thisMsgBox.getModalType = "SAVE VERSION" Then
            saveVersionDetails()
            fillInfo()
            ' ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlVersionDetails", "var myModal = new bootstrap.Modal(document.getElementById('mdlVersionDetails'), {});  myModal.show();", True)
            thisMsgBox.setModalType("OKSAVE")
            thisMsgBox.setInfo("INFO", "Version Details Saved Successfully!")
            thisMsgBox.showConfirmBox()
        End If

    End Sub


#Region "APPLICATION DETAILS"

    Protected Sub btnSaveAppDetails_ServerClick(sender As Object, e As EventArgs) Handles btnSaveAppDetails.ServerClick
        thisMsgBox.setModalType("SAVE APPDETAILS")
        thisMsgBox.setConfirm()
        thisMsgBox.setHeaderText("SAVE")
        thisMsgBox.setMessage("Are you sure to save this Application Details?")
        thisMsgBox.showConfirmBox()
    End Sub

    Private Sub updateApplicationDetails()

        With _clsApplication
            .applicationId = Session("APP_ID")
            .clientId = ddlDepartment.SelectedValue
            .applicationName = txtApplicationName.Text.Trim.ToUpper
            .applicationDetails = txtDescription.Text.Trim.ToUpper
            .applicationUrl = txtUrl.Text.Trim
            .applicationStartDate = CDate(dtpStartDate.Value).ToString("yyyy-MM-dd")
            .applicationDeploymentDate = CDate(dtpDeploymentDate.Value).ToString("yyyy-MM-dd")
            '.isActive = rdlisactive.SelectedValue
            .lastUser = Session("UserName")
            .updateApplication()
        End With

    End Sub

#End Region


#Region "CONTACT DETAILS"

    Protected Sub btnSaveContactDetails_ServerClick(sender As Object, e As EventArgs) Handles btnSaveContactDetails.ServerClick
        thisMsgBox.setModalType("SAVE CONTACT")
        thisMsgBox.setConfirm()
        thisMsgBox.setHeaderText("SAVE")
        thisMsgBox.setMessage("Are you sure to save this Contact Details?")
        thisMsgBox.showConfirmBox()
    End Sub

    Private Sub updateContactDetails()

        With _clsApplication
            .applicationId = Session("APP_ID")
            .contactPerson = txtContactPerson.Text.Trim.ToUpper
            .contactNumber = txtContactNumber.Text.Trim.ToUpper
            .contactEmailAddress = txtContactEmailAddress.Text.Trim
            .updateContactDetails()
        End With

    End Sub

#End Region


#Region "VERSION"


    'VERSIONS
    Protected Sub fillGridViewVersions()
        Dim dt As New DataTable
        dt = _clsApplicationVersion.browseApplicationVersion(Session("APP_ID"))
        _gvVersions.DataSource = dt
        _gvVersions.DataBind()

        Session("CURR_VID") = dt.Rows(0)("application_version_id")

    End Sub

    Protected Sub _gvVersions_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles _gvVersions.PageIndexChanging
        Session("NewPageIndex") = e.NewPageIndex
        _gvVersions.PageIndex = e.NewPageIndex
        fillGridViewVersions()
        ' _lblPaging.Text = clsLibrary.fnSetCurrentPage(e.NewPageIndex + 1, _dtGV, _gv.PageSize)
    End Sub


    'PERSONNEL
    Protected Sub fillGridViewPersonnel()
        Dim dt As New DataTable
        dt = _clsApplicationAssignedPersonnel.browseApplicationAssignedPersonnel(Session("CURR_VID").ToString)
        _gvPersonnel.DataSource = dt
        _gvPersonnel.DataBind()

    End Sub

    Protected Sub _gvPersonnel_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles _gvPersonnel.PageIndexChanging
        Session("NewPageIndex") = e.NewPageIndex
        _gvPersonnel.PageIndex = e.NewPageIndex
        fillGridViewPersonnel()
        ' _lblPaging.Text = clsLibrary.fnSetCurrentPage(e.NewPageIndex + 1, _dtGV, _gv.PageSize)
    End Sub

   

    'VERSION DETAILS
    Protected Sub btnAddVersion_ServerClick(sender As Object, e As EventArgs) Handles btnAddVersion.ServerClick
        Session("VERSION_MODE") = "ADD"
        Session("VERSIONDETAILS_ID") = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
        fillGridViewVersionPersonnel()
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlVersionDetails", "var myModal = new bootstrap.Modal(document.getElementById('mdlVersionDetails'), {});  myModal.show();", True)
    End Sub

    Protected Sub fillGridViewVersionPersonnel()
        Dim dt As New DataTable
        dt = _clsApplicationAssignedPersonnel.browseApplicationAssignedPersonnel(Session("VERSIONDETAILS_ID"))
        _gvVersionPersonnel.DataSource = dt
        _gvVersionPersonnel.DataBind()

    End Sub

    Protected Sub _gvVersionPersonnel_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles _gvVersionPersonnel.PageIndexChanging
        Session("NewPageIndex") = e.NewPageIndex
        _gvVersionPersonnel.PageIndex = e.NewPageIndex
        fillGridViewVersionPersonnel()
        ' _lblPaging.Text = clsLibrary.fnSetCurrentPage(e.NewPageIndex + 1, _dtGV, _gv.PageSize)
    End Sub

    Protected Sub btnAddPersonnel_ServerClick(sender As Object, e As EventArgs) Handles btnAddPersonnel.ServerClick

        Dim dtCheckExist As New DataTable

        dtCheckExist = _clsDB.Fill_DataTable("SELECT application_assisgned_personnel_id FROM tbl_application_assigned_personnel WHERE is_active = 'Y' AND application_version_id = '" & Session("VERSIONDETAILS_ID").ToString & "' AND personnel_id = '" & ddlPersonnel.SelectedValue.ToString & "' LIMIT 1")

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

    Private Sub savePersonnel()

        With _clsApplicationAssignedPersonnel
            .initialize()
            .applicationVersionId = Session("VERSIONDETAILS_ID")
            .personnelId = ddlPersonnel.SelectedValue
            .lastUser = Session("UserName")
            .saveApplicationAssignedPersonnel()
        End With

    End Sub

    Private Sub saveVersionDetails()

        With _clsApplicationVersion
            .initialize()
            .applicationVersionId = Session("VERSIONDETAILS_ID")
            .applicationId = Session("APP_ID")
            .applicationVersionStartDate = CDate(dtpVersionStartDate.Value).ToString("yyyy-MM-dd")
            .applicationVersionEndDate = CDate(dtpVersionEndDate.Value).ToString("yyyy-MM-dd")
            .applicationFeatures = txtVersionFeatures.Text.Trim.ToUpper
            .deploymentLetterUrl = txtVersionDeployLetLink.Text.Trim
            .deploymentAgreementUrl = txtVersionDeployAgreeLink.Text.Trim
            .systemAnalysisDesignUrl = txtVersionSadLink.Text.Trim
            .versionNo = txtVersionNo.Text.Trim.ToUpper
            .lastUser = Session("UserName")

            If Session("VERSION_MODE") = "ADD" Then
                .saveApplicationVersion()
            Else
                .updateApplicationVersion()
            End If

        End With
     
    End Sub

    Protected Sub btnSaveVersion_ServerClick(sender As Object, e As EventArgs) Handles btnSaveVersion.ServerClick
        thisMsgBox.setModalType("SAVE VERSION")
        thisMsgBox.setConfirm()
        thisMsgBox.setHeaderText("SAVE VERSION")
        If Session("VERSION_MODE") = "ADD" Then
            thisMsgBox.setMessage("Are you sure to save this version details?")
        Else
            thisMsgBox.setMessage("Are you sure to update this version details?")
        End If
        thisMsgBox.showConfirmBox()
    End Sub


#End Region

   
  
End Class
