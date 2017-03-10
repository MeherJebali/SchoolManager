<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Compte.aspx.cs" Inherits="Suivi.Administrateur.WebForm26" Title="Page sans titre" %>
<%@ Register Assembly="ASP.Web.UI.PopupControl" Namespace="ASP.Web.UI.PopupControl" TagPrefix="ASPP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Compte Administrateur
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Votre compte
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
<div class="profs">
    <h3>Bienvenue 
        <u><asp:LoginName ID="Nom" runat="server" /></u>
    </h3>
    <br />
    <br />
    <asp:LinkButton ID="linkPass" runat="server" onclick="linkPass_Click">Changer Le Mot de Passe</asp:LinkButton>
    <ASPP:PopupPanel HeaderText="Changer Le Mot de passe" ID="pup" runat="server" Width=400px>
            <PopupWindow runat="server">
                <ASPP:PopupWindow ID="PopupWindow1" Visible="true" runat="server">
                    <asp:ChangePassword ID="ChangePassword1" runat="server">
                    </asp:ChangePassword>
                </ASPP:PopupWindow>
            </PopupWindow>
        </ASPP:PopupPanel>
</div>
</center>
</asp:Content>
