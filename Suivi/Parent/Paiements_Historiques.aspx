<%@ Page Title="" Language="C#" MasterPageFile="~/Parent/Parent.Master" AutoEventWireup="true" CodeBehind="Paiements_Historiques.aspx.cs" Inherits="Suivi.Parent.WebForm7" %>
<%@ Register Assembly="ASP.Web.UI.PopupControl" Namespace="ASP.Web.UI.PopupControl" TagPrefix="ASPP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Historiques de paiement
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Historiques de paiement
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
    <div class="profs">
    <asp:SqlDataSource ID="DSPaiementsMois" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        
            SelectCommand="SELECT Eleve.Prenom_eleve + '  ' + Eleve.Nom_eleve AS Eleve, Service.Lib_service AS Service, Paiement.Prix_paiement AS Payé, Paiement.Date_paiement AS [Date de Paiement] FROM Eleve INNER JOIN Paiement ON Eleve.ID_eleve = Paiement.ID_eleve INNER JOIN Service ON Paiement.ID_service = Service.ID_service WHERE (Paiement.Date_paiement &gt;= DATEADD(day, - 29, GETDATE())) AND (Paiement.ID_eleve = @eleve) ORDER BY Eleve">
        <SelectParameters>
            <asp:QueryStringParameter Name="eleve" QueryStringField="ID_eleve" />
        </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="lbl" runat="server" Text=" " Font-Bold="True" Font-Size="16pt"></asp:Label>
        <br />
        <asp:GridView ID="GVPaiementsMois" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="DSPaiementsMois" ForeColor="Black" 
            GridLines="Vertical" Width="335px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Eleve" HeaderText="Eleve" ReadOnly="True" 
                    SortExpression="Eleve" />
                <asp:BoundField DataField="Service" HeaderText="Service" 
                    SortExpression="Service" />
                <asp:BoundField DataField="Payé" HeaderText="Payé" SortExpression="Payé" />
                <asp:BoundField DataField="Date de Paiement" HeaderText="Date de Paiement" 
                    SortExpression="Date de Paiement" DataFormatString="{0:d}" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    <asp:SqlDataSource ID="DSPaiements" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            SelectCommand="SELECT Eleve.Prenom_eleve + '  ' + Eleve.Nom_eleve AS Eleve, Service.Lib_service AS Service, Paiement.Prix_paiement AS Payé, Paiement.Date_paiement AS [Date de Paiement] FROM Eleve INNER JOIN Paiement ON Eleve.ID_eleve = Paiement.ID_eleve INNER JOIN Service ON Paiement.ID_service = Service.ID_service WHERE (Paiement.ID_eleve = @date) ORDER BY Eleve">
        <SelectParameters>
            <asp:QueryStringParameter Name="date" QueryStringField="ID_eleve" />
        </SelectParameters>
        </asp:SqlDataSource>
    <br />
    <br />
        <asp:Button ID="btnSignaler" runat="server" Text="Signaler" Font-Bold="True" 
            Font-Size="16pt" Height="45px" onclick="btnSignaler_Click" Width="137px" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
        <asp:Label ID="Label1" runat="server" Text="Historique" Font-Bold="True" 
            Font-Size="16pt"></asp:Label>
        <br />
    <asp:GridView ID="GVPaiements" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="DSPaiements" Width="335px" 
            HorizontalAlign="Center">
        <RowStyle BackColor="White" ForeColor="#330099" />
        <Columns>
            <asp:BoundField DataField="Eleve" HeaderText="Eleve" ReadOnly="True" 
                SortExpression="Eleve" />
            <asp:BoundField DataField="Service" HeaderText="Service" 
                SortExpression="Service" />
            <asp:BoundField DataField="Payé" HeaderText="Payé" SortExpression="Payé" />
            <asp:BoundField DataField="Date de Paiement" DataFormatString="{0:d}" 
                HeaderText="Date de Paiement" SortExpression="Date de Paiement" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <aspp:popuppanel HeaderText="Envoyer une reclamation" ID="pup1" runat="server" 
        Width="400px" >
            <PopupWindow runat="server" >
                <ASPP:PopupWindow ID="PopupWindow1" Visible="true" runat="server">
                    <asp:TextBox ID="txtMsg" runat="server" Width="350px" Height="100px" TextMode="MultiLine" MaxLength="499"></asp:TextBox>
                    <asp:Button ID="btnEnvoyer" runat="server" Text="Envoyer" OnClick="btnEnvoyer_Click"/>
                </ASPP:PopupWindow>
            </PopupWindow>
        </aspp:popuppanel>
    </div>
    </center>
</asp:Content>
