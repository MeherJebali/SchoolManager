<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Eleves_Modif.aspx.cs" Inherits="Suivi.Administrateur.WebForm18" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Modifier un élève
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Modifier un élève
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<center>
    <div class="profs">
        <asp:SqlDataSource ID="DSEleves" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            DeleteCommand="DELETE FROM [Eleve] WHERE [ID_eleve] = @ID_eleve" 
            SelectCommand="SELECT [ID_eleve], [Prenom_eleve], [Nom_eleve], [DateNais_eleve] FROM [Eleve]" 
            UpdateCommand="UPDATE [Eleve] SET [Prenom_eleve] = @Prenom_eleve, [Nom_eleve] = @Nom_eleve, [DateNais_eleve] = @DateNais_eleve WHERE [ID_eleve] = @ID_eleve">
            <DeleteParameters>
                <asp:Parameter Name="ID_eleve" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Prenom_eleve" Type="String" />
                <asp:Parameter Name="Nom_eleve" Type="String" />
                <asp:Parameter Name="DateNais_eleve" />
                <asp:Parameter Name="ID_eleve" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GVEleves" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="ID_eleve" DataSourceID="DSEleves" ForeColor="Black" 
            GridLines="Vertical" Width="695px" PageSize="8">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="ID_eleve" HeaderText="ID_eleve" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ID_eleve" 
                    Visible="False" />
                <asp:BoundField DataField="Prenom_eleve" HeaderText="Prénom" 
                    SortExpression="Prenom_eleve" />
                <asp:BoundField DataField="Nom_eleve" HeaderText="Nom" 
                    SortExpression="Nom_eleve" />
                <asp:BoundField DataField="DateNais_eleve" 
                    HeaderText="Date de naissance" SortExpression="DateNais_eleve" 
                    ApplyFormatInEditMode = True DataFormatString="{0:d}"/>
                <asp:CommandField ShowEditButton="True" HeaderText="Modifier" />
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
