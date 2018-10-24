<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThayDoiThongTin.ascx.cs" Inherits="Control_ThayDoiThongTin" %>

<h1>&raquo; Thay đổi thông tin cá nhân</h1>
<center>
<table width="850px" runat="server" id="tblDangKy">    
    <tr><td colspan="3" style="font-weight:bold; text-align:center;"><asp:Literal runat="server" ID="litErr"></asp:Literal></td></tr>
    <tr>
        <td align="left" width="150px">Tên Đăng Nhập:</td>
        <td align="left" width="500px"><asp:TextBox ID="txtTen" runat="server" Width="450px" Enabled="false"></asp:TextBox></td>
        <td align="left" width="200px"></td>
    </tr>
    <tr><td colspan="3" height="10px"></td></tr>
    <tr>
        <td align="left">Email:</td>
        <td align="left"><asp:TextBox ID="txtEmail" runat="server" Width="450px"></asp:TextBox></td>
        <td align="left"><asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                runat="server" ErrorMessage="* Email không đúng dạng" 
                ControlToValidate="txtEmail" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>        
    </tr>
    <tr><td colspan="3" height="10px"></td></tr>
    <tr><td colspan="3" align="center"><asp:Button ID="btnConfirm" runat="server" 
            Text="Thay đổi thông tin" onclick="btnConfirm_Click" /></td></tr>
</table>
</center>