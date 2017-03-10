<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Paiements_Historiques.aspx.cs" Inherits="Suivi.Administrateur.WebForm36" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    L'historique des paiements
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    L'historique des paiements
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
    <asp:SqlDataSource ID="DSPaiements" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        
        
        
        SelectCommand="SELECT Eleve.Prenom_eleve + '  ' + Eleve.Nom_eleve AS Eleve, Service.Lib_service AS Service, Paiement.Prix_paiement AS Payé, Paiement.Date_paiement AS [Date de Paiement] FROM Eleve INNER JOIN Paiement ON Eleve.ID_eleve = Paiement.ID_eleve INNER JOIN Service ON Paiement.ID_service = Service.ID_service ORDER BY Eleve"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GVPaiements" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="DSPaiements" ForeColor="Black" 
        GridLines="Vertical" Width="335px" HorizontalAlign="Center">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="Eleve" HeaderText="Eleve" ReadOnly="True" 
                SortExpression="Eleve" />
            <asp:BoundField DataField="Service" HeaderText="Service" 
                SortExpression="Service" />
            <asp:BoundField DataField="Payé" HeaderText="Payé" SortExpression="Payé" />
            <asp:BoundField DataField="Date de Paiement" DataFormatString="{0:d}" 
                HeaderText="Date de Paiement" SortExpression="Date de Paiement" />
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
