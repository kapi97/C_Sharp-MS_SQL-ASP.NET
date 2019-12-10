<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Klienci.aspx.cs" Inherits="MyWeb3.Klienci" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
    <asp:TextBox ID="m_search" runat="server"></asp:TextBox>
    <asp:Button ID="m_refresh" runat="server" Text="Refresh" OnClick="m_refresh_Click" />
 
  <asp:Repeater ID="m_rptKlienci" runat="server">
        <HeaderTemplate>
                                        <table cellpadding="4" cellspacing="0" border="0"  width="60%">
                                                <tr style="background-color:#CCFFCC">
                                                        <th align="left">Imię</th>
                                                        
                                                        <th align="left">Nazwisko</th>
 
                            <th align="left">Adres</th>
 
                            <th align="left">Miasto</th>
                            <th align="left">E-mail</th>
                            <th align="left">Telefon</th>
                                                </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                        <tr valign="top">
                                                <td ><%# DataBinder.Eval(Container.DataItem, "imie")%></td>
                                                <td ><a href="editKlienci.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id_klient")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "nazwisko")%>"> <%# DataBinder.Eval(Container.DataItem, "nazwisko")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "adres")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "miasto")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "email")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "telefon")%></td>
                                        
                                        </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                    <tr valign="top"  style="background-color:#CCFFCC"> 
                    <td  ><%# DataBinder.Eval(Container.DataItem, "imie")%></td>
                                                <td ><a href="editKlienci.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id_klient")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "nazwisko")%>"> <%# DataBinder.Eval(Container.DataItem, "nazwisko")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "adres")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "miasto")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "email")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "telefon")%></td>
                                        
                                        </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                        </table>
                                </FooterTemplate>
    </asp:Repeater>
</asp:Content>