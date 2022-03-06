//1201_2500_A10
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) 
        {
            DirectoryInfo dir = new DirectoryInfo(MapPath("~/ICAs"));
            foreach (DirectoryInfo item in dir.GetDirectories())
            {
                string path = "/ICAs/" + item.Name + "/index.aspx";
                if (File.Exists(MapPath(path)))
                {
                    var link = new LinkButton();
                    link.Text = item.Name;
                    link.PostBackUrl = "/ICAs/" + item.Name + "/index.aspx";
                    var li = new HtmlGenericControl("li");
                    li.Controls.Add(link);
                    _Sites.Controls.Add(li);
                }
            }
        }
    }
}