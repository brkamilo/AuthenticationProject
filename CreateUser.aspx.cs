using AuthenticationData;
using AuthenticationProject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuthenticationProject
{
    public partial class CreateUser : PageLogin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = Helpers.Helpers.GetRole();
                DropDownListRole.DataSource = dt;
                DropDownListRole.DataTextField = "RoleName";
                DropDownListRole.DataValueField = "RoleId";
                DropDownListRole.Enabled = true;
                DropDownListRole.Visible = true;
                DropDownListRole.DataBind();
            }          
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
          
            string fullName = TextBoxName.Text;
            string login = TextBoxLogin.Text;
            string command = string.Format("exec [GetParameter] {0}", "ENCRYPT_KEY");
            DataTable dtResult = DataHelpers.GetDataTable(command, "Result", ConstantsData.ConnectionStringSimple);
            string key = dtResult.Rows[0]["Value"] as string;            
            string password = Helpers.EncryptData.EncryptAes(TextBoxPassword.Text, key);
            string address = TextBoxAddress.Text;
            string phone = TextBoxPhone.Text;
            string email = TextBoxEmail.Text;
            int age = Convert.ToInt32(TextBoxAge.Text);
            int roleId = Convert.ToInt32(DropDownListRole.SelectedValue);
            Helpers.Helpers.CreateUser(fullName, login, password, address, phone, email, age, roleId);
            Response.Redirect(ConstantsWeb.UserPage);

        }
    }
}