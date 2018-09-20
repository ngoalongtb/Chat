<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListUserChat.aspx.cs" Inherits="ListUserChat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="rptList" runat="server">
            <ItemTemplate>
                <b><%# Eval("TaiKhoanNguoiDung") %></b> <br />
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>
