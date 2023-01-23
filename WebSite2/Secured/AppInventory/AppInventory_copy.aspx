<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AppInventory_copy.aspx.vb" Inherits="Secured_AppInventory_AppInventory" MasterPageFile="~/MasterPage/Admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
    <h2 class="text-uppercase">Application Inventory<span runat="server" id="spanAppType"></span></h2>

    <div class="row">
        <div class="col-md-12 mb-3">
            <asp:Label runat="server" ID="lblApplicationNameLabel">Application Name</asp:Label>
            <span style="color: red; font-size: 20px">*</span>
            <asp:TextBox runat="server" ID="txtSearch" CssClass="input-field form-control mb-3" Style="text-transform: uppercase" MaxLength="100" placeholder=""></asp:TextBox>
            <button runat="server" class="btn btn-success" onserverclick="btnSearch_Click" id="btnSearch"><span class="glyphicon glyphicon-filter"></span>&nbsp;Filter</button>
        </div>
    </div>

    <asp:GridView runat="server" ID="_gv" HeaderStyle-Font-Size="11px" CssClass="table table-row-bordered table-row-dashed gy-5" PageSize="15" EmptyDataText="NO RECORD FOUND"
        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
        GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="true">
        <Columns>
            <asp:BoundField DataField="application_name" HeaderText="Application Name" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="application_version" HeaderText="Version No." ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="last_date" HeaderText="Last Update" ItemStyle-Width="50%" HeaderStyle-HorizontalAlign="Center" />
         
        </Columns>
    </asp:GridView>

</asp:Content>
