<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Conges.aspx.cs" Inherits="Suivi.Administrateur.WebForm30" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Les Congés
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les Congés
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
<div class="profs">
    <asp:SqlDataSource ID="DSConges" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="Select Prenom_ens + ' ' + Nom_ens as NomEns,Raison_conge,Duree_conge,DateDEbut_conge FROM Enseignant,Conge WHERE EtatDemande_conge='True' AND Enseignant.CIN_ens=Conge.CIN_ens" ></asp:SqlDataSource>
        <br />
    <asp:GridView ID="GVConges" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="DSConges" ForeColor="Black" GridLines="Vertical" Height="182px" Width="603px" HorizontalAlign=Center>
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="NomEns" HeaderText="Enseignant" ReadOnly="True" 
                SortExpression="NomEns" />
            <asp:BoundField DataField="Raison_conge" HeaderText="Raison" 
                SortExpression="Raison_conge" />
            <asp:BoundField DataField="Duree_conge" HeaderText="Durée" 
                SortExpression="Duree_conge" />
            <asp:BoundField DataField="DateDEbut_conge" HeaderText="Date debut du conge" 
                SortExpression="DateDEbut_conge" DataFormatString="{0:d}" />
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
