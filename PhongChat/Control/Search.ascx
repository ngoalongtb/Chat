<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="Control_Search" %>

<h1>&raquo; Tìm kiếm Chủ Đề</h1>

<table width="1000px" align="left">
    <tr><td colspan="3" align="center">Tên chủ đề: <asp:TextBox ID="txtten" runat="server" Width="500px"></asp:TextBox> 
        <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" 
            onclick="btnSearch_Click" /></td></tr>
    <tr><td colspan="3" height="5px"></td></tr>
    <tr style="font-weight:bold;">
        <td width="500px">Chủ Đề</td>
        <td width="250px">Ngày tạo</td>
        <td width="250px">Người tạo</td>
    </tr>
    <asp:Repeater ID="rptData" runat="server">
    <ItemTemplate>    
    <tr><td colspan="3" height="5px"></td></tr>
    <tr>
        <td><a href="Default.aspx?Function=Chat&Id=<%# Eval("MaChuDe")%>"><%# Eval("TenChuDe")%></a></td>
        <td><%# Eval("Ngay") %></td>
        <td><%# Eval("TaiKhoanNguoiDung")%></td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
</table>
<center><asp:Literal ID="literr" runat="server"></asp:Literal></center>
