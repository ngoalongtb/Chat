using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Control_SuaChuDe : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Id = Request.QueryString["Id"];

        if (Session["MaNguoiDung"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            if (Session["Quyen"].ToString() != "1")
            {
                if (Id != null)
                {
                    ThanhVien_ChuDe tv = new ThanhVien_ChuDe();
                    tv.MaChuDe = Convert.ToInt32(Id);
                    if (tv.LayMaNguoiDung() != Convert.ToInt32(Session["MaNguoiDung"]))
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        if (!Page.IsPostBack)
        {
            ChuDe c = new ChuDe();
            c.MaChuDe = Convert.ToInt32(Id);
            txtTen.Text = c.ChiTietChuDe()["tenchude"].ToString();
        }
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        try
        {
            string Id = Request.QueryString["Id"];

            ChuDe c = new ChuDe();
            c.MaChuDe = Convert.ToInt32(Id);
            c.TenChuDe = txtTen.Text;
            c.SuaChuDe();
            Response.Redirect("Default.aspx?Function=Chat&Id=" + c.MaChuDe);
        }
        catch
        {
            litErr.Text = "Không sửa được chủ đề!";
        }
    }
}