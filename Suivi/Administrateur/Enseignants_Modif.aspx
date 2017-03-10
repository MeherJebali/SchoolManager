<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Enseignants_Modif.aspx.cs" Inherits="Suivi.Administrateur.WebForm5" Title="Page sans titre" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Modifier un enseignant
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Modifier un enseignant
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="test" runat="server">
    <center>
    <div class="profs">
        <asp:SqlDataSource ID="lesEnseignant" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            DeleteCommand="DELETE FROM Enseignant WHERE (CIN_ens = @CIN_ens)" 
            SelectCommand="SELECT Username_ens AS [Nom d'utilisateur],CIN_ens, Prenom_ens AS Prénom, Nom_ens AS Nom, Email_ens AS Email, Tel_ens AS Téléphone FROM Enseignant" 
            UpdateCommand="UPDATE Enseignant SET Nom_ens = @Nom, Prenom_ens = @Prénom, Tel_ens = @Téléphone, Email_ens = @Email WHERE (CIN_ens = @CIN_ens)">
            <DeleteParameters>
                <asp:Parameter Name="CIN_ens" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nom" />
                <asp:Parameter Name="Prénom" />
                <asp:Parameter Name="Téléphone" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="CIN_ens" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GvEnseignant" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="CIN_ens" 
            DataSourceID="lesEnseignant" ForeColor="Black" GridLines="Vertical" 
            Height="463px" style="margin-left: 0px" Width="695px" PageSize="8" 
            onrowdeleted="GvEnseignant_RowDeleted" onrowdeleting="GvEnseignant_RowDeleting">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="Nom d'utilisateur" HeaderText="Nom d'utilisateur" 
                    SortExpression="Nom d'utilisateur" ReadOnly="true" ApplyFormatInEditMode="true"/>
                <asp:BoundField DataField="CIN_ens" HeaderText="CIN_ens" 
                    SortExpression="CIN_ens" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="Prénom" HeaderText="Prénom" 
                    SortExpression="Prénom" />
                <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
                <asp:BoundField DataField="Email" HeaderText="Email" 
                    SortExpression="Email" />
                <asp:BoundField DataField="Téléphone" HeaderText="Téléphone" 
                    SortExpression="Téléphone" />
                <asp:CommandField HeaderText="Modifier" ShowEditButton="True" />
                <asp:CommandField HeaderText="Supprimer" ShowDeleteButton="True" />
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
