<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountSummary.aspx.cs" Inherits="CIS411HA2JessicaHoffman.AccountSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 354px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="custLbl" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">All Accounts</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:ListBox ID="accountListBox" runat="server" Height="79px" Width="170px"></asp:ListBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="detailsBtn" runat="server" Text="Show Details" OnClick="detailsBtn_Click" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="requiredValidator" runat="server" ControlToValidate="accountListBox" ErrorMessage="Please Select an Account" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
