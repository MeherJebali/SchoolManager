<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Absences.aspx.cs" Inherits="Suivi.Administrateur.WebForm33" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Les Absences
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les Absences
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
     <div class="profs">
         <asp:Calendar ID="Calendrier" runat="server" ondayrender="Calendrier_DayRender" 
             onselectionchanged="Calendrier_SelectionChanged"></asp:Calendar>
         <asp:SqlDataSource ID="DSMatieres" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
             SelectCommand="SELECT Enseigner.ID_mat, Matiere.Lib_mat FROM Enseigner INNER JOIN Matiere ON Enseigner.ID_mat = Matiere.ID_mat WHERE (Enseigner.ID_classe = @ID_classe)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="ListClasses" Name="ID_classe" 
                     PropertyName="SelectedValue" />
             </SelectParameters>
         </asp:SqlDataSource>
         <asp:TextBox ID="txtDate" runat="server" AutoPostBack="true"></asp:TextBox>
         <asp:SqlDataSource ID="DSClasses" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
             SelectCommand="SELECT [ID_classe] FROM [Classe]"></asp:SqlDataSource>
         <asp:DropDownList ID="ListClasses" runat="server" AutoPostBack="True" 
             DataSourceID="DSClasses" DataTextField="ID_classe" 
             DataValueField="ID_classe" 
             onselectedindexchanged="ListClasses_SelectedIndexChanged">
         </asp:DropDownList>
         <asp:DropDownList ID="ListMatieres" runat="server" AutoPostBack="True" 
             DataSourceID="DSMatieres" DataTextField="Lib_mat" DataValueField="ID_mat" 
             onselectedindexchanged="ListMatieres_SelectedIndexChanged">
         </asp:DropDownList>
         <asp:SqlDataSource ID="DSAbsences" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
             SelectCommand="SELECT Absence.ID_mat,Absence.ID_eleve, Eleve.Prenom_eleve + '  ' + Eleve.Nom_eleve AS Eleve FROM Absence INNER JOIN Eleve ON Absence.ID_eleve = Eleve.ID_eleve WHERE (Eleve.ID_classe = @ID_classe)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="ListClasses" Name="ID_classe" 
                     PropertyName="SelectedValue" />
             </SelectParameters>
         </asp:SqlDataSource>
         <asp:SqlDataSource ID="DSEleves" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
             SelectCommand="SELECT [ID_eleve],[Prenom_eleve]+' '+ [Nom_eleve] as NomEleve FROM [Eleve] WHERE ([ID_classe] = @ID_classe)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="ListClasses" Name="ID_classe" 
                     PropertyName="SelectedValue" Type="String" />
             </SelectParameters>
         </asp:SqlDataSource>
         <asp:DataList ID="DLAbsences" runat="server" 
             DataSourceID="DSEleves" DataKeyField="ID_eleve">
             <HeaderTemplate>
            <table>
                <tr>
                    <th>Elève</th>
                    <th>Absence</th>
                </tr>
         </HeaderTemplate>
         <ItemTemplate>
         <tr>
         <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID_eleve") %>' Visible="false"/>
                <td>
                    <asp:Label ID="lblEleve" runat="server" Text='<%# Eval("NomEleve") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="CBAbsence" runat="server" AutoPostBack="True" />
                </td>
             </tr>  
             
         </ItemTemplate>
         <FooterTemplate>
            </table>
         </FooterTemplate>
         </asp:DataList>
         <asp:Button ID="BtnSauvegarder" runat="server" Text="Sauvegarder" 
             onclick="BtnSauvegarder_Click" />
     </div>
</center>
</asp:Content>
