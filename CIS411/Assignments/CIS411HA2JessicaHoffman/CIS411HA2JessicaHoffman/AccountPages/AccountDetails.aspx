<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountDetails.aspx.cs" Inherits="CIS411HA2JessicaHoffman.AccountDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 176px;
        }
        .auto-style3 {
            width: 176px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
            width: 181px;
        }
        .auto-style6 {
            width: 181px;
        }
        .auto-style7 {
            width: 136px;
            height: 23px;
        }
        .auto-style8 {
            width: 136px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Account Name:</td>
                <td class="auto-style5">
                    <asp:Label ID="nameLbl" runat="server"></asp:Label>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Account Type:</td>
                <td class="auto-style5">
                    <asp:Label ID="typeLbl" runat="server"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="withdrawStatus" runat="server"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="withdrawMessage" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Account Balance:</td>
                <td class="auto-style6">
                    <asp:Label ID="balanceLbl" runat="server"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="withdrawTxt" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="withdrawBtn" runat="server" OnClick="withdrawBtn_Click" Text="Withdraw Money" Width="165px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Eligible for Loan:</td>
                <td class="auto-style6">
                    <asp:Label ID="loanLbl" runat="server"></asp:Label>
                </td>
                <td class="auto-style8">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="loanBtn" runat="server" Text="Want a Loan?" Width="165px" PostBackUrl="~/AccountPages/LoanApplicationPage.aspx"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Address Provided:</td>
                <td class="auto-style6">
                    <asp:Label ID="addressLbl" runat="server"></asp:Label>
                </td>
                <td class="auto-style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
