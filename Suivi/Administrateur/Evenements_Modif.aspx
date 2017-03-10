<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Evenements_Modif.aspx.cs" Inherits="Suivi.Administrateur.WebForm21" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Modifier un évènement
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Modifier un évènement
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
<div class="profs">
    <asp:SqlDataSource ID="DSEditEvents" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        
        SelectCommand="SELECT [ID_event], [Lib_event], [Desc_event], [Date_event], [NbrPlaces_event] FROM [Evenement]" 
        DeleteCommand="DELETE FROM [Evenement] WHERE [ID_event] = @ID_event" 
        InsertCommand="INSERT INTO [Evenement] ([Lib_event], [Desc_event], [Date_event], [NbrPlaces_event]) VALUES (@Lib_event, @Desc_event, @Date_event, @NbrPlaces_event)" 
        UpdateCommand="UPDATE [Evenement] SET [Lib_event] = @Lib_event, [Desc_event] = @Desc_event, [Date_event] = @Date_event, [NbrPlaces_event] = @NbrPlaces_event WHERE [ID_event] = @ID_event">
        <DeleteParameters>
            <asp:Parameter Name="ID_event" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Lib_event" Type="String" />
            <asp:Parameter Name="Desc_event" Type="String" />
            <asp:Parameter Name="Date_event" />
            <asp:Parameter Name="NbrPlaces_event" Type="Int32" />
            <asp:Parameter Name="ID_event" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID_event" DataSourceID="DSEditEvents" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        ForeColor="Black" GridLines="Vertical">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="ID_event" HeaderText="ID_event" 
                InsertVisible="False" ReadOnly="True" SortExpression="ID_event" 
                Visible="False" />
            <asp:BoundField DataField="Lib_event" HeaderText="Evènement" 
                SortExpression="Lib_event" />
            <asp:BoundField DataField="Desc_event" HeaderText="Description" 
                SortExpression="Desc_event" />
            <asp:BoundField DataField="Date_event" DataFormatString="{0:d}" 
                HeaderText="Date" SortExpression="Date_event" ApplyFormatInEditMode = True />
            <asp:BoundField DataField="NbrPlaces_event" HeaderText="Nombre de places" 
                SortExpression="NbrPlaces_event" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
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
