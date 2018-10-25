using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_ChatCaNhan : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int maNguoiDung1 = Convert.ToInt32(Request.QueryString["p1"]);
        int maNguoiDung2 = Convert.ToInt32(Request.QueryString["p2"]);

        if (!Page.IsPostBack)
        {
            try
            {
                user.Text = Session["MaNguoiDung"].ToString();
                p1.Text = maNguoiDung1.ToString();
                p2.Text = maNguoiDung2.ToString();

                NguoiDung nd = new NguoiDung();

                DataRow r = nd.ChiTietNguoiDung(maNguoiDung1);
                lblTenNguoiChat1.Text = (string)r["TaiKhoanNguoiDung"];

                r = nd.ChiTietNguoiDung(maNguoiDung2);
                lblTenNguoiChat2.Text = (string)r["TaiKhoanNguoiDung"];
            }
            catch (Exception)
            {
            }
                
        }
    }
}