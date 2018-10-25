using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for ChatModel
/// </summary>
public class ChatModel
{
    public ChatModel() { }
    public ChatModel(int maNguoiDung1, int maNguoiDung2, string tenNguoiDung)
    {
        if(maNguoiDung1 > maNguoiDung2)
        {
            this.MaNguoiDung1 = maNguoiDung1;
            this.MaNguoiDung2 = maNguoiDung2;
        } else
        {
            this.MaNguoiDung2 = maNguoiDung1;
            this.MaNguoiDung1 = maNguoiDung2;
        }
    
        this.tenNguoiDung = tenNguoiDung;

    }
    private int maNguoiDung1;
    private int maNguoiDung2;
    private string tenNguoiDung;
    private string noiDung;

    public int MaNguoiDung1
    {
        get
        {
            return maNguoiDung1;
        }

        set
        {
            maNguoiDung1 = value;
        }
    }

    public int MaNguoiDung2
    {
        get
        {
            return maNguoiDung2;
        }

        set
        {
            maNguoiDung2 = value;
        }
    }

    public string TenNguoiDung
    {
        get
        {
            return tenNguoiDung;
        }

        set
        {
            tenNguoiDung = value;
        }
    }

    public string NoiDung
    {
        get
        {
            return noiDung;
        }

        set
        {
            noiDung = value;
        }
    }
}
