Imports Microsoft.VisualBasic
Imports System.Data
Public Class clsRefClients


    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property clientId As String

    Public Property clientName As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region


    Public Sub initialize()
        _clientId = ""
        _clientName = ""
        _isActive = ""
        _createUser = ""
        _createDate = ""
        _lastUser = ""
        _lastDate = ""
    End Sub


    Public Function browseRefClients(ByVal _criteria As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT * FROM tbl_ref_clients " & _
        " WHERE  client_name LIKE '%" & _criteria & "%' ORDER BY client_name "
        Return _clsDB.Fill_DataTable(sql, "tbl_ref_clients")
    End Function


    Public Sub saveRefClients()
        If clientId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "client_id,client_name,is_active,create_user,create_date"
                .sqlString = .getSQLStatement("tbl_ref_clients", "INSERT")
                _clientId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
                .ADDPARAM_CMD_String("client_id", _clientId)
                .ADDPARAM_CMD_String("client_name", _clientName)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "client_name,is_active,last_user,last_date"
                .sqlString = .getSQLStatement("tbl_ref_clients", "UPDATE", "client_id")
                .ADDPARAM_CMD_String("client_name", _clientName)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("last_user", _lastUser)
                .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
                .ADDPARAM_CMD_String("client_id", _clientId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub


    Public Sub getRefClients(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_ref_clients WHERE client_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _clientId = dt.Rows(0)("client_id").ToString
            _clientName = dt.Rows(0)("client_name").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

End Class
