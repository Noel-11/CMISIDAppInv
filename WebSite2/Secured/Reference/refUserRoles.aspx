<%@ Page Language="VB" AutoEventWireup="false" CodeFile="refUserRoles.aspx.vb" Inherits="Secured_Reference_refUserRoles" MasterPageFile="~/MasterPage/Admin.master" %>


<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>


            <asp:Panel DefaultButton="btnSearch" runat="server">
                <h2 class="text-uppercase">Personnel Roles<span runat="server" id="spanAppType"></span></h2>

                <div class="row">
                    <div class="col-md-12">
                        <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-primary" Text="Add" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:TextBox runat="server" ID="txtSearch" CssClass="input-field form-control" Style="text-transform: uppercase" MaxLength="100" placeholder=""></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary" Text="Search" />
                        </span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView runat="server" ID="_gv" HeaderStyle-Font-Size="11px" CssClass="" PageSize="15" EmptyDataText="NO RECORD FOUND"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                            GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="true">
                            <Columns>
                                <asp:BoundField DataField="user_role_name" HeaderText="Role Name" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="user_role_description" HeaderText="Description" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="user_role_type" HeaderText="Role Type" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="is_active" HeaderText="Is Active?" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                <asp:TemplateField HeaderText="" HeaderStyle-Width="1%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="lnkEdit" ImageUrl="~/images/edit.png" OnCommand="cmdGVUpdate"
                                            CommandArgument='<%# Bind("user_role_id")%>' ToolTip="Click to View/Edit Record" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <%--modal/s--%>


    <div id="pnlEdit" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content" style="border-top-left-radius: 15px; border-top-right-radius: 15px;">
                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                    <ContentTemplate>
                        <div class="modal-header" style="border-top-left-radius: 10px; border-top-right-radius: 10px; background-color: #3366cc; text-align: center; font-weight: bold; font-size: large; color: black" runat="server" id="div1">
                            <asp:Label runat="server" ID="lbl" Style="font-family: 'Times New Roman'; font-size: x-large; font-weight: bold; color: white" Text="Role Details"></asp:Label>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            <span class="glyphicon glyphicon-alt-list"></span>
                        </div>
                        <div class="modal-body container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-outline mb-4">
                                        <asp:TextBox runat="server" ID="txtPersonnelRoleName" class="form-control form-control-lg" placeholder="Role Name"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-outline mb-4">
                                        <asp:TextBox runat="server" ID="txtPersonnelRoleDescription" class="form-control form-control-lg" placeholder="Description"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-outline mb-4">
                                        <span class="form-group">User Role Type</span>
                                        <asp:DropDownList runat="server" ID="ddlUserRoleType" CssClass="form-control">
                                            <asp:ListItem Value="System"></asp:ListItem>
                                            <asp:ListItem Value="Personnel" Selected="True"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">Is Active? : </span>
                                            <asp:RadioButtonList runat="server" ID="rblIsActive" CssClass="form-control" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="&nbsp;Yes&nbsp;&nbsp;" Value="Y" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="&nbsp;No" Value="N"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button runat="server" ID="btnClear" Width="100%" CssClass="btn btn-danger" Text="Clear" />

                                </div>
                                <div class="col-md-6">
                                    <asp:Button runat="server" ID="btnSave" Width="100%" CssClass="btn btn-primary" Text="Save" ValidationGroup="Save" />
                                </div>
                            </div>

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>



    <asp:UpdatePanel runat="server" ID="upUpdate">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfTransId"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisConfirmBox" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>




