using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for NorthwindAccess
/// this will be act as a layer between our ui and business
/// </summary>
public class NorthwindAccess
{
    public NorthwindAccess()
    {
        
    }
    public static SqlDataSource GetSuppliersSDS(string filter="")
    {
        string query = "SELECT * From [Suppliers]"+
            (filter !=""? "WHERE [CompanyName] LIKE '%"+filter+"%'":"");

        SqlDataSource sds = new SqlDataSource(
            ConfigurationManager.ConnectionStrings["eenns1_NorthwindConnectionString"].ConnectionString,
            query);
        return sds;
    }

    public static List<List<string>> GetProducts(string sID) 
    {
        //this copy past type of work is soul crushing
        List<List<string>> req = new List<List<string>>();
        if (sID == "") return req;

        string q = "SELECT ProductName, QuantityPerUnit, UnitsInStock FROM Products WHERE SupplierID="+sID;

        using (SqlConnection conn = new 
            SqlConnection(ConfigurationManager.ConnectionStrings["eenns1_NorthwindConnectionString"].ConnectionString))
        {
            using (SqlCommand comman = new SqlCommand(q,conn))
            {
                conn.Open();

                SqlDataReader r = comman.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                if (!r.HasRows)
                    return req;
                int c = r.FieldCount;
                List<string> sColumnNam = new List<string>( new string[] {r.GetName(0), r.GetName(1), r.GetName(2) });

                //itterate through all rows
                while (r.Read()) 
                {
                    List<string> ro = new List<string>();
                    ro.Add(r["ProductName"] as string);
                    ro.Add(r["QuantityPerUnit"] as string);
                    ro.Add(r["UnitsInStock"] as string);
                    req.Add(ro);
                }
                req.Insert(0, sColumnNam);

            }
        }
        return req;

    }
    
    public static SqlDataReader FillCustomersDDL(string filter) 
    {
        SqlDataReader r = null;
        SqlConnection conn = 
            new SqlConnection(ConfigurationManager.ConnectionStrings["eenns1_NorthwindConnectionString"].ConnectionString);
        conn.Open();
        using (SqlCommand command = new SqlCommand()) 
        {
            command.Connection = conn;
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "GetCustomers";

            SqlParameter pfilt = new SqlParameter("@filter", System.Data.SqlDbType.VarChar, 25);
            pfilt.Value = filter;
            pfilt.Direction = System.Data.ParameterDirection.Input;
            command.Parameters.Add(pfilt);

            r = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }
        return r;
    }

    public static SqlDataReader CustomerCategorySummary(string filter)
    {
        SqlDataReader r = null;
        SqlConnection conn =
            new SqlConnection(ConfigurationManager.ConnectionStrings["eenns1_NorthwindConnectionString"].ConnectionString);
        conn.Open();
        using (SqlCommand command = new SqlCommand())
        {
            command.Connection = conn;
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "CustCatSummary";

            SqlParameter pfilt = new SqlParameter("@custID", System.Data.SqlDbType.VarChar, 5);
            pfilt.Value = filter;
            pfilt.Direction = System.Data.ParameterDirection.Input;
            command.Parameters.Add(pfilt);

            r = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }
        return r;
    }

    public static string DeleteOrderDetails(int Oid, int Pid) 
    {
        SqlConnection conn =
            new SqlConnection(ConfigurationManager.ConnectionStrings["eenns1_NorthwindConnectionString"].ConnectionString);
        conn.Open();
        using (SqlCommand command = new SqlCommand()) 
        {
            command.Connection = conn;
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "DeleteOrderDetails";
            /*
              0 @OrderID as int,
              1 @ProdID as int,
              2 @out as varchar(80) OUTPUT
             */
            SqlParameter[] parms = new SqlParameter[]{
                new SqlParameter("@OrderID", System.Data.SqlDbType.Int)
                    { Value=Oid, Direction = System.Data.ParameterDirection.Input },
                new SqlParameter("@ProdID", System.Data.SqlDbType.Int)
                    { Value = Pid, Direction = System.Data.ParameterDirection.Input },
                new SqlParameter("@out", System.Data.SqlDbType.VarChar, 80)
                    { Direction = System.Data.ParameterDirection.Output }
            };
            command.Parameters.AddRange(parms);
            command.ExecuteNonQuery();
            return (string)parms[2].Value;
        }
    }

    public static string InsertOrderDetauks(int orderID, int prodID, short quant) 
    {
        SqlConnection conn =
    new SqlConnection(ConfigurationManager.ConnectionStrings["eenns1_NorthwindConnectionString"].ConnectionString);
        conn.Open();
        using (SqlCommand command = new SqlCommand())
        {
            command.Connection = conn;
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "InsertOrderDetails";
            SqlParameter[] parms = new SqlParameter[]{
                new SqlParameter("@OrderID", System.Data.SqlDbType.Int)
                    { Value=orderID, Direction = System.Data.ParameterDirection.Input },
                new SqlParameter("@ProdID", System.Data.SqlDbType.Int)
                    { Value = prodID, Direction = System.Data.ParameterDirection.Input },
                new SqlParameter("@Quantity", System.Data.SqlDbType.Int)
                    { Value = quant, Direction = System.Data.ParameterDirection.Input },
                new SqlParameter("@anything", System.Data.SqlDbType.Int)
                    { Direction = System.Data.ParameterDirection.ReturnValue }
            };
            command.Parameters.AddRange(parms);
            command.ExecuteNonQuery();
            return "added "+parms[3].Value+" rows";
        }
    }

}