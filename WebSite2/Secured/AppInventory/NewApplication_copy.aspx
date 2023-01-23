<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewApplication_copy.aspx.vb" Inherits="Secured_AppInventory_NewApplication" MasterPageFile="~/MasterPage/Admin.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
    <h2 class="text-uppercase">New Application<span runat="server" id="spanAppType"></span></h2>

    <div class="row">
        <div class="col-md-6 mb-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="lblApplicationNameLabel">Application Name</asp:Label>
                    <span style="color: red; font-size: 20px">*</span>
                    <asp:TextBox runat="server" ID="txtApplicationDetails" CssClass="input-field form-control" Style="text-transform: uppercase" MaxLength="100" placeholder=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtApplicationDetails" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <asp:Label runat="server" ID="Label1">Start Date</asp:Label>
                    <asp:TextBox runat="server" ID="txtStartDate" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Label runat="server" ID="Label2">Deployment Date</asp:Label>
                    <asp:TextBox runat="server" ID="txtDeploymentDate" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="Label3">Client Department/Office/Unit</asp:Label>
                    <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlDepartment">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
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
        <div class="col-md-6 mb-3">
            <asp:Label runat="server" ID="Label4">URL</asp:Label>
            <asp:TextBox runat="server" ID="txtUrl" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
        </div>
        <div class="col-md-6 mb-3">
            <asp:Label runat="server" ID="Label6">Trello(Link)</asp:Label>
            <asp:TextBox runat="server" ID="txtTrelloLink" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
        </div>
    </div>

    <span>Contact Person Details</span>

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
            <asp:TextBox runat="server" ID="txtEmailAddress" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
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
                    <asp:Label runat="server" ID="Label11">Project Manager</asp:Label>
                    <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlProjectManager">
                    </asp:DropDownList>
                    <%--<asp:TextBox runat="server" ID="txtProjectManager" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>--%>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="Label12">Developer</asp:Label>
                    <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlDeveloper">
                    </asp:DropDownList>
                    <%--<asp:TextBox runat="server" ID="txtDeveloper" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>--%>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="Label13">System Analysis and Design (Link)</asp:Label>
                    <asp:TextBox runat="server" ID="txtSADLink" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="Label14">Deployment Agreement (Link)</asp:Label>
                    <asp:TextBox runat="server" ID="txtDeploymentAgreementLink" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <asp:Label runat="server" ID="Label15">Deployment Letter (Link)</asp:Label>
                    <asp:TextBox runat="server" ID="txtDeploymentLetterLink" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <div class="d-grid gap-2">
                <button type="button" class="btn btn-danger btn-lg">CLEAR</button>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <div class="d-grid gap-2">
                <button type="button" class="btn btn-success btn-lg">SUBMIT</button>
            </div>
        </div>
    </div>








</asp:Content>
