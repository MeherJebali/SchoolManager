<%@ Page Title="" Language="C#" MasterPageFile="~/Enseignant/Enseignant.Master" AutoEventWireup="true" CodeBehind="Message_New.aspx.cs" Inherits="Suivi.Enseignant.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Nouveau Message
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
Nouveau Message
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
    <asp:SqlDataSource ID="DSParents" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand=" SELECT DISTINCT Parent.CIN_parent, Parent.Prenom_parent + ' ' + Parent.Nom_parent AS NomParent FROM Enseigner INNER JOIN Eleve ON Enseigner.ID_classe = Eleve.ID_classe INNER JOIN Parent ON Eleve.CIN_parent = Parent.CIN_parent WHERE (Enseigner.CIN_ens = @cin)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtcin" Name="cin" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <table>
        <tr>
    <td align="right"><b>Enseignant : </b></td>
    <td style="width: 275px">
        <asp:DropDownList ID="ListParent" runat="server" AutoPostBack="True" 
            DataSourceID="DSParents" DataTextField="NomParent" DataValueField="CIN_parent" 
            Height="22px" Width="215px">
        </asp:DropDownList>
    </td>
    </tr>
    <tr>
        <td align="right"><b>Objet : </b>
        </td>
        <td style="width: 275px">
            <asp:TextBox ID="txtObjet" runat="server" Width="225px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right"><b>Message : </b>
        </td>
        <td style="width: 275px">
            <asp:TextBox ID="txtMsg" runat="server" Height="80px" Width="225px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr><td colspan="2" align="center">
        <asp:Button ID="btnSend" runat="server" Text="Envoyer" Font-Bold="True" 
            Width="111px" onclick="btnSend_Click" /></td></tr>
    </table>
</div>
</center>
<asp:TextBox ID="txtcin" runat="server" Visible="false"></asp:TextBox>
</asp:Content>
