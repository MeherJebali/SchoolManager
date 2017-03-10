<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Suivi.Administrateur.WebForm23" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Les Services
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les Services
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
    <asp:SqlDataSource ID="DSServices" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT [Lib_service], [Cout_service] FROM [Service]"></asp:SqlDataSource>
    <br />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="DSServices">
    <HeaderTemplate><table border="0" rules="none" width=400px><tr><th>Service</th><th>Coût</th></tr></HeaderTemplate>
    <ItemTemplate><tr><td align="center">
        <asp:Label ID="lblService" runat="server" Text='<%# Eval("Lib_service") %>'></asp:Label></td><td align="center">
            <asp:Label ID="lblCout" runat="server" Text='<%# Eval("Cout_service") %>'></asp:Label></td></tr></ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
    </asp:Repeater>
</div>
</center>
</asp:Content>
