<%@ Page Title="" Language="C#" MasterPageFile="~/Parent/Parent.Master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="Suivi.Parent.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
Messages
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
Messages
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="test" runat="server">
<br />
<br />
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="NewMsgs" runat="server" Font-Bold="true" ForeColor="Blue" 
        onclick="NewMsgs_Click">Nouveau Message</asp:LinkButton>
<center>
<div class="profs">
    <asp:SqlDataSource ID="DSMessages" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        
        
        SelectCommand="SELECT Message.ID_msg, Enseignant.Prenom_ens + ' ' + Enseignant.Nom_ens AS enseignant, Enseignant.Photo_ens, Message.Objet_msg, Message.Corps_msg, Message.Date_msg FROM Message INNER JOIN Enseignant ON Message.Emetteur_msg = Enseignant.CIN_ens WHERE (Message.Date_msg &gt;= DATEADD(day, - 29, GETDATE())) AND (Message.Recepteur_msg = @cin)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtcin" Name="cin" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DataList ID="ListMsg" runat="server" DataSourceID="DSMessages">
    <ItemTemplate>
    <a href="Message.aspx?ID_msg=<%# Eval("ID_msg") %>">
    <table>
    <tr>
        <td>
            <asp:Image ID="photo" runat="server" ImageURL='<%# Eval("Photo_ens") %>'  Width="70px" Height="70px" />
        </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td class="tab">
            <asp:Label ID="lblNom" runat="server" Text='<%# Eval("enseignant") %>' Font-Bold="True"></asp:Label>
        </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td class="tab">
            <asp:Label ID="lblObjet" runat="server" Text='<%# Eval("Objet_msg") %>' Font-Bold="True"></asp:Label>
        </td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td class="tab">
            <b><asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date_msg","{0:d}") %>'></asp:Label></b>
        </td>
    </tr>
    </table>
    </a>
    </ItemTemplate>
    </asp:DataList>
</div>
</center>
<asp:TextBox ID="txtcin" runat="server" Visible="false"></asp:TextBox>
</asp:Content>
