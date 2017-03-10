<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Matieres_Modif.aspx.cs" Inherits="Suivi.Administrateur.WebForm15" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Modifier une matière
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Modifier une matière
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
<div class="profs">
    <asp:SqlDataSource ID="DSMatieres" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        
        SelectCommand="SELECT ID_mat, Lib_mat AS Matière, Coef_mat AS Coefficient FROM Matiere" 
        DeleteCommand="DELETE FROM Matiere WHERE (ID_mat = @ID_mat)" 
        UpdateCommand="UPDATE Matiere SET Lib_mat = @Matière, Coef_mat = @Coefficient WHERE (ID_mat = @ID_mat)">
        <DeleteParameters>
            <asp:Parameter Name="ID_mat" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Matière" />
            <asp:Parameter Name="Coefficient" />
            <asp:Parameter Name="ID_mat" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GVMatieres" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="ID_mat" DataSourceID="DSMatieres" 
        ForeColor="Black" GridLines="Vertical">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="ID_mat" HeaderText="ID_mat" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID_mat" Visible="False" />
            <asp:BoundField DataField="Matière" HeaderText="Matière" 
                SortExpression="Matière" />
            <asp:BoundField DataField="Coefficient" HeaderText="Coefficient" 
                SortExpression="Coefficient" />
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
