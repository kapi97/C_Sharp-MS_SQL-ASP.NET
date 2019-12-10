<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyPage.aspx.cs" Inherits="MyWeb3.MyPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
    <asp:TextBox ID="m_search" runat="server"></asp:TextBox>
    <asp:Button ID="m_refresh" runat="server" Text="Refresh" OnClick="m_refresh_Click" />
 
  <asp:Repeater ID="m_rptEmployees" runat="server">
        <HeaderTemplate>
                                        <table cellpadding="4" cellspacing="0" border="0"  width="60%">
                                                <tr style="background-color:#CCFFCC">
                                                        <th align="left">First Name</th>
                                                        
                                                        <th align="left">Last Name</th>
 
                            <th align="left">Address</th>
 
                            <th align="left">City</th>
                                                </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                        <tr valign="top">
                                                <td ><%# DataBinder.Eval(Container.DataItem, "FirstName")%></td>
                                                <td ><a href="editEmployee.aspx?id=<%# DataBinder.Eval(Container.DataItem, "EmployeeId")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "LastName")%>"> <%# DataBinder.Eval(Container.DataItem, "LastName")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Address")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "City")%></td>
                                        
                                        </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                    <tr valign="top"  style="background-color:#CCFFCC"> 
                    <td  ><%# DataBinder.Eval(Container.DataItem, "FirstName")%></td>
                                                <td ><a href="editEmployee.aspx?id=<%# DataBinder.Eval(Container.DataItem, "EmployeeId")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "LastName")%>"> <%# DataBinder.Eval(Container.DataItem, "LastName")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Address")%></td>
                         <td ><%# DataBinder.Eval(Container.DataItem, "City")%></td>
                                        
                                        </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                        </table>
                                </FooterTemplate>
    </asp:Repeater>
</asp:Content>