using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ICAs_ICA9_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //sanity check
        if (e == null || e.Row == null || e.Row.DataItem == null) return;

        DataRowView drv = e.Row.DataItem as DataRowView;
        int uis = int.Parse(drv["UnitsInStock"].ToString());
        int uoo = int.Parse(drv["UnitsOnOrder"].ToString());
        double p = double.Parse(drv["UnitPrice"].ToString());

        if (uis < 25)
            e.Row.BackColor = Color.LightSalmon;
        if (p > 25) e.Row.Cells[2].BackColor = Color.Yellow;
        if (uoo < 5 && uis < 20)
        {
            e.Row.BackColor = Color.Cyan;
            e.Row.Cells[3].BackColor = Color.GreenYellow;
        }
    }

    protected void BtnShowProd_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }

    //<!-- data.net.nait.ca,24680-->
    protected void BtnEditE_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
}