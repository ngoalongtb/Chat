using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_DangKy : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        tblSuccess.Visible = false;
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {

       //int
        try
        {
            NguoiDung tv = new NguoiDung();
            tv.TaiKhoanNguoiDung = txtTen.Text;
            tv.MatKhau = txtMK.Text;
            tv.Quyen = 0;
            tv.Email = txtEmail.Text;
            Session["MaNguoiDung"] = tv.ThemNguoiDung();
            Session["TaiKhoanNguoiDung"] = txtTen.Text;
            Session["Quyen"] = 0;
            tblDangKy.Visible = false;
            tblSuccess.Visible = true;                        
        }
        catch
        {
            litErr.Text = "Có lỗi trong quá trình đăng ký!";
        }
    }
}