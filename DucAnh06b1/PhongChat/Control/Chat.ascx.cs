using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Control_Chat : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string machude = Request.QueryString["Id"];

        if (!Page.IsPostBack)
        {
            try
            {
                ChuDe c = new ChuDe();
                c.MaChuDe = Convert.ToInt32(machude);
                DataRow dr = c.ChiTietChuDe();
                litChuDe.Text = dr["tenchude"].ToString();
                txtmacd.Text = machude;

                if (Session["MaNguoiDung"] == null)
                {
                    txtChat.Enabled = false;
                }
                else
                {
                    ThanhVien_ChuDe tv = new ThanhVien_ChuDe();
                    tv.MaChuDe = Convert.ToInt32(machude);
                    if (tv.LayMaNguoiDung() == Convert.ToInt32(Session["MaNguoiDung"]) || Session["Quyen"].ToString() == "1")
                    {
                        litEdit.Text = "(<a href='Default.aspx?Function=SuaChuDe&Id="+machude+"'>Sửa chủ đề</a>)";
                    }                    
                    txtmand.Text = Session["MaNguoiDung"].ToString();


                    if (txtChat.Text == null)
                    {
                        enter.Text = "hay nhap noi dung chat";
                    }
                }
            }
            catch { }
        }
    }
}