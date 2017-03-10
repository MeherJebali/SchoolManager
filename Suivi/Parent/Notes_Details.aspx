<%@ Page Title="" Language="C#" MasterPageFile="~/Parent/Parent.Master" AutoEventWireup="true" CodeBehind="Notes_Details.aspx.cs" Inherits="Suivi.Parent.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
Détails des notes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
Détails des notes
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="test" runat="server">
<center>
    <div class="profs">
        <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox>
        <asp:Label ID="lblText" runat="server" Text="Choisissez le trimestre :"></asp:Label>
        <asp:DropDownList ID="ListeTrimestre" runat="server" AutoPostBack="True">
            <asp:ListItem Selected="True" Value="1">Trimestre 1</asp:ListItem>
            <asp:ListItem Value="2">Trimestre 2</asp:ListItem>
            <asp:ListItem Value="3">Trimestre 3</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="DSNotes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            
            SelectCommand="SELECT Matiere.Lib_mat, Matiere.Coef_mat, Note.Valeur_note, Note.Trimestre, Note.ID_eleve, Note.Valeur_note * Matiere.Coef_mat AS Total FROM Matiere INNER JOIN Note ON Matiere.ID_mat = Note.ID_mat WHERE (Note.Trimestre = @Trimestre) AND (Note.ID_eleve = @IDEleve)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListeTrimestre" Name="Trimestre" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtID" Name="IDEleve" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:GridView ID="GVNotes" runat="server" DataSourceID="DSNotes" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
            GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Lib_mat" HeaderText="Matière" 
                    SortExpression="Lib_mat" />
                <asp:BoundField DataField="Coef_mat" HeaderText="Coefficient" 
                    SortExpression="Coef_mat" />
                <asp:BoundField DataField="Valeur_note" HeaderText="Note" 
                    SortExpression="Valeur_note" />
                <asp:BoundField DataField="Trimestre" HeaderText="Trimestre" 
                    SortExpression="Trimestre" Visible="False" />
                <asp:BoundField DataField="ID_eleve" HeaderText="ID_eleve" 
                    SortExpression="ID_eleve" Visible="False" />
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" 
                    SortExpression="Total" />
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
    </div>
</center>
</asp:Content>

