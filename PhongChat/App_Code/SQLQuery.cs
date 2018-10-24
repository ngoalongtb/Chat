using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class SQLQuery
{
    private static SqlConnection _sqlConn;
    private SqlCommand _sqlCmd;

    public SQLQuery()
    {
        if (_sqlConn == null)
        {
            _sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ConnectionString);
            _sqlConn.Open();
        }
        
        _sqlCmd = new SqlCommand();
        _sqlCmd.Connection = _sqlConn;
    }

    public DataTable GetDataTable(string query)
    { 
        _sqlCmd.CommandText = query;
        SqlDataAdapter _sqlDA = new SqlDataAdapter(_sqlCmd);
        DataSet _ds = new DataSet();
        _sqlDA.Fill(_ds);
        return _ds.Tables[0];
    }

    public DataRow GetDataRow(string query)
    {
        return GetDataTable(query).Rows[0];
    }

    public void Execute(string query)
    {
        _sqlCmd.CommandText = query;
        _sqlCmd.ExecuteNonQuery();
    }

    public void Dispose()
    {
        _sqlCmd.Dispose();
        _sqlConn.Close();
        _sqlConn.Dispose();
    }
}
