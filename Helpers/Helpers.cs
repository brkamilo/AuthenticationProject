using AuthenticationProject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using AuthenticationData;
using System.DirectoryServices.AccountManagement;

namespace AuthenticationProject.Helpers
{
    public static class Helpers
    {
        public static UserApp AuthenticateUserApp(string userLogin, string password, out string message)
        {
            UserApp userApp = null;
            string command = string.Format("exec [GetParameter] {0}", "ENCRYPT_KEY");
            DataTable dtResult = DataHelpers.GetDataTable(command, "Result", ConstantsData.ConnectionStringSimple);
            string key = dtResult.Rows[0]["Value"] as string;         
            string passwordEncrypted = EncryptData.EncryptAes(password, key);
            command = string.Format("exec [AuthenticateUser] {0}, '{1}'", userLogin, passwordEncrypted);
            dtResult = DataHelpers.GetDataTable(command, "Result", ConstantsData.ConnectionStringSimple);
            bool userOk = (bool)dtResult.Rows[0]["Success"];
            message = dtResult.Rows[0]["Message"] as string;
            if (userOk)
            {
                userApp = new UserApp()
                {
                    UserId = (int)dtResult.Rows[0]["UserId"],                
                    UserLogin = (string)dtResult.Rows[0]["UserLogin"],
                    FullName = (string)dtResult.Rows[0]["FullName"]
                };
                userApp.Pages = GetPagesByUser(userApp.UserId);
            };
            return userApp;
        }

        public static List<PageApp> GetPagesByUser(int userId)
        {
            List<PageApp> result = new List<PageApp>();
            string command = string.Format("exec [GetPagesByUser] {0}", userId);
            DataTable dtResult = DataHelpers.GetDataTable(command, "Result", ConstantsData.ConnectionStringSimple);
            foreach (DataRow row in dtResult.Rows)
            {
                PageApp page = new PageApp();
                page.Path = (string)row["Path"];
                page.DisplayText = (string)row["DisplayText"];
                result.Add(page);
            }
            return result;
        }

        public static UserApp Login(string user, string password, out string message)
        {
            UserApp userApp;
            userApp = LoginDatabase(user, password, out message);
            bool userOk = userApp != null;           
            userApp = userOk ? userApp : null;
            return userApp;
        }

        public static UserApp LoginDatabase(string user, string password, out string message)
        {
            UserApp userApp = AuthenticateUserApp(user, password,  out message);
            return userApp;
        }


        public static DataTable GetUser(string name, string role)
        {
            string command = string.Format("exec [GetUserByFilter] '{0}', '{1}'", name, role);
            DataTable dtResult = DataHelpers.GetDataTable(command, "Result", ConstantsData.ConnectionStringSimple);                   
            return dtResult;
        }

        public static DataTable GetRole()
        {
            string command = "exec [GetRole] ";
            DataTable dtResult = DataHelpers.GetDataTable(command, "Result", ConstantsData.ConnectionStringSimple);
            return dtResult;
        }

        public static DataTable GetRoleById(int roleId)
        {
            string command = string.Format("exec [GetRoleId] {0}", roleId);
            DataTable dtResult = DataHelpers.GetDataTable(command, "Result", ConstantsData.ConnectionStringSimple);
            return dtResult;
        }

        public static void UpdateUser(string fullName, string login, string address, string phone, string email, int age, int roleId, int userId)
        {
            string command = string.Format("exec [UpdateUser] '{0}', '{1}', '{2}', '{3}', '{4}',{5}, {6}, {7}", fullName, login, address, phone, email, age, roleId, userId);
            DataHelpers.ExecuteCommand(command, ConstantsData.ConnectionStringSimple);
        }

        public static void CreateUser(string fullName, string login, string password, string address, string phone, string email, int age, int roleId)
        {
            string command = string.Format("exec [CreateUser] '{0}', '{1}', '{2}', '{3}', '{4}','{5}', {6}, {7}", fullName, login, password, address, phone, email, age, roleId);
            DataHelpers.ExecuteCommand(command, ConstantsData.ConnectionStringSimple);
        }
        public static void CancelUser(int userId)
        {
            string command = string.Format("exec [CancelUser] {0} ", userId);
            DataHelpers.ExecuteCommand(command, ConstantsData.ConnectionStringSimple);
        }

    }
}