using AuthenticationProject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuthenticationProject
{
    public partial class Users : PageLogin
    {
        public PageLogin PageLogin { get { return (PageLogin)Page; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            UserApp userApp = PageLogin.VerifiedPageAllowed();
            if (userApp != null )
            {
                if (!UserApp.Pages.Exists(x => ComparePagePath(x.Path, "EditUser")) && !UserApp.Pages.Exists(x => ComparePagePath(x.Path, "CancelUser")))
                {                  
                    GridViewUser.Columns[0].Visible = false;
                }
                else
                {
                    GridViewUser.Columns[0].Visible = true;
                }
            }
        }
        private void LoadUser()
        {
            string name = string.IsNullOrEmpty(TextBoxName.Text) ? "-" : TextBoxName.Text;
            string role = string.IsNullOrEmpty(TextBoxRole.Text) ? "-" : TextBoxRole.Text;
            DataTable dt = Helpers.Helpers.GetUser(name, role);
            GridViewUser.DataSource = dt;
            GridViewUser.Columns[9].Visible = false;
            GridViewUser.DataBind();
        }

        protected void Button_User_Click(object sender, EventArgs e)
        {
            LoadUser();          
        }

        protected void GridViewUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            int userId = Convert.ToInt32(e.NewValues[0].ToString());
            string fullName = e.NewValues[1].ToString();
            string login = e.NewValues[2].ToString();
            string address = e.NewValues[3].ToString();
            string phone = e.NewValues[4].ToString();
            string email = e.NewValues[5].ToString();
            int age = Convert.ToInt32(e.NewValues[6].ToString());
            int roleId = Convert.ToInt32(DropDownListRole.SelectedValue);
            Helpers.Helpers.UpdateUser(fullName, login, address, phone, email, age, roleId, userId);
            GridViewUser.EditIndex = -1;
            LoadUser();
            DropDownListRole.Visible = false;
        }

        protected void GridViewUser_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewUser.EditIndex = e.NewEditIndex;
            LoadUser();

            DataTable dt = Helpers.Helpers.GetRole();
            DropDownListRole.DataSource = dt;
            DropDownListRole.DataTextField = "RoleName";
            DropDownListRole.DataValueField = "RoleId";
            DropDownListRole.Enabled = true;
            DropDownListRole.Visible = true;
            DropDownListRole.DataBind();
        }
             

        protected void GridViewUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridViewUser.EditIndex = -1;
            DropDownListRole.Visible = false;
            LoadUser();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(ConstantsWeb.CreateUserPage);
        }

        protected void GridViewUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            UserApp userApp = PageLogin.VerifiedPageAllowed();
            if (userApp != null)
            {
                if (!UserApp.Pages.Exists(x => ComparePagePath(x.Path, "CancelUser")))
                {
                    GridViewUser.Columns[0].Visible = false;                    
                }
                else
                {
                    Helpers.Helpers.CancelUser(Convert.ToInt32(e.Keys["UserId"]));

                }
            }
            LoadUser();

        }
    }
}