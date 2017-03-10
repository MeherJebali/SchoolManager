<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Services_Ajout.aspx.cs" Inherits="Suivi.Administrateur.WebForm24" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Ajouter un service
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Ajouter un service
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
    <table width=424px style="font-family:Verdana;font-size:100%;">
        <tr align=center><td colspan="2" style="color:White;background-color:#5D7B9D;font-weight:bold;">Ajouter un Service</td></tr>
        <tr>
        <td align="right"><b>Nom Service : </b></td>
        <td>
            <asp:TextBox ID="txtService" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ReqLib" runat="server" ErrorMessage="Obligatoire" ControlToValidate="txtService" ToolTip="Le nom de service et requis">*</asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
        <td align="right"><b>Coût Service : </b></td>
        <td>
            <asp:TextBox ID="txtPrix" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="Req2" runat="server" ErrorMessage="Obligatoire" ControlToValidate="txtPrix" ToolTip="Le coût du service est requis ">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="comPrix" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtPrix" Type="Double" ToolTip="Veuillez vérifier le type de coût">*</asp:CompareValidator>
        </td>
        </tr>
        <tr>
        <td align="center" colspan="2">
            <asp:Button ID="btnAdd" runat="server" Text="Ajouter un Service" 
                onclick="btnAdd_Click" />
        </td>
        </tr>
    </table>
</div>
</center>
</asp:Content>
