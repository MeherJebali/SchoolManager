<%@ Page Language="C#" MasterPageFile="~/Enseignant/Enseignant.Master" AutoEventWireup="true" CodeBehind="Demandes.aspx.cs" Inherits="Suivi.Enseignant.WebForm3" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Mes Demandes
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Mes Demandes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
<div class="profs">
    <asp:SqlDataSource ID="DSConge" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>"  ></asp:SqlDataSource>
        <br />
    <asp:GridView ID="GVConge" runat="server" AutoGenerateColumns="False" 
        DataSourceID="DSConge" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Vertical" Width="425px">
        <RowStyle BackColor="#F7F7DE" HorizontalAlign=Center/>
        <Columns>
            <asp:BoundField DataField="Raison_conge" HeaderText="Raison" 
                SortExpression="Raison_conge" />
            <asp:BoundField DataField="Duree_conge" HeaderText="Durée" 
                SortExpression="Duree_conge" />
            <asp:BoundField DataField="DateDebut_conge" HeaderText="Date Debut" 
                SortExpression="DateDebut_conge" DataFormatString="{0:d}" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</div>
</center>
</asp:Content>
