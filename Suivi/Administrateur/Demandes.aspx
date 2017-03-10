<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Demandes.aspx.cs" Inherits="Suivi.Administrateur.WebForm28" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Les Demandes de congé
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les Demandes de congé
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
    <asp:SqlDataSource ID="DSConges" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" ></asp:SqlDataSource>
    <asp:DataList ID="ListConge" runat="server" DataKeyField="ID_conge" 
        DataSourceID="DSConges">
        <ItemTemplate>
            
            <b><asp:Label ID="ID_congeLabel" runat="server" Text='<%# Eval("NomEns") %>' /></b>
            a demandé un congé de <b><asp:Label ID="Raison_congeLabel" runat="server" 
                Text='<%# Eval("Raison_conge") %>' /></b>&nbsp;<a href="Demandes_Details.aspx?ID_conge=<%# Eval("ID_conge") %>"><u>Détails</u></a>
            <br />
            
        </ItemTemplate>
        
    </asp:DataList>   
</div>
</center>
</asp:Content>
