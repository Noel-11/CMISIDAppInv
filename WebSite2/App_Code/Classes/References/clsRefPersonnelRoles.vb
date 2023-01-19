Imports Microsoft.VisualBasic
Imports System.Data
Public Class clsRefPersonnelRoles

    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property personnelRoleId As String

    Public Property personnelRoleName As String

    Public Property personnelRoleDescription As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region


    Public Sub initialize()
        _personnelRoleId = ""
        _personnelRoleName = ""
        _personnelRoleDescription = ""
        _isActive = "Y"
        _createUser = ""
        _createDate = ""
        _lastUser = ""
        _lastDate = ""
    End Sub


    Public Function browseRefPersonnelRole(ByVal _criteria As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT * FROM tbl_ref_personnel_role " & _
        " WHERE  personnel_role_name LIKE '%" & _criteria & "%' OR personnel_role_description LIKE '%" & _criteria & "%'   ORDER BY personnel_role_name "
        Return _clsDB.Fill_DataTable(sql, "tbl_ref_personnel_role")
    End Function


    Public Sub saveRefPersonnelRole()
        If personnelRoleId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "personnel_role_id,personnel_role_name,personnel_role_description,is_active,create_user,create_date"
                .sqlString = .getSQLStatement("tbl_ref_personnel_role", "INSERT")
                _personnelRoleId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
                .ADDPARAM_CMD_String("personnel_role_id", _personnelRoleId)
                .ADDPARAM_CMD_String("personnel_role_name", _personnelRoleName)
                .ADDPARAM_CMD_String("personnel_role_description", _personnelRoleDescription)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "personnel_role_name,personnel_role_description,is_active,last_user,last_date"
                .sqlString = .getSQLStatement("tbl_ref_personnel_role", "UPDATE", "personnel_role_id")
                .ADDPARAM_CMD_String("personnel_role_name", _personnelRoleName)
                .ADDPARAM_CMD_String("personnel_role_description", _personnelRoleDescription)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("last_user", _lastUser)
                .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
                .ADDPARAM_CMD_String("personnel_role_id", _personnelRoleId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub


    Public Sub getRefPersonnelRole(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_ref_personnel_role WHERE personnel_role_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _personnelRoleId = dt.Rows(0)("personnel_role_id").ToString
            _personnelRoleName = dt.Rows(0)("personnel_role_name").ToString
            _personnelRoleDescription = dt.Rows(0)("personnel_role_description").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub


End Class
