<%@ Page Title="" Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Paiements_Details.aspx.cs" Inherits="Suivi.Administrateur.WebForm37" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Détails de paiement
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    Détails de paiement
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
<b> 
    <asp:Label ID="lblNomEleve" runat="server" Text=""></asp:Label></b>
<asp:SqlDataSource ID="DSServices" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT * FROM [Service]"></asp:SqlDataSource>   

    <br />
    <br />
    <br />
    <br />
    <asp:DataList ID="DLServices" runat="server" DataKeyField="ID_service" 
        DataSourceID="DSServices" ondatabinding="DLServices_DataBinding" 
        onitemdatabound="DLServices_ItemDataBound">
        <HeaderTemplate>
        <table>
        </HeaderTemplate>
        <ItemTemplate>
        <asp:Label ID="ID_service" runat="server" 
                Text='<%# Eval("ID_service") %>' Visible="false"/>
        <asp:Label ID="Cout" runat="server" 
                Text='<%# Eval("Cout_service") %>' Visible="false"/>
        <tr>
        <td><b><asp:Label ID="Lib_serviceLabel" runat="server" 
                Text='<%# Eval("Lib_service") %>' /></b></td>
        <td><asp:CheckBox ID="CB" runat="server"/></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate></table></FooterTemplate>
    </asp:DataList>
    
        <asp:Button ID="btnSave" runat="server" Text="Sauvegarder" 
        onclick="btnSave_Click" />
</div>
</center>
</asp:Content>
