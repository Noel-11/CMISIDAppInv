Imports Microsoft.VisualBasic
Imports System.Data
Public Class clsApplication


    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property applicationId As String

    Public Property clientId As String

    Public Property applicationName As String

    Public Property applicationDetails As String

    Public Property applicationUrl As String

    Public Property applicationStartDate As String

    Public Property applicationDeploymentDate As String

    Public Property applicationVersion As String

    Public Property contactPerson As String

    Public Property contactNumber As String

    Public Property contactEmailAddress As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region

    Public Sub initialize()
        _applicationId = ""
        _clientId = ""
        _applicationName = ""
        _applicationDetails = ""
        _applicationUrl = ""
        _applicationStartDate = ""
        _applicationDeploymentDate = ""
        _applicationVersion = "1.0.0"
        _contactPerson = ""
        _contactNumber = ""
        _contactEmailAddress = ""
        _isActive = "Y"
        _createUser = ""
        _createDate = ""
        _lastUser = ""
        _lastDate = ""
    End Sub

    Public Function browseApplication(ByVal _criteria As String) As DataTable

        Dim sql As String = ""

        'sql = "SELECT tbl_application.application_id,tbl_application_version.application_version_id, client_name, application_name, application_details, application_url, application_start_date, application_deployment_date, " & _
        '      "application_version, tbl_application.last_date, GROUP_CONCAT(CASE WHEN personnel_role_id = 'DEVELOPER' THEN personnel_name ELSE NULL END) AS developer, " & _
        '      "GROUP_CONCAT(CASE WHEN personnel_role_id = 'PROJECT MANAGER' THEN personnel_name ELSE NULL END) AS projectManager FROM tbl_application " & _
        '      "INNER JOIN tbl_ref_clients ON tbl_application.client_id = tbl_ref_clients.client_id " & _
        '      "INNER JOIN tbl_application_version ON tbl_application.application_id = tbl_application_version.application_id " & _
        '      "INNER JOIN tbl_application_assigned_personnel ON tbl_application_version.application_version_id = tbl_application_assigned_personnel.application_version_id " & _
        '      "INNER JOIN tbl_ref_personnels ON tbl_application_assigned_personnel.personnel_id = tbl_ref_personnels.personnel_id " & _
        '      "WHERE tbl_application.is_active = 'Y' AND application_name LIKE '%" & _criteria & "%' " & _
        '      "GROUP BY tbl_application.application_id "

        sql = "SELECT tblApplication.application_id,tbl_application_version.application_version_id, client_name, application_name, application_details, application_url, application_start_date, " & _
              "application_deployment_date, version_no AS application_version, tblApplication.last_date, GROUP_CONCAT(CASE WHEN personnel_role_id = 'DEVELOPER' THEN personnel_name ELSE NULL END) AS developer, " & _
              "GROUP_CONCAT(CASE WHEN personnel_role_id = 'PROJECT MANAGER' THEN personnel_name ELSE NULL END) AS projectManager FROM tbl_application AS tblApplication " & _
              "INNER JOIN tbl_ref_clients ON tblApplication.client_id = tbl_ref_clients.client_id " & _
              "INNER JOIN tbl_application_version " & _
              "ON tbl_application_version.application_version_id = " & _
              "(SELECT application_version_id FROM tbl_application_version AS tblVersions " & _
              "WHERE tblVersions.application_id = tblApplication.application_id " & _
              "ORDER BY tblVersions.version_no DESC LIMIT 1 ) " & _
              "INNER JOIN tbl_application_assigned_personnel ON tbl_application_version.application_version_id = tbl_application_assigned_personnel.application_version_id " & _
              "INNER JOIN tbl_ref_personnels ON tbl_application_assigned_personnel.personnel_id = tbl_ref_personnels.personnel_id " & _
              "WHERE tblApplication.is_active = 'Y' AND application_name LIKE '%" & _criteria & "%' " & _
              "GROUP BY tblApplication.application_id " & _
              "ORDER BY tblApplication.application_name"

        Return _clsDB.Fill_DataTable(sql, "tbl_application")

    End Function


    Public Sub saveApplication()
        ' If applicationId = "" Then
        With _clsDB.dbUtility
            .fieldItems = "application_id,client_id,application_name,application_details,application_url,application_start_date,application_deployment_date,application_version,contact_person,contact_number,contact_email_address,is_active,create_user,create_date"
            .sqlString = .getSQLStatement("tbl_application", "INSERT")
            _applicationId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
            .ADDPARAM_CMD_String("application_id", _applicationId)
            .ADDPARAM_CMD_String("client_id", _clientId)
            .ADDPARAM_CMD_String("application_name", _applicationName)
            .ADDPARAM_CMD_String("application_details", _applicationDetails)
            .ADDPARAM_CMD_String("application_url", _applicationUrl)
            .ADDPARAM_CMD_String("application_start_date", _applicationStartDate)
            .ADDPARAM_CMD_String("application_deployment_date", _applicationDeploymentDate)
            .ADDPARAM_CMD_String("application_version", _applicationVersion)
            .ADDPARAM_CMD_String("contact_person", _contactPerson)
            .ADDPARAM_CMD_String("contact_number", _contactNumber)
            .ADDPARAM_CMD_String("contact_email_address", _contactEmailAddress)
            .ADDPARAM_CMD_String("is_active", _isActive)
            .ADDPARAM_CMD_String("create_user", _lastUser)
            .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
            .executeUsingCommandFromSQL(True)
        End With
        'Else
        '    With _clsDB.dbUtility
        '        .fieldItems = "client_id,application_name,application_details,application_url,application_start_date,application_deployment_date,application_version,contact_person,contact_number,contact_email_address,is_active,last_user,last_date"
        '        .sqlString = .getSQLStatement("tbl_application", "UPDATE", "application_id")
        '        .ADDPARAM_CMD_String("client_id", _clientId)
        '        .ADDPARAM_CMD_String("application_name", _applicationName)
        '        .ADDPARAM_CMD_String("application_details", _applicationDetails)
        '        .ADDPARAM_CMD_String("application_url", _applicationUrl)
        '        .ADDPARAM_CMD_String("application_start_date", _applicationStartDate)
        '        .ADDPARAM_CMD_String("application_deployment_date", _applicationDeploymentDate)
        '        .ADDPARAM_CMD_String("application_version", _applicationVersion)
        '        .ADDPARAM_CMD_String("contact_person", _contactPerson)
        '        .ADDPARAM_CMD_String("contact_number", _contactNumber)
        '        .ADDPARAM_CMD_String("contact_email_address", _contactEmailAddress)
        '        .ADDPARAM_CMD_String("is_active", _isActive)
        '        .ADDPARAM_CMD_String("last_user", _lastUser)
        '        .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
        '        .ADDPARAM_CMD_String("application_id", _applicationId)
        '        .executeUsingCommandFromSQL(True)
        '    End With
        'End If
    End Sub

    Public Sub updateApplication()

        With _clsDB.dbUtility
            .fieldItems = "client_id,application_name,application_details,application_url,application_start_date,application_deployment_date,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_application", "UPDATE", "application_id")
            .ADDPARAM_CMD_String("client_id", _clientId)
            .ADDPARAM_CMD_String("application_name", _applicationName)
            .ADDPARAM_CMD_String("application_details", _applicationDetails)
            .ADDPARAM_CMD_String("application_url", _applicationUrl)
            .ADDPARAM_CMD_String("application_start_date", _applicationStartDate)
            .ADDPARAM_CMD_String("application_deployment_date", _applicationDeploymentDate)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("application_id", _applicationId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub


    Public Sub updateContactDetails()

        With _clsDB.dbUtility
            .fieldItems = "contact_person,contact_number,contact_email_address,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_application", "UPDATE", "application_id")
            .ADDPARAM_CMD_String("contact_person", _contactPerson)
            .ADDPARAM_CMD_String("contact_number", _contactNumber)
            .ADDPARAM_CMD_String("contact_email_address", _contactEmailAddress)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("application_id", _applicationId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub


    Public Sub getApplication(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_application WHERE application_id='" & _id & "' LIMIT 1")
        If dt.Rows.Count > 0 Then
            _applicationId = dt.Rows(0)("application_id").ToString
            _clientId = dt.Rows(0)("client_id").ToString
            _applicationName = dt.Rows(0)("application_name").ToString
            _applicationDetails = dt.Rows(0)("application_details").ToString
            _applicationUrl = dt.Rows(0)("application_url").ToString
            _applicationStartDate = dt.Rows(0)("application_start_date").ToString
            _applicationDeploymentDate = dt.Rows(0)("application_deployment_date").ToString
            _applicationVersion = dt.Rows(0)("application_version").ToString
            _contactPerson = dt.Rows(0)("contact_person").ToString
            _contactNumber = dt.Rows(0)("contact_number").ToString
            _contactEmailAddress = dt.Rows(0)("contact_email_address").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

End Class
