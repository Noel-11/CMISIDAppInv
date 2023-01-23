Imports Microsoft.VisualBasic
Imports System.Data

Public Class clsApplicationVersion


    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property applicationVersionId As String

    Public Property applicationId As String

    Public Property applicationVersionStartDate As String

    Public Property applicationVersionEndDate As String

    Public Property applicationFeatures As String

    Public Property deploymentLetterUrl As String

    Public Property systemAnalysisDesignUrl As String

    Public Property deploymentAgreementUrl As String

    Public Property versionNo As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region

    Public Sub initialize()
        _applicationVersionId = ""
        _applicationId = ""
        _applicationVersionStartDate = ""
        _applicationVersionEndDate = ""
        _applicationFeatures = ""
        _deploymentLetterUrl = ""
        _systemAnalysisDesignUrl = ""
        _deploymentAgreementUrl = ""
        _versionNo = "1.0.0"
        _isActive = "Y"
        _createUser = ""
        _createDate = ""
        _lastUser = ""
        _lastDate = ""
    End Sub


    Public Function browseApplicationVersion(ByVal _thisID As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT  tbl_application_version.application_version_id, tbl_application_version.version_no, application_features, " & _
              "GROUP_CONCAT(CASE WHEN personnel_role_id = 'DEVELOPER' THEN personnel_name ELSE NULL END) AS developer, " & _
              "GROUP_CONCAT(CASE WHEN personnel_role_id = 'PROJECT MANAGER' THEN personnel_name ELSE NULL END) AS projectManager, " & _
              "application_version_start_date, application_version_end_date, CONCAT('(',system_analysis_design_url,') (',deployment_agreement_url,') (',deployment_letter_url,')') AS appLinks " & _
              "FROM tbl_application_version " & _
              "INNER JOIN tbl_application_assigned_personnel ON tbl_application_version.application_version_id = tbl_application_assigned_personnel.application_version_id " & _
              "INNER JOIN tbl_ref_personnels ON tbl_application_assigned_personnel.personnel_id = tbl_ref_personnels.personnel_id " & _
              "WHERE tbl_application_version.is_active = 'Y' AND tbl_application_version.application_id = '" & _thisID & "' " & _
              "GROUP BY tbl_application_version.application_version_id " & _
              "ORDER BY tbl_application_version.version_no DESC "

        Return _clsDB.Fill_DataTable(sql, "tbl_application_version")
    End Function

    Public Sub saveApplicationVersion()
        'If applicationVersionId = "" Then
        With _clsDB.dbUtility
            .fieldItems = "application_version_id,application_id,application_version_start_date,application_version_end_date,application_features,deployment_letter_url,system_analysis_design_url,deployment_agreement_url,version_no,is_active,create_user,create_date"
            .sqlString = .getSQLStatement("tbl_application_version", "INSERT")
            ' _applicationVersionId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
            .ADDPARAM_CMD_String("application_version_id", _applicationVersionId)
            .ADDPARAM_CMD_String("application_id", _applicationId)
            .ADDPARAM_CMD_String("application_version_start_date", _applicationVersionStartDate)
            .ADDPARAM_CMD_String("application_version_end_date", _applicationVersionEndDate)
            .ADDPARAM_CMD_String("application_features", _applicationFeatures)
            .ADDPARAM_CMD_String("deployment_letter_url", _deploymentLetterUrl)
            .ADDPARAM_CMD_String("system_analysis_design_url", _systemAnalysisDesignUrl)
            .ADDPARAM_CMD_String("deployment_agreement_url", _deploymentAgreementUrl)
            .ADDPARAM_CMD_String("version_no", _versionNo)
            .ADDPARAM_CMD_String("is_active", _isActive)
            .ADDPARAM_CMD_String("create_user", _lastUser)
            .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
            .executeUsingCommandFromSQL(True)
        End With
        'Else
        '    With _clsDB.dbUtility
        '        .fieldItems = "application_id,application_version_start_date,application_version_end_date,application_features,deployment_letter_url,system_analysis_design_url,deployment_agreement_url,version_no,is_active,last_user,last_date"
        '        .sqlString = .getSQLStatement("tbl_application_version", "UPDATE", "application_version_id")
        '        .ADDPARAM_CMD_String("application_id", _applicationId)
        '        .ADDPARAM_CMD_String("application_version_start_date", _applicationVersionStartDate)
        '        .ADDPARAM_CMD_String("application_version_end_date", _applicationVersionEndDate)
        '        .ADDPARAM_CMD_String("application_features", _applicationFeatures)
        '        .ADDPARAM_CMD_String("deployment_letter_url", _deploymentLetterUrl)
        '        .ADDPARAM_CMD_String("system_analysis_design_url", _systemAnalysisDesignUrl)
        '        .ADDPARAM_CMD_String("deployment_agreement_url", _deploymentAgreementUrl)
        '        .ADDPARAM_CMD_String("version_no", _versionNo)
        '        .ADDPARAM_CMD_String("is_active", _isActive)
        '        .ADDPARAM_CMD_String("last_user", _lastUser)
        '        .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
        '        .ADDPARAM_CMD_String("application_version_id", _applicationVersionId)
        '        .executeUsingCommandFromSQL(True)
        '    End With
        'End If
    End Sub

    Public Sub updateApplicationVersion()
        With _clsDB.dbUtility
            .fieldItems = "application_id,application_version_start_date,application_version_end_date,application_features,deployment_letter_url,system_analysis_design_url,deployment_agreement_url,version_no,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_application_version", "UPDATE", "application_version_id")
            .ADDPARAM_CMD_String("application_id", _applicationId)
            .ADDPARAM_CMD_String("application_version_start_date", _applicationVersionStartDate)
            .ADDPARAM_CMD_String("application_version_end_date", _applicationVersionEndDate)
            .ADDPARAM_CMD_String("application_features", _applicationFeatures)
            .ADDPARAM_CMD_String("deployment_letter_url", _deploymentLetterUrl)
            .ADDPARAM_CMD_String("system_analysis_design_url", _systemAnalysisDesignUrl)
            .ADDPARAM_CMD_String("deployment_agreement_url", _deploymentAgreementUrl)
            .ADDPARAM_CMD_String("version_no", _versionNo)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("application_version_id", _applicationVersionId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub


    Public Sub getApplicationVersion(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_application_version WHERE application_version_id='" & _id & "' LIMIT 1")
        If dt.Rows.Count > 0 Then
            _applicationVersionId = dt.Rows(0)("application_version_id").ToString
            _applicationId = dt.Rows(0)("application_id").ToString
            _applicationVersionStartDate = dt.Rows(0)("application_version_start_date").ToString
            _applicationVersionEndDate = dt.Rows(0)("application_version_end_date").ToString
            _applicationFeatures = dt.Rows(0)("application_features").ToString
            _deploymentLetterUrl = dt.Rows(0)("deployment_letter_url").ToString
            _systemAnalysisDesignUrl = dt.Rows(0)("system_analysis_design_url").ToString
            _deploymentAgreementUrl = dt.Rows(0)("deployment_agreement_url").ToString
            _versionNo = dt.Rows(0)("version_no").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

    Public Sub getApplicationVersionCurrent(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_application_version WHERE application_id='" & _id & "' ORDER BY version_no DESC LIMIT 1")
        If dt.Rows.Count > 0 Then
            _applicationVersionId = dt.Rows(0)("application_version_id").ToString
            _applicationId = dt.Rows(0)("application_id").ToString
            _applicationVersionStartDate = dt.Rows(0)("application_version_start_date").ToString
            _applicationVersionEndDate = dt.Rows(0)("application_version_end_date").ToString
            _applicationFeatures = dt.Rows(0)("application_features").ToString
            _deploymentLetterUrl = dt.Rows(0)("deployment_letter_url").ToString
            _systemAnalysisDesignUrl = dt.Rows(0)("system_analysis_design_url").ToString
            _deploymentAgreementUrl = dt.Rows(0)("deployment_agreement_url").ToString
            _versionNo = dt.Rows(0)("version_no").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

End Class
