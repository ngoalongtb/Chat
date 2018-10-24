<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuanLyChuDe.ascx.cs" Inherits="Control_QuanLyChuDe" %>

<h1>&raquo; Quản lý Chủ Đề</h1>

<table width="1000px" align="left">
    <tr><td colspan="5" align="center">Tên chủ đề: <asp:TextBox ID="txtten" runat="server" Width="500px"></asp:TextBox> 
        <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" 
            onclick="btnSearch_Click" /></td></tr>
    <tr><td colspan="5" height="5px"></td></tr>
    <tr style="font-weight:bold;">
        <td width="550px">Chủ Đề</td>
        <td width="150px">Ngày tạo</td>
        <td width="100px">Người tạo</td>
        <td width="100px">Sửa</td>
        <td width="100px">Xóa</td>
    </tr>
    <asp:Repeater ID="rptData" runat="server">
    <ItemTemplate>    
    <tr><td colspan="3" height="5px"></td></tr>
    <tr>
        <td><a href="Default.aspx?Function=Chat&Id=<%# Eval("MaChuDe")%>"><%# Eval("TenChuDe")%></a></td>
        <td><%# Eval("Ngay") %></td>
        <td><%# Eval("TaiKhoanNguoiDung")%></td>
        <td><a href="Default.aspx?Function=SuaChuDe&Id=<%# Eval("MaChuDe") %>">Sửa</a> </td>
        <td><a href="Default.aspx?Function=XoaChuDe&Id=<%# Eval("MaChuDe") %>" onclick="return confirm('Xóa chủ đề này?');">Xóa</a></td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
</table>