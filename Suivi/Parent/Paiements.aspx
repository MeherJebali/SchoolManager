﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Parent/Parent.Master" AutoEventWireup="true" CodeBehind="Paiements.aspx.cs" Inherits="Suivi.Parent.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Les paiements
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les paiements
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
    <div class="profs">
        <h3>Veuillez Sélectionner l'élève</h3>
        <asp:SqlDataSource ID="DSEleves" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            SelectCommand="SELECT [Prenom_eleve], [Nom_eleve], [Photo_eleve], [ID_eleve] FROM [Eleve] WHERE ([CIN_parent] = @CIN_parent)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtcin" Name="CIN_parent" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DLEleve" runat="server" RepeatColumns="4" 
            HorizontalAlign="Center" BorderColor="#14327B" DataSourceID="DSEleves">
            <ItemTemplate>
                    <table border="2" rules=none BorderColor="#808080">
                    <tr>
                        <td colspan="2">
                            <asp:Image ID="photo" runat="server" ImageURL='<%# Eval("Photo_eleve") %>'  Width="200px" Height="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPreNom" runat="server" Text='<%# Eval("Prenom_eleve") %>' Font-Bold="True"></asp:Label>
                            <asp:Label ID="lblNom" runat="server" Text='<%# Eval("Nom_eleve") %>' Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="Paiements_Historiques.aspx?ID_eleve=<%# Eval("ID_eleve") %>">Voir Historique</a>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>

    </div>
    </center>
    
 <asp:TextBox ID="txtcin" runat="server" Visible="false"></asp:TextBox>
</asp:Content>
