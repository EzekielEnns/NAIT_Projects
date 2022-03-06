using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ICAs_ICA12_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) 
        {
            FillDropList();
        }
    }

    protected void FillDropList(string filter = "")
    {
        _Customer.AppendDataBoundItems = true;
        _Customer.DataSource = NorthwindAccess.FillCustomersDDL(filter);
        _Customer.DataTextField = "CompanyName";
        _Customer.DataValueField = "CustomerID";
        _Customer.Items.Clear();
        _Customer.DataBind();
        _Customer.Items.Insert(0, new ListItem("Now Pick a Customer from " +
            _Customer.Items.Count.ToString()));
    }


    protected void btnFilter_Click(object sender, EventArgs e)
    {
        FillDropList(_Filter.Text);
        _summary.DataSource = null;
        _summary.DataBind();
        
    }




    protected void _Customer_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (_Customer.SelectedIndex == 0)
            return;
        _summary.DataSource = NorthwindAccess.CustomerCategorySummary(_Customer.SelectedValue);
        _summary.DataBind();
    }
}