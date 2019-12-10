<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Filmy.aspx.cs" Inherits="MyWeb3.Filmy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
    <asp:TextBox ID="m_search" runat="server"></asp:TextBox>
    <asp:Button ID="m_refresh" runat="server" Text="Refresh" OnClick="m_refresh_Click" />
 
  <asp:Repeater ID="m_rptFilmy" runat="server">
        <HeaderTemplate>
                                        <table cellpadding="4" cellspacing="0" border="0"  width="60%">
                                                <tr style="background-color:#CCFFCC">
                                                        <th align="left">Tytuł</th>
                                                        
                                                        <th align="left">Gatunek</th>
 
                            <th align="left">Rok</th>
 
                            <th align="left">Cena kupna</th>
                            <th align="left">Cena wypożyczenia</th>
                                                </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                        <tr valign="top">
                                                <td ><%# DataBinder.Eval(Container.DataItem, "tytul")%></td>
                                                <td ><a href="editFilmy.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id_film")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "gatunek")%>"> <%# DataBinder.Eval(Container.DataItem, "gatunek")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "rok")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "cena_kupna")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "cena_wypozyczenia")%></td>
                                        
                                        </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                    <tr valign="top"  style="background-color:#CCFFCC"> 
                    <td  ><%# DataBinder.Eval(Container.DataItem, "tytul")%></td>
                                                <td ><a href="editFilmy.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id_film")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "gatunek")%>"> <%# DataBinder.Eval(Container.DataItem, "gatunek")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "rok")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "cena_kupna")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "cena_wypozyczenia")%></td>
                                        
                                        </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                        </table>
                                </FooterTemplate>
    </asp:Repeater>
</asp:Content>