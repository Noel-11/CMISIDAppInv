Imports System.Data
Partial Class Secured_Reference_refDivision
    Inherits cPageInit_Secured_BS

    Dim _clsRefDivision As New clsRefDivision
    Dim _dtGV As New DataTable
    Dim _btnOK As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            fillGridView()




            If Session("refDiv_msg") <> "" Then
                thisConfirmBox.setInfo("Division", "Successfully Saved/Updated!")
                thisConfirmBox.showConfirmBox()

                Session("refDiv_msg") = ""
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
    Protected Sub btnSearch_Click1(sender As Object, e As EventArgs) Handles btnSearch.Click
        fillGridView()
    End Sub
   
    Protected Sub fillGridView()
        _dtGV = _clsRefDivision.browseRefDivision(txtSearch.Text.Trim)
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
        With _clsRefDivision
            .getRefDivision(hfTransId.Value)
            txtAbbreviation.Text = .abbreviation
            txtDivisionName.Text = .divisionName
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
        txtAbbreviation.Text = ""
        txtDivisionName.Text = ""
        rblIsActive.SelectedValue = "Y"
    End Sub

    Public Sub saveRecord()
        With _clsRefDivision
            If btnSave.Text = "Save" Then
                .divisionId = ""
            Else
                .divisionId = hfTransId.Value
            End If

            .abbreviation = txtAbbreviation.Text.Trim.ToUpper
            .divisionName = txtDivisionName.Text.Trim.ToUpper
            .isActive = rblIsActive.SelectedValue
            .lastUser = Session("UserName")
            .saveRefDivision()
        End With

        Session("refDiv_msg") = "Saved"
        Response.Redirect("refDivision.aspx")
        'ScriptManager.RegisterStartupScript(Page, Page.GetType(), "pnlEdit", "var myModal = new bootstrap.Modal(document.getElementById('pnlEdit'), {});  myModal.show('hide');", True)
    End Sub

#End Region

    
  
End Class

