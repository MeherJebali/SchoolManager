<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authentification.aspx.cs" Inherits="Suivi._Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Authentification</title>
    <style type="text/css">
       body
       {
       	background-image:url(img/backf.jpg);
       }
       #auth
       {
       	width:400px;
       	height:300px;
       	margin-top:283.5px;
       	margin-left:570px;
       } 
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="auth">
        <asp:LoginView ID="LoginView2" runat="server">
            <AnonymousTemplate>
                <asp:Login ID="Login1" runat="server" onloggedin="Login1_LoggedIn" 
            BackColor=Transparent BorderColor="#ECA759" BorderPadding="4" 
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
            ForeColor="#eca759" Height="286px" Width="387px" CssClass="test">
            <TextBoxStyle Font-Size="1.6em" />
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="1.8em" ForeColor="#284775" />
            <LayoutTemplate>
                <table border="0" cellpadding="4" cellspacing="0" 
                    style="border-collapse:collapse;">
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" style="height:286px;width:387px;">
                                
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nom 
                                        d&#39;utilisateur&nbsp;:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" Font-Size="1.6em"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                            ControlToValidate="UserName" ErrorMessage="Un nom d'utilisateur est requis." 
                                            ToolTip="Un nom d'utilisateur est requis." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Mot 
                                        de passe&nbsp;:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" Font-Size="1.6em" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="Un mot de passe est requis." 
                                            ToolTip="Un mot de passe est requis." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" runat="server" 
                                            Text="Mémoriser le mot de passe." />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" 
                                            BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                                            Font-Names="Verdana" Font-Size="1.8em" ForeColor="#eca759" Text="Se connecter" 
                                            ValidationGroup="Login1" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="2em" 
                ForeColor="White" />
        </asp:Login>
            </AnonymousTemplate>
            <LoggedInTemplate>
            <p>Vous êtes connecté en tant que : 
                <asp:LoginName ID="LoginName1" runat="server" /></p>
                <asp:LoginStatus ID="LoginStatus1" runat="server" />
            </LoggedInTemplate>
        </asp:LoginView>
        
    </div>
    </form>
</body>
</html>
