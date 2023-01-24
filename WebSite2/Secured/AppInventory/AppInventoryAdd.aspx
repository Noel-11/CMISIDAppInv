<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AppInventoryAdd.aspx.vb" Inherits="Secured_AppInventory_AppInventoryAdd" MasterPageFile="~/MasterPage/Admin.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
    <h2 class="text-uppercase">New Application<span runat="server" id="spanAppType"></span></h2>

    <div class="row">
        <div class="col-md-6 mb-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="lblApplicationNameLabel">Application Name</asp:Label>
                    <span style="color: red; font-size: 20px">*</span>
                    <asp:TextBox runat="server" ID="txtApplicationName" CssClass="input-field form-control" Style="text-transform: uppercase" MaxLength="100" placeholder=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtApplicationName" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <asp:Label runat="server" ID="Label1">Start Date</asp:Label>
                    <input type="date" class="form-control" runat="server" id="dtpStartDate" autoclose="true" style="z-index: 0; background-color: white;" aria-orientation="horizontal" />
                    <%--<asp:TextBox runat="server" ID="txtStartDate" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>--%>
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Label runat="server" ID="Label2">Deployment Date</asp:Label>
                    <input type="date" class="form-control" runat="server" id="dtpDeploymentDate" autoclose="true" style="z-index: 0; background-color: white;" aria-orientation="horizontal" />
                    <%--<asp:TextBox runat="server" ID="txtDeploymentDate" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>--%>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="Label3">Client Department/Office/Unit</asp:Label>
                    <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlDepartment">
                    </asp:DropDownList>
                </div>
            </div>

        </div>

        <div class="col-md-6 mb-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="Label5">Description</asp:Label>
                    <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" Rows="8" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12 mb-3">
            <asp:Label runat="server" ID="Label4">Application URL</asp:Label>
            <asp:TextBox runat="server" ID="txtUrl" CssClass="input-field form-control" Style="text-transform: none;" placeholder=""></asp:TextBox>
        </div>
        <div class="col-md-6 mb-3" runat="server" visible="false">
            <asp:Label runat="server" ID="Label6">Trello(Link)</asp:Label>
            <asp:TextBox runat="server" ID="txtTrelloLink" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
        </div>
    </div>

    <span>Contact Details</span>

    <div class="row">
        <div class="col-md-4 mb-3">
            <asp:Label runat="server" ID="Label7">Contact Person</asp:Label>
            <asp:TextBox runat="server" ID="txtContactPerson" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
        </div>
        <div class="col-md-4 mb-3">
            <asp:Label runat="server" ID="Label8">Contact Number</asp:Label>
            <asp:TextBox runat="server" ID="txtContactNumber" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
        </div>
        <div class="col-md-4 mb-3">
            <asp:Label runat="server" ID="Label9">Email Address</asp:Label>
            <asp:TextBox runat="server" ID="txtContactEmailAddress" CssClass="input-field form-control" Style="text-transform: none" placeholder=""></asp:TextBox>
        </div>
    </div>

    <span>Version Details</span>
    <p>New application will automatically get a version no. 1.0.0</p>

    <div class="row">
        <div class="col-md-6 mb-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="Label10">Features</asp:Label>
                    <asp:TextBox runat="server" ID="txtFeatures" TextMode="MultiLine" Rows="10" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                </div>
            </div>

        </div>
        <div class="col-md-6 mb-3">

            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="Label13">System Analysis and Design (Link)</asp:Label>
                    <asp:TextBox runat="server" ID="txtSADLink" CssClass="input-field form-control" Style="text-transform: none" placeholder=""></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="Label14">Deployment Agreement (Link)</asp:Label>
                    <asp:TextBox runat="server" ID="txtDeploymentAgreementLink" CssClass="input-field form-control" Style="text-transform: none" placeholder=""></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="Label15">Deployment Letter (Link)</asp:Label>
                    <asp:TextBox runat="server" ID="txtDeploymentLetterLink" CssClass="input-field form-control" Style="text-transform: none" placeholder=""></asp:TextBox>
                </div>
            </div>
        </div>
    </div>

    <span>Personnel Details</span>
    <asp:UpdatePanel ID="updatePanel2" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-5 mb-3">
                    <asp:Label runat="server" ID="Label11">ROLE</asp:Label>
                    <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlRole" AutoPostBack="true">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlRole" SetFocusOnError="true" Font-Bold="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Role is Required!" ValidationGroup="DOCADDPERSONNEL" />
                </div>
                <div class="col-md-5 mb-3">
                    <asp:Label runat="server" ID="Label12">Select Personnel</asp:Label>
                    <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlPersonnel">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlPersonnel" SetFocusOnError="true" Font-Bold="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Personnel is Required" ValidationGroup="DOCADDPERSONNEL" />
                </div>
                <div class="col-md-2">
                    <div class="d-flex p-4">
                        <button type="button" class="btn btn-primary" runat="server" id="btnAddPersonnel" validationgroup="DOCADDPERSONNEL">ADD</button>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <asp:GridView runat="server" ID="_gv" HeaderStyle-Font-Size="11px" CssClass="table table-success table-striped" PageSize="15" EmptyDataText="NO RECORD FOUND"
                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                        GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="false">
                        <Columns>
                            <asp:BoundField DataField="personnel_name" HeaderText="Personnel Name" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="user_role_description" HeaderText="Role" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" />
                        </Columns>
                    </asp:GridView>
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <hr />
    <asp:UpdatePanel ID="updatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <div class="d-grid gap-2">
                        <button type="button" class="btn btn-danger btn-lg" runat="server" id="btnClear">CLEAR</button>
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <div class="d-grid gap-2">
                        <button type="button" class="btn btn-success btn-lg" runat="server" id="btnSubmit">SUBMIT</button>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


    <asp:UpdatePanel ID="updatePanel3" runat="server">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfTransid"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
        </ContentTemplate>
    </asp:UpdatePanel>




</asp:Content>
