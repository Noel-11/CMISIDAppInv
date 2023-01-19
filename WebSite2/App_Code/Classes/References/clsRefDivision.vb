Imports Microsoft.VisualBasic
Imports System.Data
Public Class clsRefDivision


    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property divisionId As String

    Public Property divisionName As String

    Public Property abbreviation As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region


    Public Sub initialize()
        _divisionId = ""
        _divisionName = ""
        _abbreviation = ""
        _isActive = "Y"
        _createUser = ""
        _createDate = ""
        _lastUser = ""
        _lastDate = ""
    End Sub


    Public Function browseRefDivision(ByVal _criteria As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT * FROM tbl_ref_division " & _
        " WHERE division_name LIKE '%" & _criteria & "%' OR abbreviation LIKE '%" & _criteria & "%' ORDER BY division_name"
        Return _clsDB.Fill_DataTable(sql, "tbl_ref_division")
    End Function


    Public Sub saveRefDivision()
        If divisionId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "division_id,division_name,abbreviation,is_active,create_user,create_date"
                .sqlString = .getSQLStatement("tbl_ref_division", "INSERT")
                _divisionId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
                .ADDPARAM_CMD_String("division_id", _divisionId)
                .ADDPARAM_CMD_String("division_name", _divisionName)
                .ADDPARAM_CMD_String("abbreviation", _abbreviation)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "division_name,abbreviation,is_active,last_user,last_date"
                .sqlString = .getSQLStatement("tbl_ref_division", "UPDATE", "division_id")
                .ADDPARAM_CMD_String("division_name", _divisionName)
                .ADDPARAM_CMD_String("abbreviation", _abbreviation)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("last_user", _lastUser)
                .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
                .ADDPARAM_CMD_String("division_id", _divisionId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub


    Public Sub getRefDivision(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_ref_division WHERE division_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _divisionId = dt.Rows(0)("division_id").ToString
            _divisionName = dt.Rows(0)("division_name").ToString
            _abbreviation = dt.Rows(0)("abbreviation").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

End Class
