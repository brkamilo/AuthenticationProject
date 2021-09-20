using AuthenticationProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuthenticationProject
{
    public partial class Login : PageLogin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IsBasePage = true;
        }

        protected void btnLogin_ServerClick(object sender, EventArgs e)
        {
            string user = txtUser.Value.Trim().ToLower();
            string pwd = txtPwd.Value;
            UserApp = Helpers.Helpers.Login(user, pwd, out string message);
            lblMessage.Text = message;
            VerifiedLogin();
        }
    }
}