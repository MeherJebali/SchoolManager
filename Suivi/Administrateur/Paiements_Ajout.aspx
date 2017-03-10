<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Paiements_Ajout.aspx.cs" Inherits="Suivi.Administrateur.WebForm35" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Ajouter un paiement
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Ajouter un paiement
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
<div class="profs">
    <asp:SqlDataSource ID="DSEleves" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT [ID_eleve], [Prenom_eleve]+' '+ [Nom_eleve] as Eleve FROM [Eleve]"></asp:SqlDataSource>
    <b>Elève : </b><asp:DropDownList ID="ListEleves" runat="server" AutoPostBack="True" 
        DataSourceID="DSEleves" DataTextField="Eleve" DataValueField="Id_eleve" 
        onselectedindexchanged="ListEleves_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="DSServices" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT * FROM [Service]"></asp:SqlDataSource>   
      
    <br />
    <br />
    <br />
    <br />
    <asp:DataList ID="DLServices" runat="server" DataKeyField="ID_service" 
        DataSourceID="DSServices" onitemdatabound="DLServices_ItemDataBound">
        <HeaderTemplate>
        <table>
        </HeaderTemplate>
        <ItemTemplate>
        <asp:Label ID="ID_service" runat="server" 
                Text='<%# Eval("ID_service") %>' Visible="false"/>
        <asp:Label ID="Cout" runat="server" 
                Text='<%# Eval("Cout_service") %>' Visible="false"/>
        <tr>
        <td><b><asp:Label ID="Lib_serviceLabel" runat="server" 
                Text='<%# Eval("Lib_service") %>' /></b></td>
        <td><asp:CheckBox ID="CB" runat="server" /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate></table></FooterTemplate>
    </asp:DataList>
    <br />
    
    <asp:Label ID="lblmsg" runat="server" Text=" "></asp:Label>
    <br />
    <br />
    <asp:Button ID="btnEnregistrer" runat="server" Text="Enregistrer" 
        onclick="btnEnregistrer_Click" style="height: 26px" /> 
</div>
</center>
</asp:Content>
