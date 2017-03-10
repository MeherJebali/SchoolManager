<%@ Page Title="" Language="C#" MasterPageFile="~/Parent/Parent.Master" AutoEventWireup="true" CodeBehind="Absences_Details.aspx.cs" Inherits="Suivi.Parent.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Détails des absences
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    Détails des absences
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="test" runat="server">
<center>
    <div class="profs">
        <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox>
        <asp:SqlDataSource ID="DSAbsences" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            
            SelectCommand="SELECT Matiere.Lib_mat, Absence.Date_abs FROM Absence INNER JOIN Matiere ON Absence.ID_mat = Matiere.ID_mat WHERE (Absence.ID_eleve = @ID_eleve) ORDER BY Absence.Date_abs DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtID" Name="ID_eleve" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GVAbsences" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="DSAbsences" ForeColor="Black" 
            GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Lib_mat" HeaderText="Lib_mat" 
                    SortExpression="Lib_mat" />
                <asp:BoundField DataField="Date_abs" DataFormatString="{0:d}" 
                    HeaderText="Date_abs" SortExpression="Date_abs" />
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
