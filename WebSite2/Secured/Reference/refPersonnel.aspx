﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="refPersonnel.aspx.vb" Inherits="Secured_Reference_refPersonnel" MasterPageFile="~/MasterPage/Admin.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>


            <asp:Panel DefaultButton="btnSearch" runat="server">
                <h2 class="text-uppercase">Personnel<span runat="server" id="spanAppType"></span></h2>

                <div class="row">
                    <div class="col-md-12 mb-3">
                        <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-primary" Text="Add" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div class="input-group">
                            <asp:TextBox runat="server" ID="txtSearch" CssClass="input-field form-control" Style="text-transform: uppercase" MaxLength="100" placeholder="Search here"></asp:TextBox>
                            <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary" Text="Search" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView runat="server" ID="_gv" HeaderStyle-Font-Size="11px" CssClass="table table-row-bordered table-row-dashed gy-5 table-hover table-striped" PageSize="15" EmptyDataText="NO RECORD FOUND"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                            GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="true">
                            <Columns>
                                <asp:BoundField DataField="personnel_name" HeaderText="Personnel Name" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="personnel_details" HeaderText="Personnel Details" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="division_name" HeaderText="Division" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="user_role_name" HeaderText="Role" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />

                                <asp:BoundField DataField="is_active" HeaderText="Is Active?" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                <asp:TemplateField HeaderText="" HeaderStyle-Width="1%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="lnkEdit" ImageUrl="~/images/edit.png" OnCommand="cmdGVUpdate"
                                            CommandArgument='<%# Bind("personnel_id")%>' ToolTip="Click to View/Edit Record" />
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
                            <asp:Label runat="server" ID="lbl" Style="font-family: 'Times New Roman'; font-size: x-large; font-weight: bold; color: white" Text="Personnel Details"></asp:Label>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            <span class="glyphicon glyphicon-alt-list"></span>
                        </div>
                        <div class="modal-body container-fluid">

                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <div class="form-outline mb-4">
                                        <asp:TextBox runat="server" ID="txtPersonnelName" class="form-control form-control-lg" placeholder="Personnel Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-outline mb-4">
                                        <asp:TextBox runat="server" ID="txtPersonnelDetails" class="form-control form-control-lg" placeholder="Details"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row  mb-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-text" style="font-weight: bold">User Role</span>
                                        <asp:DropDownList runat="server" ID="ddlUserRole" CssClass="form-select"></asp:DropDownList>
                                    </div>

                                </div>
                            </div>
                            <div class="row  mb-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-text" style="font-weight: bold">Division</span>
                                        <asp:DropDownList runat="server" ID="ddlDivision" CssClass="form-select"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>



                            <div class="row  mb-4">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-text">Is Active? : </span>
                                            <asp:RadioButtonList runat="server" ID="rblIsActive" CssClass="form-control" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="&nbsp;Yes&nbsp;&nbsp;" Value="Y" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="&nbsp;No" Value="N"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
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




