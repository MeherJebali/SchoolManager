<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Parents_Modif.aspx.cs" Inherits="Suivi.Administrateur.WebForm8" Title="Page sans titre" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Modifier un parent
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Modifier un parent
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="test" runat="server">
    <center>
    <div class="profs">
        <asp:SqlDataSource ID="LesParents" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            
            SelectCommand="SELECT UserName_parent AS [Nom d'utilisateur],CIN_parent, Prenom_parent AS Prénom, Nom_parent AS Nom, Email_parent AS Email, Tel_parent AS Téléphone FROM Parent" 
            
            UpdateCommand="UPDATE Parent SET Prenom_parent = @Prénom, Nom_parent = @Nom, Email_parent = @Email, Tel_parent =@Téléphone WHERE CIN_parent =@CIN_parent" 
            DeleteCommand="DELETE FROM Parent WHERE (CIN_parent = @CIN_parent)">
            <DeleteParameters>
                <asp:Parameter Name="CIN_parent" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Prénom" />
                <asp:Parameter Name="Nom" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Téléphone" />
                <asp:Parameter Name="CIN_parent" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GvParents" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataSourceID="LesParents" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="463px" 
            style="margin-left: 0px" Width="695px" DataKeyNames="CIN_parent" 
            PageSize="8" onrowdeleted="GvParents_RowDeleted" 
            onrowdeleting="GvParents_RowDeleting">
            <RowStyle BackColor="#F7F7DE"/>
            <Columns>
                <asp:BoundField DataField="Nom d'utilisateur" HeaderText="Nom d'utilisateur" 
                    SortExpression="Nom d'utilisateur" ItemStyle-Height=20 ReadOnly="true" ApplyFormatInEditMode="true"/>
                <asp:BoundField DataField="CIN_parent" HeaderText="CIN_parent" SortExpression="CIN_parent" 
                    ItemStyle-Height=20 ReadOnly="True" Visible="False"/>
                <asp:BoundField DataField="Prénom" HeaderText="Prénom" SortExpression="Prénom" 
                    ItemStyle-Height=20/>
                <asp:BoundField DataField="Nom" HeaderText="Nom" 
                    SortExpression="Nom" ItemStyle-Height=20/>
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
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Height=20/>
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
</center>
</asp:Content>
