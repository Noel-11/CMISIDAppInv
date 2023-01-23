<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" Theme="Skins" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE html>
<%@ Register Src="~/Include/wucErrorMessageBox.ascx" TagName="wucError" TagPrefix="wucError" %>
<%@ Register Src="~/Include/sFooterAdmin.ascx" TagName="sFooter" TagPrefix="uc3" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=.9" />
    <link rel="Shortcut Icon" href="~/favicon.ico" type="image/x-icon" />
    <title>CMISID APP INVENTORY</title>

    <link href="Scripts/Bootstrap5/css/bootstrap.css" rel="stylesheet" />
    <link href="Scripts/Bootstrap5/css/bootstrap.min.css" rel="stylesheet" />

    <script src="Scripts/Bootstrap5/js/bootstrap.min.js"></script>

    <style type="text/css">
        .auto-style1 {
            width: 202px;
        }

        .auto-style4 {
            width: 533px;
        }

        #imgWaterMark {
            opacity: 0.4;
            z-index: -1;
            /* For IE8 and earlier */
        }

            #imgWaterMark:hover {
                opacity: 1;
                filter: alpha(opacity=100);
                position: absolute;
                z-index: -1;
                /*For IE8 and earlier*/
            }

        .divider:after,
        .divider:before {
            content: "";
            flex: 1;
            height: 1px;
            background: #eee;
        }

        .h-custom {
            height: calc(100% - 73px);
        }

        @media (max-width: 450px) {
            .h-custom {
                height: 100%;
            }
        }
    </style>

</head>
<body>

    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <%--   <div class="col-md-4">
            <div align="center" style="position: fixed;">
                <img runat="server" id="imgWaterMark" src="Images/watermark.png" width="300" />

            </div>
        </div>--%>
        <asp:Panel runat="server" DefaultButton="btnLogIn">
            <section class="vh-100">
                <div class="container-fluid h-custom">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-md-9 col-lg-6 col-xl-5 text-center">
                            <img src="<%=ResolveClientUrl("~/Images/ICTLogo.png")%>" width="400" class="img-fluid" alt="Sample image"/>
                            <div class="fs-1">CMISID APPLICATION INVENTORY SYSTEM</div>
                        </div>
                        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

                            <div class="divider d-flex align-items-center my-4">
                                <p class="text-center fw-bold mx-3 mb-0">LOG IN ACCOUNT</p>
                            </div>

                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <%--<input type="email" id="form3Example3" class="form-control form-control-lg"
                                    placeholder="Enter User ID" />--%>
                                <asp:TextBox runat="server" ID="txtUserId" class="form-control form-control-lg" placeholder="Enter User ID"></asp:TextBox>
                                <label class="form-label" for="form3Example3">User ID</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUserId" SetFocusOnError="true" Font-Bold="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text=" is required" ValidationGroup="DOC" />
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-3">
                                <input runat="server" type="password" id="txtPassword" class="form-control form-control-lg"
                                    placeholder="Enter password" />
                                <%--<asp:TextBox runat="server" ID="txtPassword"  class="form-control form-control-lg" placeholder="Enter password"></asp:TextBox>--%>
                                <label class="form-label" for="form3Example4">Password</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword" SetFocusOnError="true" Font-Bold="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text=" is required" ValidationGroup="DOC" />
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <!-- Checkbox -->
                                <div class="form-check mb-0">
                                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
                                    <label class="form-check-label" for="form2Example3">
                                        Remember me
                                   
                                    </label>
                                </div>
                                <a href="#!" class="text-body" runat="server" visible="false">Forgot password?</a>
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <asp:Button runat="server" ID="btnLogin" class="btn btn-primary btn-lg" style="padding-left: 2.5rem; padding-right: 2.5rem;" Text="Login" ValidationGroup="DOC" />
                                <%--<button type="button" class="btn btn-primary btn-lg"
                                    style="padding-left: 2.5rem; padding-right: 2.5rem;" runat="server" id="btnLogIn">
                                    Login</button>--%>
                                <p class="small fw-bold mt-2 pt-1 mb-0" runat="server" visible="false">
                                    Don't have an account? <a href="#!"
                                        class="link-danger">Register</a>
                                </p>
                            </div>


                        </div>
                    </div>
                </div>
            </section>
        </asp:Panel>

    </form>
</body>
</html>

