<%@ Page Language="C#" MasterPageFile="~/Enseignant/Enseignant.Master" AutoEventWireup="true" CodeBehind="Demandes_Modif.aspx.cs" Inherits="Suivi.Enseignant.WebForm5" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Modifier un congé
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Modifier un congé
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
<div class="profs">
<asp:SqlDataSource ID="DSEditConge" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        DeleteCommand="DELETE FROM [Conge] WHERE [ID_conge] = @ID_conge" 
        InsertCommand="INSERT INTO [Conge] ([Raison_conge], [Duree_conge], [DateDebut_conge]) VALUES (@Raison_conge, @Duree_conge, @DateDebut_conge)" 
        UpdateCommand="UPDATE [Conge] SET [Raison_conge] = @Raison_conge, [Duree_conge] = @Duree_conge, [DateDebut_conge] = @DateDebut_conge WHERE [ID_conge] = @ID_conge" >
    <DeleteParameters>
        <asp:Parameter Name="ID_conge" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="Raison_conge" Type="String" />
        <asp:Parameter Name="Duree_conge" Type="Int32" />
        <asp:Parameter Name="DateDebut_conge" />
        <asp:Parameter Name="ID_conge" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID_conge" DataSourceID="DSEditConge" HorizontalAlign=Center 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="ID_conge" HeaderText="ID_conge" 
                InsertVisible="False" ReadOnly="True" SortExpression="ID_conge" 
                Visible="False" />
            <asp:BoundField DataField="Raison_conge" HeaderText="Raison" 
                SortExpression="Raison_conge" />
            <asp:BoundField DataField="Duree_conge" HeaderText="Duree" 
                SortExpression="Duree_conge" />
            <asp:BoundField DataField="DateDebut_conge" HeaderText="Date debut du conge" 
                SortExpression="DateDebut_conge" DataFormatString="{0:d}" ApplyFormatInEditMode = True />
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
