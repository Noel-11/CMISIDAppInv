Imports System.Data
Imports Microsoft.Reporting.WebForms

Partial Class Secured_Reports_rptReports
    Inherits cPageInit_Secured_BS

    Dim _clsRefPersonnel As New clsRefPersonnel
    Dim _dtGV As New DataTable
    Dim _clsDB As New clsDatabase

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            Dim sql As String = ""

            _clsDB.populateDDLB(ddlPersonnel, "personnel_name", "personnel_id", "tbl_ref_personnels", "personnel_name", " WHERE is_active='Y'", "ALL", "")


            _clsDB.populateDDLB(ddlClient, "client_name", "client_id", "tbl_ref_clients", "client_name", " WHERE is_active='Y'", "ALL", "")

            txtDateFrom.Text = CDate(Date.Now).ToString("yyyy-MM-dd")
            txtDateTo.Text = CDate(Date.Now).ToString("yyyy-MM-dd")
        End If

    End Sub

    Protected Sub btnRetrieve_Click(sender As Object, e As EventArgs) Handles btnRetrieve.Click
        ' Variables
        Dim warnings() As Warning = Nothing
        Dim streamIds() As String = Nothing
        Dim mimeType As String = String.Empty
        Dim encoding As String = String.Empty
        Dim extension As String = String.Empty

        Dim rvPrint As ReportViewer = New ReportViewer
        rvPrint.ProcessingMode = ProcessingMode.Local
        Dim datasource As New ReportDataSource

        rvPrint.LocalReport.ReportPath = Server.MapPath("~/Secured/Reports/rdlc/rptListOfApplication.rdlc")
        datasource = New ReportDataSource("ds_details", getReport)

        Dim dateFrom As ReportParameter = New ReportParameter("dateFrom", txtDateFrom.Text)
        Dim dateTo As ReportParameter = New ReportParameter("dateTo", txtDateTo.Text)

        rvPrint.LocalReport.SetParameters(New ReportParameter() {dateFrom, dateTo})

        rvPrint.LocalReport.DataSources.Clear()
        rvPrint.LocalReport.DataSources.Add(datasource)
        rvPrint.LocalReport.Refresh()

        Dim bytes() As Byte = rvPrint.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamIds, warnings)

        Session("pdfBytes") = bytes

        ltEmbed.Text = String.Format("<object data=""{0}{1}"" type=""application/pdf"" width=""100%"" height=""1400px""></object>", ResolveUrl("~/ReportHandler.ashx"), "")
    End Sub



    Public Function getReport() As DataTable
        Dim dt As New DataTable
        Dim sql As String = ""

        Dim _where As String = ""

        If ddlPersonnel.SelectedValue <> "" Then
            _where = " AND personnel_id = '" & ddlPersonnel.SelectedValue & "'"
        End If

        If ddlClient.SelectedValue <> "" Then
            _where = _where & " AND client_id = '" & ddlClient.SelectedValue & "'"
        End If

        sql = "SELECT application_name,application_details,application_url,DATE_FORMAT(application_start_date ,'%m-%d-%Y') as application_start_date,DATE_FORMAT(application_deployment_date,'%m-%d-%Y') AS application_end_date,application_version,application_status,client_name, personnel_assigned as personnel_name " & _
            "FROM tbl_application " & _
            "INNER JOIN tbl_ref_clients ON tbl_ref_clients.client_id  = tbl_application.client_id " & _
            "INNER JOIN (SELECT GROUP_CONCAT(personnel_name) AS personnel_assigned,application_id FROM tbl_application_version " & _
            "INNER JOIN tbl_application_assigned_personnel ON tbl_application_assigned_personnel.application_version_id = tbl_application_version.application_version_id " & _
            "INNER JOIN tbl_ref_personnels ON tbl_ref_personnels.personnel_id = tbl_application_assigned_personnel.personnel_id) as tbl ON tbl.application_id = tbl_application.application_id   " & _
            "WHERE application_start_date BETWEEN '" & txtDateFrom.Text & "' AND '" & txtDateTo.Text & "' " & _where & " ORDER BY application_name"

        dt = _clsDB.Fill_DataTable(sql)

        Return dt

    End Function

End Class


