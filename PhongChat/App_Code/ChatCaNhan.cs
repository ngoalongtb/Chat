using System;
using System.Collections.Generic;
using System.Data;
using System.Web;

/// <summary>
/// Summary description for ChatCaNhan
/// </summary>
public class ChatCaNhan
{
    public int maNguoiDung1;
    public int maNguoiDung2;

    private SQLQuery sql;
    public ChatCaNhan()
    {
        sql = new SQLQuery();

    }
    public ChatCaNhan(int maNguoiDung1, int maNguoiDung2)
    {
        sql = new SQLQuery();
        this.maNguoiDung1 = maNguoiDung1;
        this.maNguoiDung2 = maNguoiDung2;
        
    }
    public DataTable GetData()
    {
        string query = string.Format("select TaiKhoanNguoiDung, NoiDungChat " +
            "from tblChatCaNhan cnn join tblNguoiDung as nd on cnn.NguoiChat = nd.MaNguoiDung" +
            " where MaNguoiDung1 = {0} and MaNguoiDung2 = {1} order by cnn.NgayTao desc", maNguoiDung1, maNguoiDung2);
        DataTable dtbl = sql.GetDataTable(query);
        
        return dtbl;
    }

    public bool InsertData(string maNguoiDung1, string maNguoiDung2, string noiDung, string nguoiChat)
    {
        try
        {
            string query = string.Format("insert into tblChatCaNhan(MaNguoiDung1, MaNguoiDung2, NoiDungChat, NgayTao, NguoiChat) values({0}, {1}, N'{2}', GETDATE(), '{3}')", maNguoiDung1, maNguoiDung2, noiDung, nguoiChat);
            sql.Execute(query);
            return true;
        }
        catch (Exception)
        {
            return false;
        }
        
        
    }
}