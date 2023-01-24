<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rptReports.aspx.vb" Inherits="Secured_Reports_rptReports" MasterPageFile="~/MasterPage/Admin.master" %>


<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>


            <asp:Panel  runat="server">
               <%-- <asp:UpdatePanel runat="server">
                    <ContentTemplate>--%>
                
                        <h2 class="text-uppercase">Application<span runat="server" id="spanAppType"></span></h2>


                        <div class="row" runat="server" visible="false">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtSearch" CssClass="input-field form-control" Style="text-transform: uppercase" MaxLength="100" placeholder="Search Criteria"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" style="font-weight: bold">Personnel</span>
                                        <asp:DropDownList runat="server" ID="ddlPersonnel" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" style="font-weight: bold">Client</span>
                                        <asp:DropDownList runat="server" ID="ddlClient" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" style="font-weight: bold">From:</span>
                                        <asp:TextBox runat="server" ID="txtDateFrom" CssClass="input-field form-control" TextMode="Date"></asp:TextBox>
                                        <span class="input-group-text" style="font-weight: bold">To:</span>
                                        <asp:TextBox runat="server" ID="txtDateTo" CssClass="input-field form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Button runat="server" ID="btnRetrieve" CssClass="btn btn-primary" Text="Retrieve" />
                                <%-- <asp:Button runat="server" ID="btnExcel" CssClass="btn btn-primary float-end" Text="Excel" />--%>
                                 <button type="button" runat="server" class="btn btn-success float-end" id="btnExcel" data-bs-toggle="tooltip" data-bs-placement="top" title="Download AS Excel" ><i class="fa-regular fa-file-excel" style="font-size:30px"></i></button>
                                <button type="button" runat="server" class="btn btn-primary float-end" id="btnPDF"  data-bs-toggle="tooltip" data-bs-placement="top" title="Download AS PDF"><i class="fa-regular fa-file-pdf" style="font-size:30px"></i></button>
                                 <%-- <asp:Button runat="server"  CssClass="btn btn-primary float-end" Text="PDF" /> --%>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12" runat="server" id="display">
                                <asp:Literal ID="ltEmbed" runat="server" />
                            </div>

                        </div>
                  <%--  </ContentTemplate>
                </asp:UpdatePanel>--%>

            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
            <asp:PostBackTrigger ControlID="btnPDF" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdatePanel runat="server" ID="upUpdate">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfTransId"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisConfirmBox" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>




