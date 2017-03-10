<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Classes_Ajout.aspx.cs" Inherits="Suivi.Administrateur.WebForm10" Title="Ajouter une Classe" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Ajouter une classe
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Ajouter une classe
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="test" runat="server">
 <center>
    <div class="profs">
        <table width=424px style="font-family:Verdana;font-size:100%;" >
    <tr align=center><td colspan="2" style="color:White;background-color:#5D7B9D;font-weight:bold;">Ajouter une classe</td></tr>
    <tr>
            <td>
                <b><asp:Label ID="lblNiveau" runat="server" Text="Niveau"></asp:Label></b>
            </td>
            <td colspan="2">
              <asp:DropDownList ID="ListNiveau" runat="server" 
                onselectedindexchanged="ListNiveau_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Selected="True" Value="0">...</asp:ListItem>
                <asp:ListItem Value="1">1ère Année</asp:ListItem>
                <asp:ListItem Value="2">2ème Année</asp:ListItem>
                <asp:ListItem Value="3">3ème Année</asp:ListItem>
                <asp:ListItem Value="4">4ème Année</asp:ListItem>
                <asp:ListItem Value="5">5ème Année</asp:ListItem>
                <asp:ListItem Value="6">6ème Année</asp:ListItem>
            </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <b><asp:Label ID="lblLibele" runat="server" Text="Libelle"></asp:Label></b>
            </td>
            <td>
                <asp:TextBox ID="txtLibele" style="text-transform:uppercase" runat="server" 
                    Enabled="False" MaxLength="2" AutoPostBack="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="champValid" runat="server" ErrorMessage="Champ Obligatoire" ControlToValidate="txtLibele" ToolTip="Le Libelle est requis.">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegChamp" runat="server" ErrorMessage="Format Incorrect " ToolTip="Le Nom de La Classe doit commencer par un chiffre et se termine par une lettre" ControlToValidate="txtLibele" ValidationExpression="^[1-9][a-zA-Z]$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblCheck" runat="server" Text="" ForeColor=Red></asp:Label>   
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblIncomp" runat="server" Text="" ForeColor=Red></asp:Label> 
            </td>
        </tr>
        <tr>
            <td colspan="2">
            <asp:Button ID="btnAjouter" runat="server" Text="Ajouter la Classe" 
                    onclick="btnAjouter_Click"/>
            </td>
        </tr>
        </table>
    </div>
</center>
</asp:Content>

