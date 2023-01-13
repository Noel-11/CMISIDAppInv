﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="adminUserPermissionAdd.aspx.vb" Inherits="Secured_UserAdmin_adminUserPermissionAdd" Theme="Skins" %>

<!DOCTYPE html>

<%@ Register Src="~/Include/wucConfirmBoxBS.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>
<%@ Register Src="~/Include/sHeader.ascx" TagName="sHeader" TagPrefix="uc1" %>
<%@ Register Src="~/Include/sFooter.ascx" TagName="sFooter" TagPrefix="uc3" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Permission</title>
    <link rel="Shortcut Icon" href="~/favicon.ico" type="image/x-icon" />
    <script src="../../Scripts/jquery-1.12.4.min.js"></script>
    <link href="../../Scripts/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../../Scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</head>

<body>
    <br />
    <form id="form1" role="form" method="post" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="container" style="width: 100%">
            <%--DOCUMENT ENTRY --%>

            <div class="panel panel-primary">
                <div class="panel-heading" style="text-align: center">
                    <button runat="server" onserverclick="btnHome_Click" type="button" id="btnHome" class="btn btn-info btn-default pull-left" causesvalidation="false"><span class="glyphicon glyphicon-backward">&nbsp;BACK</span> </button>
                    <asp:Label runat="server" ID="Label2" Text="User Permission" SkinID="lblPageTitle"></asp:Label>
                </div>
                <div class="panel-body">


                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">User ID  </span>
                            <asp:TextBox runat="server" ID="txtUserID" ReadOnly="true" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="User ID" trigger="hover"></asp:TextBox>
                        </div>
                    </div>

                    <asp:GridView runat="server" ID="_gv" HeaderStyle-Font-Size="11px" CssClass="gridviewGray" PageSize="15"
                        PagerStyle-CssClass="pgr" AutoGenerateColumns="false" AllowSorting="true"
                        GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="false">
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

                            <asp:TemplateField HeaderText="Discount" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="chkReport" Checked='<%# Bind("can_report")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%-- <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="chkDelete" Checked='<%# Bind("can_delete") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                       
                            <asp:TemplateField HeaderText="Export" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="chkExport" Checked='<%# Bind("can_export") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="modal-footer">

                    <asp:Button runat="server" ID="btnSave" class="btn btn-primary btn-lg" Text="Save" ValidationGroup="DOC" />
                    <asp:Button runat="server" ID="btnCancel" class="btn btn-danger btn-lg" Text="Cancel" CausesValidation="false" />

                </div>
            </div>
            <%--DOCUMENT ENTRY END --%>
        </div>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField runat="server" ID="hfTransid"></asp:HiddenField>
                <asp:HiddenField runat="server" ID="hfRoleId"></asp:HiddenField>
                <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <div>
            <uc1:sHeader ID="sHeader1" runat="server" />
        </div>
        <div>
            <uc3:sFooter ID="sFooter1" runat="server" />
        </div>

    </form>

</body>

</html>
