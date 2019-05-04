using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _110419_ZavrsniProjekat_Biblioteka
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                Message.Text = "It is valid.";
            }
            else
            {
                Message.Text = "Login attempt failed.";
            }
        }
    }
}