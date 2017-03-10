<%@ Page Title="" Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="Suivi.Administrateur.WebForm38" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Mes Messages
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
Messages
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
    <asp:SqlDataSource ID="DSMessages" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        
        
        SelectCommand="SELECT Message.ID_msg, Parent.Prenom_parent + ' ' + Parent.Nom_parent AS Parent, Parent.Photo_parent, Message.Objet_msg, Message.Corps_msg, Message.Date_msg, Message.Etat_msg AS Etat FROM Message INNER JOIN Parent ON Message.Emetteur_msg = Parent.CIN_parent WHERE (Message.Date_msg &gt;= DATEADD(day, - 29, GETDATE())) AND (Message.Recepteur_msg = 'admin') ORDER BY Date_msg DESC"></asp:SqlDataSource>

    <asp:DataList ID="ListMsg" runat="server" DataSourceID="DSMessages">
    <ItemTemplate>
    <a href="Message.aspx?ID_msg=<%# Eval("ID_msg") %>">
    <table>
    <tr>
        <td>
            <asp:Image ID="photo" runat="server" ImageURL='<%# Eval("Photo_parent") %>'  Width="70px" Height="70px" />
        </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td class="tab">
            <asp:Label ID="lblNom" runat="server" Text='<%# Eval("Parent") %>' Font-Bold='<%# !(bool)Eval("Etat") %>'></asp:Label>
        </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td class="tab">
            <asp:Label ID="lblObjet" runat="server" Text='<%# Eval("Objet_msg") %>' Font-Bold='<%# !(bool)Eval("Etat") %>'></asp:Label>
        </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td class="tab">
            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date_msg","{0:d}") %>' Font-Bold='<%# !(bool)Eval("Etat") %>'></asp:Label>
        </td>
    </tr>
    </table>
    </a>
    </ItemTemplate>
    </asp:DataList>
</div>
</center>
</asp:Content>
