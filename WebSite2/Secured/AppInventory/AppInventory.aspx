<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AppInventory.aspx.vb" Inherits="Secured_AppInventory_AppInventory" MasterPageFile="~/MasterPage/Admin.master" %>


<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
    <link href="../../Scripts/mycss/stepsStyle.css" rel="stylesheet" />

    <h2 class="text-uppercase">Application Inventory<span runat="server" id="spanAppType"></span></h2>

    <asp:UpdatePanel ID="updatePanel5" runat="server">
        <ContentTemplate>

            <div class="row">
                <div class="col-md-6 mb-1">
                    <asp:Label runat="server" ID="lblApplicationNameLabel">Search</asp:Label>
                    <asp:TextBox runat="server" ID="txtSearch" CssClass="input-field form-control" Style="text-transform: uppercase" MaxLength="100" placeholder=""></asp:TextBox>
                </div>

                <div class="col-md-6 mb-1">
                    <button runat="server" class="btn btn-success" id="btnSearch">Filter</button>
                    <button runat="server" class="btn btn-primary" id="btnAdd">Add</button>
                </div>
            </div>

            <asp:GridView runat="server" ID="_gv" HeaderStyle-Font-Size="14px" CssClass="table table-success table-striped" PageSize="15" EmptyDataText="NO RECORD FOUND"
                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="true">
                <Columns>

                    <asp:BoundField DataField="application_name" HeaderText="Application Name" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="application_version" HeaderText="Version No." ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" />
                    <%--<asp:BoundField DataField="last_date" HeaderText="Last Update" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" />--%>
                    <asp:BoundField DataField="developer" HeaderText="Developer" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="projectManager" HeaderText="Project Manager" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="client_name" HeaderText="Client Name/Office" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" />

                    <asp:TemplateField HeaderText="" HeaderStyle-Width="1%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="lnkEdit" ImageUrl="~/images/edit.png" OnCommand="cmdGVSelect" Style="cursor: pointer"
                                CommandArgument='<%# Bind("application_id")%>' ToolTip="Click to Edit" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>





    <!-- MODAL EDIT APPLICATION -->

    <div class="modal fade" id="mdlApplicationDetails" tabindex="-1" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <%--<asp:UpdatePanel ID="updatePanel11" runat="server">
                    <ContentTemplate>--%>

                <div class="modal-header" style="background-color: white; color: #397db1; text-align: center;">
                    <asp:Label runat="server" ID="Label5" Style="font-size: 20px;" Text="UPDATE APPLICATION"></asp:Label>

                    <%--<div class="icon"><i class="bi bi-info-square"></i></div>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                </div>

                <div class="modal-body" style="background-color: white; font-size: 16px;">
                    <%-- STEPS --%>
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="form">
                                <ul id="progressbar">
                                    <li class="active" id="step1">
                                        <strong>Application details</strong>
                                    </li>
                                    <li id="step2"><strong>Contact details</strong></li>
                                    <%-- <li id="step3"><strong>step 3</strong></li>--%>
                                    <li id="step3"><strong>Version</strong></li>
                                </ul>
                                <%--   <div class="progress">
                                    <div class="progress-bar"></div>
                                </div>--%>
                            </div>
                        </div>
                    </div>

                    <%--  <div class="container-fluid">
                                                <div class="row">
                            <div class="col-lg-12">--%>
                    <%--<div class="px-0 pt-4 pb-0 mt-3 mb-3">--%>

                    <%-- CONTENT --%>
                    <div id="form">

                        <%-- STEP 1 --%>
                        <fieldset style="text-align: left;">
                            <asp:UpdatePanel ID="updatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <asp:Label runat="server" ID="Label1">Application Name</asp:Label>
                                            <span style="color: red; font-size: 20px">*</span>
                                            <asp:TextBox runat="server" ID="txtApplicationName" CssClass="input-field form-control" Style="text-transform: uppercase" MaxLength="100" placeholder=""></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtApplicationName" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <asp:Label runat="server" ID="Label2">Start Date</asp:Label>
                                            <input type="date" class="form-control" runat="server" id="dtpStartDate" autoclose="true" style="z-index: 0; background-color: white;" aria-orientation="horizontal" />
                                            <%--<asp:TextBox runat="server" ID="txtStartDate" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>--%>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <asp:Label runat="server" ID="Label3">Deployment Date</asp:Label>
                                            <input type="date" class="form-control" runat="server" id="dtpDeploymentDate" autoclose="true" style="z-index: 0; background-color: white;" aria-orientation="horizontal" />
                                            <%--<asp:TextBox runat="server" ID="txtDeploymentDate" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>--%>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <asp:Label runat="server" ID="Label4">Client Department/Office/Unit</asp:Label>
                                            <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlDepartment">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <asp:Label runat="server" ID="Label6">Description</asp:Label>
                                            <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" Rows="5" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <asp:Label runat="server" ID="Label7">Application URL</asp:Label>
                                            <asp:TextBox runat="server" ID="txtUrl" CssClass="input-field form-control" Style="text-transform: none;" placeholder=""></asp:TextBox>
                                        </div>
                                        <div class="col-md-6 mb-3" runat="server" visible="false">
                                            <asp:Label runat="server" ID="Label8">Trello(Link)</asp:Label>
                                            <asp:TextBox runat="server" ID="txtTrelloLink" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>

                                   <%-- <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <asp:Label runat="server" ID="Label26">Is Active?</asp:Label>
                                            <asp:RadioButtonList runat="server" ID="rdolisactive" CssClass="form-control " RepeatDirection="Horizontal">
                                                <asp:ListItem Text="&nbsp;Yes&nbsp;&nbsp;&nbsp;" Value="Y" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="&nbsp;No" Value="N"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>--%>

                                    <div align="right">
                                        <button runat="server" id="btnSaveAppDetails" class="btn btn-success">Save</button>
                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <hr />
                            <%--   <div class="modal-footer">--%>
                            <button type="button" name="next-step"
                                class="next-step btn" value="Next Step">
                                Next</button>
                            <%-- </div>--%>
                        </fieldset>

                        <%-- STEP 2 --%>
                        <fieldset style="text-align: left;">
                            <asp:UpdatePanel ID="updatePanel4" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-4 mb-3">
                                            <asp:Label runat="server" ID="Label9">Contact Person</asp:Label>
                                            <asp:TextBox runat="server" ID="txtContactPerson" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <asp:Label runat="server" ID="Label10">Contact Number</asp:Label>
                                            <asp:TextBox runat="server" ID="txtContactNumber" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <asp:Label runat="server" ID="Label11">Email Address</asp:Label>
                                            <asp:TextBox runat="server" ID="txtContactEmailAddress" CssClass="input-field form-control" Style="text-transform: none" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>

                                    <div align="right">
                                        <button runat="server" id="btnSaveContactDetails" class="btn btn-success">Save</button>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <hr />
                            <button type="button" name="next-step"
                                class="next-step btn" value="Next Step">
                                Next</button>
                            <button type="button" name="previous-step"
                                class="previous-step btn"
                                value="Previous Step">
                                Previous</button>
                        </fieldset>

                        <%-- STEP 3 --%>
                        <fieldset style="text-align: left;">
                            <asp:UpdatePanel ID="updatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <div class="row">
                                                <div class="col-md-12 mb-3">
                                                    <asp:Label runat="server" ID="Label12">Features</asp:Label>
                                                    <asp:TextBox runat="server" ID="txtFeatures" TextMode="MultiLine" Rows="10" CssClass="input-field form-control" Style="text-transform: uppercase; background-color: white;" placeholder="" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-3">

                                            <div class="row">
                                                <div class="col-md-12 mb-3">
                                                    <asp:Label runat="server" ID="Label13">System Analysis and Design (Link)</asp:Label>
                                                    <asp:TextBox runat="server" ID="txtSADLink" CssClass="input-field form-control" Style="text-transform: none; background-color: white;" placeholder="" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 mb-3">
                                                    <asp:Label runat="server" ID="Label14">Deployment Agreement (Link)</asp:Label>
                                                    <asp:TextBox runat="server" ID="txtDeploymentAgreementLink" CssClass="input-field form-control" Style="text-transform: none; background-color: white;" placeholder="" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 mb-3">
                                                    <asp:Label runat="server" ID="Label15">Deployment Letter (Link)</asp:Label>
                                                    <asp:TextBox runat="server" ID="txtDeploymentLetterLink" CssClass="input-field form-control" Style="text-transform: none; background-color: white" placeholder="" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <span>Personnel Details</span>


                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:GridView runat="server" ID="_gvPersonnel" HeaderStyle-Font-Size="11px" CssClass="table table-striped" PageSize="15" EmptyDataText="NO RECORD FOUND"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="false">
                                                <Columns>
                                                    <asp:BoundField DataField="personnel_name" HeaderText="Personnel Name" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="user_role_description" HeaderText="Role" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>

                                    </div>

                                    <div align="right">
                                        <div class="col-md-6 mb-3">
                                            <div class="d-grid gap-4">
                                                <button runat="server" id="btnAddVersion" class="btn btn-success">Add Version</button>
                                            </div>
                                        </div>
                                    </div>


                                    <hr />

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:GridView runat="server" ID="_gvVersions" HeaderStyle-Font-Size="11px" CssClass="table table-striped" PageSize="15" EmptyDataText="NO RECORD FOUND"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="true">
                                                <Columns>
                                                    <asp:BoundField DataField="version_no" HeaderText="Version No." ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="application_features" HeaderText="Features" ItemStyle-Width="25%" HeaderStyle-HorizontalAlign="left" />
                                                    <asp:BoundField DataField="projectManager" HeaderText="Project Manager" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="developer" HeaderText="Developer" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="application_version_start_date" HeaderText="Start Date" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="application_version_end_date" HeaderText="End Date" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="appLinks" HeaderText="Links" ItemStyle-Width="25%" HeaderStyle-HorizontalAlign="Center" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>

                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <button type="button" name="previous-step"
                                class="previous-step btn"
                                value="Previous Step">
                                Previous</button>
                        </fieldset>
                    </div>

                    <%--  </div>--%>
                    <%-- </div>
                        </div>
                    </div>--%>
                </div>

                <%--  </ContentTemplate>
                </asp:UpdatePanel>--%>
            </div>
        </div>
    </div>



    <div class="modal fade" id="mdlVersionDetails" tabindex="-1" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: lightblue; color: black; text-align: center;">
                    <asp:Label runat="server" ID="Label18" Style="font-size: 20px;" Text="Version Details"></asp:Label>

                    <%--<div class="icon"><i class="bi bi-info-square"></i></div>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body" style="background-color: white; font-size: 16px;">
                    <asp:UpdatePanel ID="updatePanel6" runat="server">
                        <ContentTemplate>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <asp:Label runat="server" ID="Label24">Start Date</asp:Label>
                                    <input type="date" class="form-control" runat="server" id="dtpVersionStartDate" autoclose="true" style="z-index: 0; background-color: white;" aria-orientation="horizontal" />
                                    <%--<asp:TextBox runat="server" ID="txtStartDate" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>--%>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <asp:Label runat="server" ID="Label25">Deployment Date</asp:Label>
                                    <input type="date" class="form-control" runat="server" id="dtpVersionEndDate" autoclose="true" style="z-index: 0; background-color: white;" aria-orientation="horizontal" />
                                    <%--<asp:TextBox runat="server" ID="txtDeploymentDate" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>--%>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <asp:Label runat="server" ID="Label19">Features</asp:Label>
                                            <asp:TextBox runat="server" ID="txtVersionFeatures" TextMode="MultiLine" Rows="10" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-6 mb-3">

                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <asp:Label runat="server" ID="Label20">System Analysis and Design (Link)</asp:Label>
                                            <asp:TextBox runat="server" ID="txtVersionSadLink" CssClass="input-field form-control" Style="text-transform: none" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <asp:Label runat="server" ID="Label21">Deployment Agreement (Link)</asp:Label>
                                            <asp:TextBox runat="server" ID="txtVersionDeployAgreeLink" CssClass="input-field form-control" Style="text-transform: none" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <asp:Label runat="server" ID="Label22">Deployment Letter (Link)</asp:Label>
                                            <asp:TextBox runat="server" ID="txtVersionDeployLetLink" CssClass="input-field form-control" Style="text-transform: none" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <asp:Label runat="server" ID="Label23">Version No.</asp:Label>
                                            <asp:TextBox runat="server" ID="txtVersionNo" CssClass="input-field form-control" Style="text-transform: none" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <span>Personnel Details</span>

                            <div class="row">
                                <div class="col-md-5 mb-3">
                                    <asp:Label runat="server" ID="Label16">Select ROLE</asp:Label>
                                    <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlRole" AutoPostBack="true">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlRole" SetFocusOnError="true" Font-Bold="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Role is Required!" ValidationGroup="DOCADDPERSONNEL" />
                                </div>
                                <div class="col-md-5 mb-3">
                                    <asp:Label runat="server" ID="Label17">Select Personnel</asp:Label>
                                    <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlPersonnel">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlPersonnel" SetFocusOnError="true" Font-Bold="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Personnel is Required" ValidationGroup="DOCADDPERSONNEL" />
                                </div>
                                <div class="col-md-2">
                                    <div align="left">
                                        <button type="button" class="btn btn-primary" runat="server" id="btnAddPersonnel" validationgroup="DOCADDPERSONNEL">ADD PERSONNEL</button>
                                    </div>

                                </div>
                            </div>


                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:GridView runat="server" ID="_gvVersionPersonnel" HeaderStyle-Font-Size="11px" CssClass="table table-striped" PageSize="15" EmptyDataText="NO RECORD FOUND"
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

                </div>

                <div class="modal-footer">
                    <asp:UpdatePanel ID="updatePanel7" runat="server">
                        <ContentTemplate>
                            <button runat="server" type="button" id="btnSaveVersion" class="btn btn-success">Save</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>
        </div>
    </div>

    <asp:UpdatePanel ID="updatePanel3" runat="server">
        <ContentTemplate>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../../Scripts/myJS/stepsJs.js"></script>


</asp:Content>

