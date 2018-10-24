using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string chude = Request.QueryString["chude"];
        string noidung = Request.QueryString["noidung"];
        string mand = Request.QueryString["mand"];

        if (noidung.Trim() != "")
        {
            ThanhVien_ChuDe tv = new ThanhVien_ChuDe();
            tv.MaChuDe = Convert.ToInt32(chude);
            tv.MaNguoiDung = Convert.ToInt32(mand);
            tv.NoiDungChat = noidung;
            tv.TaoChuDe = 0;
            tv.Them();
        }
    }
}