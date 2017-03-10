<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Conges_Modif.aspx.cs" Inherits="Suivi.Administrateur.WebForm31" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Modifier un congé
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Modifier un congé
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
    <asp:SqlDataSource ID="DSConges" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        
        SelectCommand="Select Prenom_ens + ' ' + Nom_ens as NomEns,Raison_conge,Duree_conge,DateDEbut_conge FROM Enseignant,Conge WHERE EtatDemande_conge='True' AND Enseignant.CIN_ens=Conge.CIN_ens" 
        DeleteCommand="DELETE FROM [Conge] WHERE [ID_conge] = @ID_conge" 
        UpdateCommand="UPDATE [Conge] SET  [Duree_conge] = @Duree_conge, [DateDebut_conge] = @DateDebut_conge, [EtatDemande_conge] = @EtatDemande_conge, [CIN_ens] = @CIN_ens WHERE [ID_conge] = @ID_conge">
        <DeleteParameters>
            <asp:Parameter Name="ID_conge" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Duree_conge" Type="Int32" />
            <asp:Parameter Name="DateDebut_conge" />
            <asp:Parameter Name="EtatDemande_conge" Type="Boolean" />
            <asp:Parameter Name="CIN_ens" Type="String" />
            <asp:Parameter Name="ID_conge" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="DSConges" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Vertical" Height="182px" Width="603px" HorizontalAlign="Center">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="NomEns" HeaderText="Enseignant" 
                SortExpression="NomEns" ReadOnly="true" ApplyFormatInEditMode="true" />
            <asp:BoundField DataField="Raison_conge" HeaderText="Raison" 
                SortExpression="Raison_conge" ReadOnly="true" ApplyFormatInEditMode="true"/>
            <asp:BoundField DataField="Duree_conge" HeaderText="Durée" 
                SortExpression="Duree_conge" />
            <asp:BoundField DataField="DateDebut_conge" HeaderText="Date debut du conge" 
                SortExpression="DateDebut_conge" DataFormatString="{0:d}" ApplyFormatInEditMode="true"/>
            <asp:CommandField HeaderText="Modifier" ShowEditButton="True" />
            <asp:CommandField HeaderText="Annuler" ShowDeleteButton="True" />
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
