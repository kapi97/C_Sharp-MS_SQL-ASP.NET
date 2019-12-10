<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="MyWeb3.EditEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script language="javascript" type="text/javascript">
        function ViewPage(parametr1) {
            //alert(paramert1);
            window.open(parametr1, 'tytul',
                'height=600,width=530,status=no,toolbar=no,menubar=no,location=no,scrollbar=yes,resirable=yes');
            return false;
        }
    </script>
    <div>
    <asp:Label ID="m_id" runat="server" Text="Label"></asp:Label><br />
    <asp:TextBox ID="m_first" runat="server"></asp:TextBox><br />
    <asp:TextBox ID="m_name" runat="server"></asp:TextBox><br />
    <asp:TextBox ID="m_address" runat="server"></asp:TextBox><br />
    <asp:TextBox ID="m_city" runat="server"></asp:TextBox><br />
    <asp:Button ID="m_update" runat="server" Text="Aktualizuj" onClick="m_update_Click" />
    <asp:Button ID="m_cancel" runat="server" Text="Anuluj" onClick="m_cancel_Click" />
    <asp:Button ID="m_delete" runat="server" Text="Usun" onClick="m_delete_Click" />
    <asp:Button ID="m_open" runat="server" Text="Okno" onClick="m_open_Click"/>

</div>

</asp:Content>
