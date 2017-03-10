<%@ Page Title="" Language="C#" MasterPageFile="~/Enseignant/Enseignant.Master" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="Suivi.Enseignant.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
Les notes
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les notes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<center>
    <div class="profs">
        <asp:TextBox ID="txtCIN" runat="server" Visible="false"></asp:TextBox>
        <asp:SqlDataSource ID="DSClasses" runat="server" ConnectionString="<%$ ConnectionStrings:Cnxion %>">
        </asp:SqlDataSource>
        <asp:DropDownList ID="ListeClasses" runat="server" DataSourceID="DSClasses" 
            DataTextField="ID_classe" DataValueField="ID_classe" AutoPostBack="True" 
            onselectedindexchanged="ListeClasses_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="DSMatieres" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            SelectCommand="SELECT Matiere.ID_mat, Matiere.Lib_mat FROM Enseigner INNER JOIN Matiere ON Enseigner.ID_mat = Matiere.ID_mat WHERE (Enseigner.ID_classe = @ID_classe) AND (Enseigner.CIN_ens = @CIN)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListeClasses" Name="ID_classe" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtCIN" Name="CIN" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="ListeMatieres" runat="server" DataSourceID="DSMatieres" 
            DataTextField="Lib_mat" DataValueField="ID_mat" AutoPostBack="True" 
            onselectedindexchanged="ListeMatieres_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList ID="ListeTrimestre" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ListeTrimestre_SelectedIndexChanged">
            <asp:ListItem Value="1">Trimestre 1</asp:ListItem>
            <asp:ListItem Value="2">Trimestre 2</asp:ListItem>
            <asp:ListItem Value="3">Trimestre 3</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="DSEleves" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            
            
            SelectCommand="SELECT ID_eleve, Prenom_eleve + ' ' + Nom_eleve AS Eleve FROM Eleve WHERE (ID_classe = @ID_classe)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListeClasses" Name="ID_classe" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DLEleves" runat="server" DataKeyField="ID_eleve" 
            DataSourceID="DSEleves" onitemdatabound="DLEleves_ItemDataBound">
            <HeaderTemplate>
                <table>
                    <tr>
                        <th>Elève</th>
                        <th>Note</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID_eleve") %>' Visible="false"/>

                <tr>
                    <td><asp:Label ID="lblEleve" runat="server" Text='<%# Eval("Eleve") %>' /></td>
                    <td>
                        <asp:TextBox ID="txtNote" runat="server" Width="35px"></asp:TextBox> 
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:DataList>
        <asp:Button ID="BtnEnregistrer" runat="server" Text="Enregistrer" onclick="BtnEnregistrer_Click" />
    </div>
</center>
</asp:Content>
