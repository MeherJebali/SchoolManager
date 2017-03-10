<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Classes_Modif.aspx.cs" Inherits="Suivi.Administrateur.WebForm12" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Affectation des classes
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Affectation des classes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
<div class="profs">
    <asp:SqlDataSource ID="EleveNull" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        
        
        SelectCommand="SELECT [ID_eleve], [Prenom_eleve] +' '+  [Nom_eleve] as Eleve FROM [Eleve] WHERE [ID_classe] IS NULL">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSClasse" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT [ID_classe] FROM [Classe]"></asp:SqlDataSource>
    <b>Classes : </b><asp:DropDownList ID="ListClasses" runat="server" DataSourceID="DSClasse" 
        DataTextField="ID_classe" DataValueField="ID_classe" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="DSAffecte" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT [ID_eleve], [Prenom_eleve]+' '+ [Nom_eleve] as Eleve FROM [Eleve] WHERE ([ID_classe] = @ID_classe)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ListClasses" Name="ID_classe" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="Panel" runat="server">
    <div id="hdrLBLeft"><h3>Elèves non affectés</h3></div>
    <div id="hdrLBRight"><h3>Elèves affectés</h3></div>
    <asp:ListBox ID="ListNull" runat="server" AutoPostBack="True" Width="30%" 
            Height="300px" DataSourceID="EleveNull" DataTextField="Eleve" 
            DataValueField="ID_eleve" 
            onselectedindexchanged="ListNull_SelectedIndexChanged" ></asp:ListBox>
        <asp:Button ID="ToRight" runat="server" Text=">>" Width="75px" 
            onclick="ToRight_Click" Enabled="False" />
        <asp:Button ID="toLeft" runat="server" Text="<<" Width="74px" 
            onclick="toLeft_Click" Enabled="False" />
        <asp:ListBox ID="ListAffect" runat="server" AutoPostBack="True" Width="30%" 
            Height="300px" DataSourceID="DSAffecte" DataTextField="Eleve" 
            DataValueField="ID_eleve" 
            onselectedindexchanged="ListAffect_SelectedIndexChanged"></asp:ListBox>    
    </asp:Panel>
</div>
</center> 
</asp:Content>
