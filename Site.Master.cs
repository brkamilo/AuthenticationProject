using AuthenticationProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuthenticationProject
{
    public partial class SiteMaster : MasterPage
    {
        public PageLogin PageLogin { get { return (PageLogin)Page; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            PageLogin.VerifiedLogin();
            UserApp userApp =  PageLogin.VerifiedPageAllowed();
            divTitleApp.Visible = !PageLogin.IsLoginPage;
            cssmenu.Visible = !PageLogin.IsLoginPage;
            if (userApp != null)
            {
                LabelUser.Text = userApp.UserLogin;
            }
        }

        protected void btnCloseSession_ServerClick(object sender, EventArgs e)
        {
            PageLogin.CloseSession();
        }
    }
}