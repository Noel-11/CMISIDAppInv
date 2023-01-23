Imports System.Data
Partial Class Secured_AppInventory_AppInventory
    Inherits cPageInit_Secured_BS

    Dim _clsApplication As New clsApplication
    Dim _dtGV As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            fillGridView(txtSearch.Text.Trim)
        End If

    End Sub
    Protected Sub fillGridView(ByVal _strSearch As String)

        _dtGV = _clsApplication.browseApplication(_strSearch.Trim)
        _gv.DataSource = _dtGV
        _gv.DataBind()
       
    End Sub

    Protected Sub _gv_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles _gv.PageIndexChanging
        Session("NewPageIndex") = e.NewPageIndex
        _gv.PageIndex = e.NewPageIndex
        fillGridView(_txtSearch.Text)
        ' _lblPaging.Text = clsLibrary.fnSetCurrentPage(e.NewPageIndex + 1, _dtGV, _gv.PageSize)
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs)
        fillGridView(_txtSearch.Text)
    End Sub

End Class
