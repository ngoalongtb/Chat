using System;

public class MyFunction
{ 
    public static string KillSqlInjection(string str)
    {
        str = str.Replace("'", "");
        str = str.Replace("--", "");
        str = str.Replace(";", "");
        str = str.Replace("delete", "");
        str = str.Replace("drop", "");
        str = str.Replace("update", "");
        str = str.Replace("xp_", "");
        str = str.Replace("insert", "");

        return str;
    }

    public static string NgayVietNam(DateTime d)
    {
        return (d.Day + "/" + d.Month + "/" + d.Year);
    }

    public static string NgayQuocTe(string s)
    {
        string[] str = s.Split('/');

        return (str[1] + "/" + str[0] + "/" + str[2]);
    }
}