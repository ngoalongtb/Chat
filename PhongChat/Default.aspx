<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ChatRoom</title>
    <link rel="Stylesheet" href="Style.css" type="text/css" />
    <script src="jquery.js" type="text/javascript" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Content">
        <div id="Header">ChatRoom - Phòng Chat Trực Tuyến</div>

        <div id="Menu">
            <ul>
                <li><a href="Default.aspx?Function=ChuDe">Các Chủ Đề</a></li>
                <li><a href="Default.aspx?Function=TaoChuDe" id="mnutaochude" runat="server" visible="false">Tạo Chủ Đề</a></li>
                <li><a href="Default.aspx?Function=Search">Tìm kiếm Chủ Đề</a></li>
                <li id="mnudangnhap" runat="server"><a href="Default.aspx?Function=DangNhap">Đăng nhập</a></li>
                <li id="mnudangky" runat="server"><a href="Default.aspx?Function=DangKy">Đăng ký</a></li>
                <li id="mnuquanlychude" runat="server" visible="false"><a href="Default.aspx?Function=QuanLyChuDe">Quản lý Chủ Đề</a></li>
                <li id="mnuthanhvien" runat="server" visible="false"><a href="Default.aspx?Function=ThanhVien">Danh sách Thành viên</a></li>
            </ul>
        </div>

        <div id="SubMenu" runat="server" class="SubMenu" visible="false">
            Xin chào: <asp:Literal ID="litName" runat="server"></asp:Literal> / <a href="Default.aspx?Function=DangXuat" onclick="return confirm('Bạn chắc chắn muốn đăng xuất?');">Đăng xuất</a> / <a href="Default.aspx?Function=ThayDoiThongTin">Thay đổi thông tin cá nhân</a>  / <a href="Default.aspx?Function=ThayDoiMatKhau">Thay đổi mật khẩu</a> 
        </div>

        <div id="Center">
            <asp:PlaceHolder ID="phCenter" runat="server"></asp:PlaceHolder>
        </div>
    </div>    
    </form>
</body>
</html>
 