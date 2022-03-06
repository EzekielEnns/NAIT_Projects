using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ICAs_ICA13_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void _getOD_Click(object sender, EventArgs e)
    {
        _GVP1.DataSource = null;
        _GVP1.DataBind();
    }

    protected void _Del_Click(object sender, EventArgs e)
    {
        if(_GVP1.SelectedRow != null) 
        {
            int odID = Convert.ToInt32(_GVP1.SelectedDataKey.Values["OrderID"].ToString());
            int prodID = Convert.ToInt32(_GVP1.SelectedDataKey.Values["ProductID"].ToString());
            _P1Stats.Text = NorthwindAccess.DeleteOrderDetails(odID, prodID);

            try
            {
                _GVP1.DataBind();
            }
            catch (Exception ex) 
            {
                _P1Stats.Text = ex.Message;
            }
        }
        else
        {
            _P1Stats.Text = "Nothing selcected derp";
        }
    }

    protected void _Insert_Click(object sender, EventArgs e)
    {
        int odID;
        int prodID;
        short qunat;
        try
        {
            if (
                (odID = Convert.ToInt32(_P2OD.Text)) != 0 &&
                ((prodID = Convert.ToInt32(_Prod.SelectedValue)) != 0 || _Prod.SelectedValue == "0") &&
                ((qunat = Convert.ToInt16(_Qant.Text)) != 0 || _Qant.Text == "0")
              )
                _P2Stats.Text = NorthwindAccess.InsertOrderDetauks(odID, prodID, qunat);
            else
                _P2Stats.Text = "Woops somethings wrong";

            _GVP1.DataBind();
        }
        catch (Exception ex)
        {
            _P2Stats.Text = ex.Message;
        }
    }

    protected void _Qant_TextChanged(object sender, EventArgs e)
    {

    }

    protected void _P2OD_TextChanged(object sender, EventArgs e)
    {
        _Prod.DataBind();
    }
}
