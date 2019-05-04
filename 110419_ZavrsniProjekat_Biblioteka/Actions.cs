using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace _110419_ZavrsniProjekat_Biblioteka
{
    public class Actions
    {
        public static bool IsMember(int memCardNo)
        {
            string comm = "SELECT * FROM member WHERE m_cnum=" + memCardNo;

            SqlDataAdapter da = new SqlDataAdapter(comm, MyConnection.Connect());
            DataTable member = new DataTable();
            da.Fill(member);

            if (member.Rows.Count == 0) return false;
            else return true;
        }

        public static bool IsMemberOnline(string memUsername)
        {
            string comm = "SELECT * FROM memberOnline WHERE m_username='" + memUsername +"'";

            SqlDataAdapter da = new SqlDataAdapter(comm, MyConnection.Connect());
            DataTable member = new DataTable();
            da.Fill(member);

            if (member.Rows.Count == 0) return false;
            else return true;
        }

        public static void InsertMemberOnline(int memCardNo, string memUsername, string memPassword, string memEmail)
        {
            using (SqlConnection conn = MyConnection.Connect())
            {
                SqlCommand comm = new SqlCommand("InsertMemberOnline", conn);
                comm.CommandType = CommandType.StoredProcedure;

                SqlParameter parcardno = new SqlParameter("@Member_cnum", memCardNo);
                SqlParameter parusernm = new SqlParameter("@M_username", memUsername);
                SqlParameter parpassw = new SqlParameter("@M_password", memPassword);
                SqlParameter paremail = new SqlParameter("@M_email", memEmail);

                comm.Parameters.Add(parcardno);
                comm.Parameters.Add(parusernm);
                comm.Parameters.Add(parpassw);
                comm.Parameters.Add(paremail);

                conn.Open();
                comm.ExecuteNonQuery();
            }            
        }

        public static void UpdateMemberOnline(string memUsername)
        {
            using (SqlConnection conn = MyConnection.Connect())
            {
                SqlCommand comm = new SqlCommand("UpdateMemberOnline", conn);
                comm.CommandType = CommandType.StoredProcedure;

                SqlParameter parusernm = new SqlParameter("@M_username", memUsername);

                comm.Parameters.Add(parusernm);

                conn.Open();
                comm.ExecuteNonQuery();
            }
        }

    }
}