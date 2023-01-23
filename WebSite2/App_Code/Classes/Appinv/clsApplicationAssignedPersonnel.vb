Imports Microsoft.VisualBasic
Imports System.Data

Public Class clsApplicationAssignedPersonnel
    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property applicationAssisgnedPersonnelId As String

    Public Property applicationVersionId As String

    Public Property personnelId As String

    Public Property isActive As String

    Public Property createDate As String

    Public Property createUser As String

    Public Property lastDate As String

    Public Property lastUser As String

#End Region


    Public Sub initialize()
        _applicationAssisgnedPersonnelId = ""
        _applicationVersionId = ""
        _personnelId = ""
        _isActive = "Y"
        _createDate = ""
        _createUser = ""
        _lastDate = ""
        _lastUser = ""
    End Sub


    Public Function browseApplicationAssignedPersonnel(ByVal _thisId As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT application_assisgned_personnel_id,tbl_application_assigned_personnel.personnel_id, personnel_name, user_role_description FROM tbl_application_assigned_personnel " & _
              "INNER JOIN tbl_ref_personnels ON tbl_application_assigned_personnel.personnel_id = tbl_ref_personnels.personnel_id " & _
              "INNER JOIN tbl_user_role ON tbl_ref_personnels.personnel_role_id = tbl_user_role.user_role_id " & _
              "WHERE tbl_application_assigned_personnel.is_active = 'Y' AND tbl_application_assigned_personnel.application_version_id = '" & _thisId & "' ORDER BY personnel_name"

        Return _clsDB.Fill_DataTable(sql, "tbl_application_assigned_personnel")
    End Function


    Public Sub saveApplicationAssignedPersonnel()
        If applicationAssisgnedPersonnelId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "application_assisgned_personnel_id,application_version_id,personnel_id,is_active,create_date,create_user"
                .sqlString = .getSQLStatement("tbl_application_assigned_personnel", "INSERT")
                _applicationAssisgnedPersonnelId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
                .ADDPARAM_CMD_String("application_assisgned_personnel_id", _applicationAssisgnedPersonnelId)
                .ADDPARAM_CMD_String("application_version_id", _applicationVersionId)
                .ADDPARAM_CMD_String("personnel_id", _personnelId)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "application_version_id,personnel_id,is_active,last_date,last_user"
                .sqlString = .getSQLStatement("tbl_application_assigned_personnel", "UPDATE", "application_assisgned_personnel_id")
                .ADDPARAM_CMD_String("application_version_id", _applicationVersionId)
                .ADDPARAM_CMD_String("personnel_id", _personnelId)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
                .ADDPARAM_CMD_String("last_user", _lastUser)
                .ADDPARAM_CMD_String("application_assisgned_personnel_id", _applicationAssisgnedPersonnelId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub


    Public Sub getApplicationAssignedPersonnel(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_application_assigned_personnel WHERE application_assisgned_personnel_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _applicationAssisgnedPersonnelId = dt.Rows(0)("application_assisgned_personnel_id").ToString
            _applicationVersionId = dt.Rows(0)("application_version_id").ToString
            _personnelId = dt.Rows(0)("personnel_id").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

End Class
