using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ICAs_ICA11_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) 
        {
            FillDropList();
        }
    }

    protected void FillDropList(string filter="") 
    {
        _Suppler.AppendDataBoundItems = true;
        _Suppler.DataSource = NorthwindAccess.GetSuppliersSDS(filter);
        _Suppler.DataTextField = "CompanyName";
        _Suppler.DataValueField = "SupplierID";
        _Suppler.Items.Clear();
        _Suppler.DataBind();
        _Suppler.Items.Insert(0, new ListItem("Now Pick a Company from "+
            _Suppler.Items.Count.ToString()));
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        FillDropList(_Filter.Text);
    }

    //TODO add feedback for empty stuff
    protected void _Suppler_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (_Suppler.SelectedIndex == 0)
            return;
        List<List<string>> str = NorthwindAccess.GetProducts(_Suppler.SelectedValue);
        foreach (var item in str)
        {
            
            TableRow row = new TableRow();
            foreach (var jtem in item)
            {
                row.Cells.Add(new TableCell { Text = jtem });
            }
            _TblData.Rows.Add(row);
        }
        _TblData.Rows[0].TableSection = TableRowSection.TableHeader;
    }
}