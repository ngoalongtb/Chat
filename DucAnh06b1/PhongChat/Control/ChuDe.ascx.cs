using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_ChuDe : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ChuDe c = new ChuDe();
            rptData.DataSource = c.DanhSachChuDe();
            rptData.DataBind();
        }
    }
}