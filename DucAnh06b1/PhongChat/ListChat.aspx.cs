using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListChat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["Id"];
        ThanhVien_ChuDe tv = new ThanhVien_ChuDe();
        tv.MaChuDe = Convert.ToInt32(id);

        rptList.DataSource = tv.DanhSach();
        rptList.DataBind();
    }
}