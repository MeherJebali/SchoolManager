<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Services_Modif.aspx.cs" Inherits="Suivi.Administrateur.WebForm25" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Modifier un service
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Modifier un service
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
    <asp:SqlDataSource ID="DSEditService" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        DeleteCommand="DELETE FROM [Service] WHERE [ID_service] = @ID_service" 
        InsertCommand="INSERT INTO [Service] ([Lib_service], [Cout_service]) VALUES (@Lib_service, @Cout_service)" 
        
        SelectCommand="SELECT [ID_service], [Lib_service], [Cout_service] FROM [Service]" 
        UpdateCommand="UPDATE [Service] SET [Lib_service] = @Lib_service, [Cout_service] = @Cout_service WHERE [ID_service] = @ID_service">
        <DeleteParameters>
            <asp:Parameter Name="ID_service" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Lib_service" Type="String" />
            <asp:Parameter Name="Cout_service" Type="Double" />
            <asp:Parameter Name="ID_service" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Lib_service" Type="String" />
            <asp:Parameter Name="Cout_service" Type="Double" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GVEditService" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="ID_service" DataSourceID="DSEditService" 
        ForeColor="Black" GridLines="Vertical">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="ID_service" HeaderText="ID_service" 
                InsertVisible="False" ReadOnly="True" SortExpression="ID_service" 
                Visible="False" />
            <asp:BoundField DataField="Lib_service" HeaderText="Service" 
                SortExpression="Lib_service" />
            <asp:BoundField DataField="Cout_service" HeaderText="Coût" 
                SortExpression="Cout_service" />
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
