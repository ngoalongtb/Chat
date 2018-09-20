using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_DangNhap : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        try
        {
            NguoiDung tv = new NguoiDung();
            tv.TaiKhoanNguoiDung = txtTen.Text;
            tv.MatKhau = txtMK.Text;
            if (tv.KiemTraDangNhap() == false)
            {
                litErr.Text = "Tài khoản hoặc mật khẩu không chính xác!";
            }
            else
            {
                Session["MaNguoiDung"] = tv.MaNguoiDung;
                Session["TaiKhoanNguoiDung"] = tv.TaiKhoanNguoiDung;
                Session["Quyen"] = tv.Quyen;
                Response.Redirect("Default.aspx");
            }
        }
        catch
        {
            litErr.Text = "Có lỗi trong quá trình đăng nhập!";
        }
    }
}