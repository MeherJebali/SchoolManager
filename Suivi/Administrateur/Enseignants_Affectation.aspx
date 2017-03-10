<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Enseignants_Affectation.aspx.cs" Inherits="Suivi.Administrateur.WebForm32" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
Affecter Enseignant
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Affecter Enseignant
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
     <div class="profs">
         <asp:SqlDataSource ID="DSEnseignants" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
             SelectCommand="SELECT [CIN_ens], [Prenom_ens] + ' ' + [Nom_ens] as NomEns FROM [Enseignant]"></asp:SqlDataSource>
         <asp:DropDownList ID="ListEnseignants" runat="server" 
             DataSourceID="DSEnseignants" DataTextField="NomEns" DataValueField="CIN_ens">
         </asp:DropDownList>
         <asp:SqlDataSource ID="DSClasses" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
             SelectCommand="SELECT [ID_classe] FROM [Classe]"></asp:SqlDataSource>
         <asp:DropDownList ID="ListClasses" runat="server" DataSourceID="DSClasses" 
             DataTextField="ID_classe" DataValueField="ID_classe">
         </asp:DropDownList>
         <asp:SqlDataSource ID="DSMatieres" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
             SelectCommand="SELECT [ID_mat], [Lib_mat] FROM [Matiere]"></asp:SqlDataSource>
         <asp:DropDownList ID="ListMatieres" runat="server" DataSourceID="DSMatieres" 
             DataTextField="Lib_mat" DataValueField="ID_mat">
         </asp:DropDownList>
         <asp:Button ID="BtnAffecter" runat="server" Text="Affecter" 
             onclick="BtnAffecter_Click" />
         <br />
         <br />
         <asp:Label ID="lblmsg" runat="server" Text=" "></asp:Label>
         <asp:SqlDataSource ID="DSAffectations" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
             DeleteCommand="DELETE FROM [Enseigner] WHERE [CIN_ens] = @CIN_ens AND [ID_classe] = @ID_classe AND [ID_mat] = @ID_mat" 
             
             
             SelectCommand="SELECT Enseignant.Prenom_ens + ' ' + Enseignant.Nom_ens AS Enseignant, Matiere.Lib_mat, Enseigner.* FROM Enseignant INNER JOIN Enseigner ON Enseignant.CIN_ens = Enseigner.CIN_ens INNER JOIN Matiere ON Enseigner.ID_mat = Matiere.ID_mat">
             <DeleteParameters>
                 <asp:Parameter Name="CIN_ens" Type="String" />
                 <asp:Parameter Name="ID_classe" Type="String" />
                 <asp:Parameter Name="ID_mat" Type="Int32" />
             </DeleteParameters>
         </asp:SqlDataSource>
         <br />
         <br />
         <asp:GridView ID="GVAffectations" runat="server" AutoGenerateColumns="False" 
             DataSourceID="DSAffectations" DataKeyNames="CIN_ens,ID_classe,ID_mat" 
             BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
             CellPadding="4" ForeColor="Black" GridLines="Vertical">
             <RowStyle BackColor="#F7F7DE" />
             <Columns>
                 <asp:BoundField DataField="Enseignant" HeaderText="Enseignant" 
                     SortExpression="Enseignant" ReadOnly="True" />
                 <asp:BoundField DataField="Lib_mat" HeaderText="Matière" 
                     SortExpression="Lib_mat" />
                 <asp:BoundField DataField="CIN_ens" HeaderText="CIN_ens" 
                     SortExpression="CIN_ens" ReadOnly="True" visible ="false" />
                 <asp:BoundField DataField="ID_classe" HeaderText="Classe" 
                     SortExpression="ID_classe" ReadOnly="True" />
                 <asp:BoundField DataField="ID_mat" HeaderText="ID_mat" ReadOnly="True" 
                     SortExpression="ID_mat" visible ="false" />
                 <asp:CommandField ShowDeleteButton="True" HeaderText="Supprimer" />
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
