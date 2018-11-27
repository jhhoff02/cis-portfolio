<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanApplicationPage.aspx.cs" Inherits="CIS411HA2JessicaHoffman.AccountPages.LoanApplicationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 238px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Name</td>
                <td>
                    <asp:Label ID="nameLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Salary</td>
                <td>
                    <asp:TextBox ID="salaryTxt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Age</td>
                <td>
                    <asp:TextBox ID="ageTxt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Loan Amount</td>
                <td>
                    <asp:TextBox ID="amountTxt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="submitBtn" runat="server" OnClick="submitBtn_Click" Text="Submit" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="approvalLbl" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="acctSummBtn" runat="server" PostBackUrl="~/AccountSummary.aspx" Text="Go to Account Summary" />
                </td>
                <td>
                    <asp:Button ID="acctDetailsBtn" runat="server" PostBackUrl="~/AccountPages/AccountDetails.aspx" Text="Go to Account Details" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>