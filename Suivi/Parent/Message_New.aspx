<%@ Page Title="" Language="C#" MasterPageFile="~/Parent/Parent.Master" AutoEventWireup="true" CodeBehind="Message_New.aspx.cs" Inherits="Suivi.Parent.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
Nouveau Message
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
Nouveau Message
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
    <asp:SqlDataSource ID="DSEnseignant" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        
        
        SelectCommand="SELECT DISTINCT Enseignant.CIN_ens, Enseignant.Prenom_ens + ' ' + Enseignant.Nom_ens AS Enseignant FROM Enseigner INNER JOIN Enseignant ON Enseigner.CIN_ens = Enseignant.CIN_ens INNER JOIN Eleve ON Enseigner.ID_classe = Eleve.ID_classe WHERE (Eleve.CIN_parent = @cin)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtcin" Name="cin" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
        <table>
        <tr>
    <td align="right"><b>Enseignant : </b></td>
    <td style="width: 275px"><asp:DropDownList ID="ListEnseignant" runat="server" AutoPostBack="True" 
        DataSourceID="DSEnseignant" DataTextField="Enseignant" 
            DataValueField="CIN_ens" Height="22px" Width="215px">
    </asp:DropDownList></td>
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
    <asp:TextBox ID="txtcin" runat="server" Visible="true"></asp:TextBox>
</asp:Content>
