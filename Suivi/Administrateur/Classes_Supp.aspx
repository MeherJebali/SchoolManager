<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Classes_Supp.aspx.cs" Inherits="Suivi.Administrateur.WebForm13" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Suppression d'une Classe
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Suppression d'une Classe
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
    <div class="profs">
        <asp:SqlDataSource ID="DSSuppClasses" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            SelectCommand="SELECT ID_classe AS Classe FROM Classe ORDER BY ID_classe" 
            DeleteCommand="DELETE FROM Classe WHERE (ID_classe = @Classe)">
            <DeleteParameters>
                <asp:Parameter Name="Classe" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Classe" DataSourceID="DSSuppClasses" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Vertical" Width="241px">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="Classe" HeaderText="Classe" ReadOnly="True" 
                    SortExpression="Classe" />
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
