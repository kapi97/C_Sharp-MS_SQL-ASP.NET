<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Zamowienia.aspx.cs" Inherits="MyWeb3.Zamowienia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
    <asp:TextBox ID="m_search" runat="server"></asp:TextBox>
    <asp:Button ID="m_refresh" runat="server" Text="Refresh" OnClick="m_refresh_Click" />
 
  <asp:Repeater ID="m_rptEmployees" runat="server">
        <HeaderTemplate>
                                        <table cellpadding="4" cellspacing="0" border="0"  width="60%">
                                                <tr style="background-color:#CCFFCC">
                                                        <th align="left">Zamowienie</th>
                                                        
                                                        <th align="left">Film</th>
 
                            <th align="left">Klient</th>
 
                            
                                                </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                        <tr valign="top">
                                                
                        <td ><%# DataBinder.Eval(Container.DataItem, "id_zamowienie")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "zamowiony_film")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "id_klient")%></td>
                                        
                                        </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                    <tr valign="top"  style="background-color:#CCFFCC"> 
                    
                        <td ><%# DataBinder.Eval(Container.DataItem, "id_zamowienie")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "zamowiony_film")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "id_klient")%></td>
                                        
                                        </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                        </table>
                                </FooterTemplate>
    </asp:Repeater>
</asp:Content>