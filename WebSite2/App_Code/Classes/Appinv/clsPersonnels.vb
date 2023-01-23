Imports Microsoft.VisualBasic
Imports System.Data

Public Class clsPersonnels
    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property personnelId As String

    Public Property personnelName As String

    Public Property personnelDetails As String

    Public Property personnelRoleId As String

    Public Property divisionId As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region


    Public Sub initialize()
        _personnelId = ""
        _personnelName = ""
        _personnelDetails = ""
        _personnelRoleId = ""
        _divisionId = ""
        _isActive = "Y"
        _createUser = ""
        _createDate = ""
        _lastUser = ""
        _lastDate = ""
    End Sub


    Public Function browsePersonnels(ByVal _criteria As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT personnel_id, personnel_name, personnel_details, personnel_role_id, division_id, is_active, create_user, create_date, last_user, last_date, FROM tbl_ref_personnels " & _
        " WHERE personnel_id LIKE '%" & _criteria & "%' OR personnel_name LIKE '%" & _criteria & "%' OR personnel_details LIKE '%" & _criteria & "%' OR personnel_role_id LIKE '%" & _criteria & "%' OR division_id LIKE '%" & _criteria & "%' OR is_active LIKE '%" & _criteria & "%' OR create_user LIKE '%" & _criteria & "%' OR create_date LIKE '%" & _criteria & "%' OR last_user LIKE '%" & _criteria & "%' OR last_date LIKE '%" & _criteria & "%' OR  ORDER BY "
        Return _clsDB.Fill_DataTable(sql, "tbl_ref_personnels")
    End Function

    Public Sub savePersonnels()
        If personnelId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "personnel_id,personnel_name,personnel_details,personnel_role_id,division_id,is_active,create_user,create_date"
                .sqlString = .getSQLStatement("tbl_ref_personnels", "INSERT")
                _personnelId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
                .ADDPARAM_CMD_String("personnel_id", _personnelId)
                .ADDPARAM_CMD_String("personnel_name", _personnelName)
                .ADDPARAM_CMD_String("personnel_details", _personnelDetails)
                .ADDPARAM_CMD_String("personnel_role_id", _personnelRoleId)
                .ADDPARAM_CMD_String("division_id", _divisionId)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "personnel_name,personnel_details,personnel_role_id,division_id,is_active,last_user,last_date"
                .sqlString = .getSQLStatement("tbl_ref_personnels", "UPDATE", "personnel_id")
                .ADDPARAM_CMD_String("personnel_name", _personnelName)
                .ADDPARAM_CMD_String("personnel_details", _personnelDetails)
                .ADDPARAM_CMD_String("personnel_role_id", _personnelRoleId)
                .ADDPARAM_CMD_String("division_id", _divisionId)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("last_user", _lastUser)
                .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
                .ADDPARAM_CMD_String("personnel_id", _personnelId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub




    Public Sub getPersonnels(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_ref_personnels WHERE personnel_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _personnelId = dt.Rows(0)("personnel_id").ToString
            _personnelName = dt.Rows(0)("personnel_name").ToString
            _personnelDetails = dt.Rows(0)("personnel_details").ToString
            _personnelRoleId = dt.Rows(0)("personnel_role_id").ToString
            _divisionId = dt.Rows(0)("division_id").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

End Class
