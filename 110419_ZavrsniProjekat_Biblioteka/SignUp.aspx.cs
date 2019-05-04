using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Drawing;

namespace _110419_ZavrsniProjekat_Biblioteka
{
	public partial class SignUp : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            HtmlElement signUpText = new HtmlElement();
            signUpText.InnerText = "Create new account";
            PlaceHolder1.Controls.Add(signUpText);
		}

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            int memberCardNo = Int32.Parse(memId.Text);
            string memberUsername = username.Text;
            string memberPassword = psw.Text;
            string memberEmail = email.Text;

            if (IsValid)
            {
                if(Actions.IsMemberOnline(memberUsername))
                {
                    PlaceHolder1.Controls.Clear();
                    HtmlElement signUpText = new HtmlElement();
                    signUpText.InnerText = "Username you entered is already in use, try another one.";
                    signUpText.Style.Value = "color: #d9534f;";
                    PlaceHolder1.Controls.Add(signUpText);                    
                }
                else
                {
                    if(Actions.IsMember(memberCardNo))
                    {
                        Actions.InsertMemberOnline(memberCardNo, memberUsername, memberPassword, memberEmail);
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        PlaceHolder1.Controls.Clear();
                        HtmlElement signUpText = new HtmlElement();
                        signUpText.InnerText = "Invalid Membership Card number. Member do not exist.";
                        signUpText.Style.Value = "color: #d9534f;";
                        PlaceHolder1.Controls.Add(signUpText);
                    }
                }                
            }            
        }
    }
}