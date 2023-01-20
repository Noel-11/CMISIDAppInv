<%@ Page Title="User Permission" Language="VB" AutoEventWireup="false" CodeFile="UserPermission.aspx.vb" Inherits="Secured_SystemAdministration_UserPermission" Theme="Skins" MasterPageFile="~/MasterPage/Admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header" style="text-align: center">
                <asp:Label runat="server" ID="Label1" CssClass="card-title" Text="User Permission" ></asp:Label>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12 mb-3">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-text">Search </span>
                                <asp:TextBox runat="server" CssClass="form-control" Style="z-index: 0; text-transform: uppercase;" ID="txtSearch"></asp:TextBox>
                                <button runat="server" class="btn btn-success" onserverclick="btnSearch_Click"><span class="glyphicon glyphicon-filter"></span>&nbsp;Filter</button>

                            </div>

                        </div>
                    </div>
                    <div class="col-lg-12">
                        <span class="input-group-addon" style="background-color: white">
                            <asp:Label runat="server" ID="lblPaging" CssClass="pull-right "></asp:Label>
                        </span>
                    </div>

                </div>

                <asp:GridView runat="server" ID="_gv" CssClass="table table-row-bordered table-row-dashed gy-5" SkinID="gvDefault">
                    <Columns>
                        <asp:TemplateField HeaderText="Employee ID" HeaderStyle-Width="10%">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkGV" SkinID="lnkButton" OnCommand="cmdGVUpdate"
                                    CommandArgument='<%# bind("user_id")%>' Text='<%# bind("user_id") %>' ToolTip="Click to View/Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="user_name" HeaderText="User Name" ItemStyle-Width="30%" />
                    </Columns>
                </asp:GridView>

            </div>
        </div>

    </div>
</asp:Content>





