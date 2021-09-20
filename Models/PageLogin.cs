using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace AuthenticationProject.Models
{
    public class PageLogin : Page
    {
        public bool IsBasePage { get; set; }
        public bool IsLoginPage
        {
            get { return ConstantsWeb.LoginPage.Contains(Path.GetFileName(Request.PhysicalPath)); }
        }
        public UserApp UserApp
        {
            get { return Session[ConstantsWeb.Key_User] as UserApp; }
            set { Session[ConstantsWeb.Key_User] = value; }
        }
        public bool IsAuthenticated
        {
            get { return UserApp != null; }
        }

        public void VerifiedLogin()
        {

            if (!IsLoginPage && !IsAuthenticated)
            {
                Response.Redirect(ConstantsWeb.LoginPage);
            }
            if (IsLoginPage && IsAuthenticated)
            {
                Response.Redirect(ConstantsWeb.DefaultPage);
            }

        }

        public UserApp VerifiedPageAllowed()
        {
            if (!IsBasePage)
            {
                string pagePath = Request.Url.GetComponents(UriComponents.Path, UriFormat.SafeUnescaped);
                bool pageOk = UserApp.Pages.Exists(x => ComparePagePath(x.Path, pagePath));
                if (!pageOk)
                {
                    Response.Redirect(ConstantsWeb.RestrictedPage);
                }
            }
            return UserApp;
        }

        public bool ComparePagePath(string path1, string path2)
        {
            char[] trimChars = new char[] { '\\', '/' };
            bool equal = path1.Trim(trimChars).ToLower() == path2.Trim(trimChars).ToLower() || path1.StartsWith(path2);
            return equal;
        }

        public void CloseSession()
        {
            this.UserApp = null;
            this.VerifiedLogin();
        }

    }
}