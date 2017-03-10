<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="Suivi.Administrateur.WebForm2" Title="Page sans titre" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Les Classes
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les classes
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="test" runat="server">
    <center>
    <div class="profs">
        <asp:SqlDataSource ID="DSclasses" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            SelectCommand="SELECT Niveau,ID_classe FROM Classe GROUP BY Niveau, ID_classe"></asp:SqlDataSource>
        <br />
        <b>Niveau : </b><asp:DropDownList ID="ListNiveau" runat="server" 
            onselectedindexchanged="ListNiveau_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Selected="True" Value="0">...</asp:ListItem>
            <asp:ListItem Value="1">1ère Année</asp:ListItem>
            <asp:ListItem Value="2">2ème Année</asp:ListItem>
            <asp:ListItem Value="3">3ème Année</asp:ListItem>
            <asp:ListItem Value="4">4ème Année</asp:ListItem>
            <asp:ListItem Value="5">5ème Année</asp:ListItem>
            <asp:ListItem Value="6">6ème Année</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:DataList ID="Classes" runat="server" DataSourceID="DSclasses" 
            Height="197px" >
        <HeaderTemplate>
             <table border="0" BorderColor="#808080" rules="none" cellspacing="0" cellpadding="0" width=300>
            <tr>
                <th>Classe</th>
                <th>Niveau</th>
                <th>Détails</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>     
            <tr align=center>
            <td>
                <asp:Label ID="lblIdClasse" runat="server" Text='<%# Eval("ID_Classe") %>'></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblNiveau" runat="server" Text='<%# Eval("Niveau") %>'></asp:Label>
            </td>
            <td>
                <a href="Classes_Details.aspx?ID_Classe=<%# Eval("ID_Classe") %>">Détails</a>
            </td>
            </tr>  
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>     
        </asp:DataList>
    </div>
    
</center>
</asp:Content>
