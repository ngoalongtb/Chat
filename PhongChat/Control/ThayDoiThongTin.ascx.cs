using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Control_ThayDoiThongTin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MaNguoiDung"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        if (!Page.IsPostBack)
        {
            NguoiDung tv = new NguoiDung();
            tv.MaNguoiDung = Convert.ToInt32(Session["MaNguoiDung"]);
            DataRow dr = tv.ChiTietNguoiDung();
            txtEmail.Text = dr["Email"].ToString();
            txtTen.Text = dr["TaiKhoanNguoiDung"].ToString();
        }
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        try
        {
            NguoiDung tv = new NguoiDung();
            tv.MaNguoiDung = Convert.ToInt32(Session["MaNguoiDung"]);
            tv.Email = txtEmail.Text;
            tv.Quyen = Convert.ToInt32(Session["Quyen"]);
            tv.SuaThongTin();
            litErr.Text = "Thay đổi thông tin thành công!";
        }
        catch
        {
            litErr.Text = "Thay đổi thông tin không thành công!";
        }
    }
}