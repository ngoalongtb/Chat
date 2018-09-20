using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_TaoChuDe : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MaNguoiDung"] == null)
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        try
        {
            ChuDe c = new ChuDe();
            c.TenChuDe = txtTen.Text;

            ThanhVien_ChuDe tvcd = new ThanhVien_ChuDe();
            tvcd.MaChuDe = c.ThemChuDe();
            tvcd.TaoChuDe = 1;
            tvcd.MaNguoiDung = Convert.ToInt32(Session["MaNguoiDung"]);
            tvcd.NoiDungChat = txtNoiDung.Text;
            tvcd.Them();

            Response.Redirect("Default.aspx?Function=Chat&Id="+tvcd.MaChuDe);
        }
        catch
        {
            litErr.Text = "Không tạo được chủ đề!";
        }
    }
}