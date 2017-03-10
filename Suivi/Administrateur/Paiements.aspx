<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Paiements.aspx.cs" Inherits="Suivi.Administrateur.WebForm34" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Les Paiements
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les Paiements
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
<div class="profs">
    <asp:SqlDataSource ID="DSPaiements" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT Eleve.Prenom_eleve + '  ' + Eleve.Nom_eleve AS Eleve, Service.Lib_service AS Service, Paiement.Prix_paiement AS Payé, Paiement.Date_paiement AS [Date de Paiement] FROM Eleve INNER JOIN Paiement ON Eleve.ID_eleve = Paiement.ID_eleve INNER JOIN Service ON Paiement.ID_service = Service.ID_service WHERE (Paiement.Date_paiement &gt;= DATEADD(day, - 29, GETDATE())) ORDER BY Eleve"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DSNonPayes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT Eleve.ID_eleve, Eleve.Prenom_eleve + '  ' + Eleve.Nom_eleve AS Eleve, MAX(Paiement.Date_paiement) AS Dernier FROM Eleve INNER JOIN Paiement ON Eleve.ID_eleve = Paiement.ID_eleve WHERE (Paiement.Date_paiement &lt;= DATEADD(day, - 29, GETDATE())) AND (Paiement.Date_paiement IN (SELECT MAX(Date_paiement) AS Expr1 FROM Paiement AS Paiement_1 GROUP BY ID_eleve)) GROUP BY Eleve.Prenom_eleve, Eleve.Nom_eleve, Eleve.ID_eleve ORDER BY Eleve"></asp:SqlDataSource>
        
            <asp:Label ID="lblMois" runat="server" Text=""  Font-Bold="True" Font-Size="16"></asp:Label>
    <br />
    <asp:GridView ID="GVPaiements" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="DSPaiements" ForeColor="Black" 
        GridLines="Vertical" Width="335px" HorizontalAlign="Center">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="Eleve" HeaderText="Eleve" ReadOnly="True" 
                SortExpression="Eleve" />
            <asp:BoundField DataField="Service" HeaderText="Service" 
                SortExpression="Service" />
            <asp:BoundField DataField="Payé" HeaderText="Payé" SortExpression="Payé" />
            <asp:BoundField DataField="Date de Paiement" DataFormatString="{0:d}" 
                HeaderText="Date de Paiement" SortExpression="Date de Paiement" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
    <br />
    <br />
    
            <asp:Label ID="lblNonPayés" runat="server" Text="" Font-Bold="True" Font-Size="16"></asp:Label>
    <br />
    <asp:DataList ID="ListNonPayes" runat="server" DataSourceID="DSNonPayes" 
        Width="330px" onitemcommand="ListNonPayes_ItemCommand">
    <HeaderTemplate><table width="333px"><tr bgcolor="#ff0000"  style="color:white;"><th>Elève</th><th>Dernier Paiement</th><th>Alerter</th></tr></HeaderTemplate>
    <ItemTemplate>
        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID_eleve") %>' Visible="false"></asp:Label>
        <tr>
        <td>
            <asp:Label ID="lblNom" runat="server" Text='<%# Eval("Eleve") %>'></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Dernier","{0:d}") %>'></asp:Label>
        </td>
        <td>
            <asp:Button ID="btnAlerter" runat="server" Text="Alerter" CommandName="Alerter"/>
        </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
    </asp:DataList>
    <asp:Label ID="lblSucces" runat="server" Text=" "></asp:Label>
</div>
</center>
</asp:Content>
