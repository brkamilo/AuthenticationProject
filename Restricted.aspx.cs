using AuthenticationProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuthenticationProject
{
    public partial class Restricted : PageLogin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IsBasePage = true;
        }
    }
}