<%@ Page Title="User Permission" Language="VB" AutoEventWireup="false" CodeFile="UserPermissionAdd.aspx.vb" Inherits="Secured_SystemAdministration_UserPermissionAdd" Theme="Skins" MasterPageFile="~/MasterPage/Admin.master" %>


<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
    
<div class="card">
    <asp:UpdatePanel ID="updatePanel2" runat="server">
        <ContentTemplate>
            <div class="card-header" style="text-align: center" align="left">
                <button runat="server" onserverclick="btnHome_Click" type="button" id="btnHome" class="btn btn-primary" causesvalidation="false">BACK </button>
                <asp:Label runat="server" ID="Label2" Text="User Permission" class="form-label" Style="font-size: 20px;"></asp:Label>
            </div>
            <div class="card-body" style="background-color: #f8f9fa;">

                <asp:Label runat="server" ID="lblUserId" Text=""></asp:Label>:
                    <asp:Label runat="server" ID="lblName" SkinID="lbl11B"> </asp:Label>

                <asp:GridView runat="server" ID="_gv" SkinID="gvNoPaging">
                    <Columns>
                        <asp:BoundField DataField="menu_type" HeaderText="" />
                        <asp:BoundField DataField="menu_id" HeaderText="" />
                        <asp:BoundField DataField="page_url" HeaderText="" />
                        <asp:BoundField DataField="menu_name" HeaderText="Module/Forms" />
                        <asp:TemplateField HeaderText="Access" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkAccess" Checked='<%# Bind("can_access") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Create" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkCreate" Checked='<%# Bind("can_create") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkUpdate" Checked='<%# Bind("can_update") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkDelete" Checked='<%# Bind("can_delete") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Report" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkReport" Checked='<%# Bind("can_report") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Export" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkExport" Checked='<%# Bind("can_export") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>

            <div class="modal-footer">
                <asp:Button runat="server" ID="btnSave" class="btn btn-primary btn-lg" Text="Save" ValidationGroup="DOC" />
                <asp:Button runat="server" ID="btnCancel" class="btn btn-danger btn-lg" Text="Cancel" CausesValidation="false" />

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>



<asp:UpdatePanel ID="updatePanel1" runat="server">
    <ContentTemplate>
        <asp:HiddenField runat="server" ID="hfTransid"></asp:HiddenField>
        <asp:HiddenField runat="server" ID="hfRoleId"></asp:HiddenField>
        <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>






