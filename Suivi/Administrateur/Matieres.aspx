<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Matieres.aspx.cs" Inherits="Suivi.Administrateur.WebForm11" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Les Matières
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les Matières
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
   
    <center>
    <div class="profs">
         <asp:SqlDataSource ID="DSMatieres" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT [Lib_mat], [Coef_mat] FROM [Matiere]"></asp:SqlDataSource>
        <br />
    <asp:Repeater ID="RpMatieres" runat="server" DataSourceID="DSMatieres">
    <HeaderTemplate>
    <table border=0 rules=none>
    <tr>
        <th>Matière</th>
        <th>Coefficient</th>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr align="center">
        <td><asp:Label ID="lblMat" runat="server" Text='<%#Eval("Lib_mat") %>'></asp:Label></td>
        <td> <asp:Label ID="lblCoef" runat="server" Text='<%#Eval("Coef_mat") %>'></asp:Label></td>
         
    </tr> 
    </ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
    </asp:Repeater>
    </div>
    </center>
</asp:Content>
