<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Matieres_Ajout.aspx.cs" Inherits="Suivi.Administrateur.WebForm14" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Ajouter une matière
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Ajouter une matière
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
    <div class="profs">
    <table width=424px style="font-family:Verdana;font-size:100%;">
    <tr align=center><td colspan="2" style="color:White;background-color:#5D7B9D;font-weight:bold;">Ajouter une matière</td></tr>
    <tr>
        <tr>
            <td>
                <asp:Label ID="lbl" runat="server" Text="Matière" Font-Bold="True">Matière : </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLibMat" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="chRequis" runat="server" ErrorMessage="Le nom de la matière est requis" ToolTip="Le nom de la matière est requis" ControlToValidate="txtLibMat">*</asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="lblCoef" runat="server" Text="Coefficient : " Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCoef" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiCoef" runat="server" ErrorMessage="Le Coefficient de la matière est requis" ToolTip="Le Coefficient de la matière est requis" ControlToValidate="txtCoef">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CoefVerif" runat="server" Type="Double" ErrorMessage="Vérifiez Le Type de Coefficient" ToolTip="Vérifiez Le Type de Coefficient" ControlToValidate="txtCoef">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="btnAjout" runat="server" Text="Ajouter la matière" 
                    onclick="btnAjout_Click" />
            </td>
        </tr>
        </table>
    </div>
    </center>
</asp:Content>
