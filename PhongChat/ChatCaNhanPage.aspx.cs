using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChatCaNhanPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string p1 = Request.QueryString["p1"];
        string p2 = Request.QueryString["p2"];
        string user = Request.QueryString["user"];
        string message = Request.QueryString["message"];

        if (message.Trim() != "")
        {
            ChatCaNhan chatCaNhan = new ChatCaNhan();
            chatCaNhan.InsertData(p1, p2, message, user);
        }
    }
}