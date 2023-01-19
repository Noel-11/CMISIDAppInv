Imports System.Data
Partial Class Secured_Reference_refPersonnel
    Inherits cPageInit_Secured_BS

    Dim _clsRefPersonnel As New clsRefPersonnel
    Dim _dtGV As New DataTable
    Dim _btnOK As New HtmlButton
    Dim _clsDB As New clsDatabase

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            _clsDB.populateDDLB(ddlUserRole, "user_role_name", "user_role_id", "tbl_user_role", "user_role_name", " WHERE is_active='Y' and user_role_type = 'Personnel' AND last_user <> 'INITIALIZED' ", "--Select Personnel Role--", "")

            _clsDB.populateDDLB(ddlDivision, "division_name", "division_id", "tbl_ref_division", "division_name", " WHERE is_active='Y'", "--Select Personnel Division--", "")


            fillGridView()

            If Session("refPersonnel_msg") <> "" Then
                thisConfirmBox.setInfo("Clients", "Successfully Saved/Updated!")
                thisConfirmBox.showConfirmBox()

                Session("refPersonnel_msg") = ""
            End If
        End If


        _btnOK = thisConfirmBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click
    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If thisConfirmBox.getModalType = "ClearField" Then
            clearField()
        ElseIf thisConfirmBox.getModalType = "SaveRecord" Then
            saveRecord()
            fillGridView()
        End If
    End Sub
    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        fillGridView()
    End Sub

    Protected Sub fillGridView()
        _dtGV = _clsRefPersonnel.browseRefPersonnels(txtSearch.Text.Trim)
        _gv.DataSource = _dtGV
        _gv.DataBind()
    End Sub

    Protected Sub _gv_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles _gv.PageIndexChanging
        Session("NewPageIndex") = e.NewPageIndex
        _gv.PageIndex = e.NewPageIndex
        fillGridView()
    End Sub

#Region "Add/Edit"

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        clearField()
        btnSave.Text = "Save"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "pnlEdit", "var myModal = new bootstrap.Modal(document.getElementById('pnlEdit'), {});  myModal.show();", True)
    End Sub

    Protected Sub cmdGVUpdate(ByVal sender As Object, ByVal e As CommandEventArgs)
        hfTransId.Value = e.CommandArgument.ToString
        btnSave.Text = "Update"
        With _clsRefPersonnel
            .getRefPersonnels(hfTransId.Value)
            txtPersonnelName.Text = .personnelName
            txtPersonnelDetails.Text = .personnelDetails
            ddlUserRole.SelectedValue = .personnelRoleId
            ddlDivision.SelectedValue = .divisionId
            rblIsActive.SelectedValue = .isActive
        End With

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "pnlEdit", "var myModal = new bootstrap.Modal(document.getElementById('pnlEdit'), {});  myModal.show();", True)
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        thisConfirmBox.setModalType("SaveRecord")
        thisConfirmBox.setConfirm("CONFIRM", "Are you sure you want to save?")
        thisConfirmBox.showConfirmBox()
    End Sub

    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        thisConfirmBox.setModalType("ClearField")
        thisConfirmBox.setConfirm("CONFIRM", "Are you sure you want to clear?")
        thisConfirmBox.showConfirmBox()
    End Sub

    Public Sub clearField()
        txtPersonnelName.Text = ""
        txtPersonnelDetails.Text = ""
        ddlUserRole.SelectedIndex = 0
        ddlDivision.SelectedIndex = 0
        rblIsActive.SelectedValue = "Y"
    End Sub

    Public Sub saveRecord()
        With _clsRefPersonnel
            If btnSave.Text = "Save" Then
                .personnelId = ""
            Else
                .personnelId = hfTransId.Value
            End If
            .personnelName = txtPersonnelName.Text
            .personnelDetails = txtPersonnelDetails.Text
            .personnelRoleId = ddlUserRole.SelectedValue
            .divisionId = ddlDivision.SelectedValue
            .isActive = rblIsActive.SelectedValue
            .lastUser = Session("UserName")
            .saveRefPersonnels()
        End With

        Session("refPersonnel_msg") = "Saved"
        Response.Redirect("refPersonnel.aspx")
    End Sub

#End Region



End Class


