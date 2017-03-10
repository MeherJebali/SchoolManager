<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Demandes_Details.aspx.cs" Inherits="Suivi.Administrateur.WebForm29" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Les détails d'un congé
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les détails d'un congé
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <div class="profs">
    <asp:SqlDataSource ID="DSDetailsConge" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT Enseignant.Prenom_ens + ' ' + Enseignant.Nom_ens AS NomEns, Conge.Raison_conge, Conge.Duree_conge, Conge.DateDebut_conge FROM Conge INNER JOIN Enseignant ON Conge.CIN_ens = Enseignant.CIN_ens WHERE (Conge.ID_conge = @ID_conge)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID_conge" QueryStringField="ID_conge" />
        </SelectParameters>
    </asp:SqlDataSource>
<div id="EventDetails">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="DSDetailsConge">
        <ItemTemplate>
            <h3><u>Nom de l'enseignant:</u></h3>
            <b>&nbsp;&nbsp;&nbsp;<asp:Label ID="NomEnsLabel" runat="server" Text='<%# Eval("NomEns") %>' /></b>
            <br />
            <h3><u>Raison du congé:</u></h3> 
            <b>&nbsp;&nbsp;&nbsp;<asp:Label ID="Raison_congeLabel" runat="server" 
                Text='<%# Eval("Raison_conge") %>' /></b>
            <br />
            <h3><u>Duree du congé:</u></h3>
            <b>&nbsp;&nbsp;&nbsp;<asp:Label ID="Duree_congeLabel" runat="server" 
                Text='<%# Eval("Duree_conge") %>' /> Jours</b>
            <br />
            <h3><u>Le congé commence le:</u></h3>
            <b>&nbsp;&nbsp;&nbsp;<asp:Label ID="DateDebut_congeLabel" runat="server" 
                Text='<%# Eval("DateDebut_conge","{0:d}") %>' /></b>
            <br />
            <br />
            <asp:Button  runat="server" Text="Confirmer" 
        onclick="btnConfirmer_Click" />
    <asp:Button  runat="server" Text="Annuler" 
        onclick="btnAnnuler_Click" />
        </ItemTemplate>
    </asp:DataList>
</div>
</div>
</asp:Content>
