using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Data;

namespace MyWeb3
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            m_delete.Attributes.Add("onclick", "return(confirm('Jestes pewny, aby usunac?'));");
            m_open.Attributes.Add("onclick", "ViewPage('http://www.onet.pl');");//,beta

            if (IsPostBack) return;
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];

            int id = 1;
            try { id = Convert.ToInt32(Request.QueryString["id"]); }
            catch { id = 1; }
            if (id < 1) id = 1;

            using (SqlConnection con = new SqlConnection(cs))
            {
                StringBuilder sb1 = new StringBuilder();
                sb1.Append("select EmployeeID,FirstName,LastName,Address,City from dbo.Employees WHERE EmployeeID=@ID");
                //sb1.Append("getEmployee"); ;
                SqlCommand cmd = new SqlCommand(sb1.ToString(), con);
                //cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandType = CommandType.Text;
                string idStr = id.ToString();
                cmd.Parameters.Add(new SqlParameter("@ID", idStr));
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {

                    m_id.Text = rdr["EmployeeID"].ToString().Trim();
                    m_first.Text = rdr["FirstName"].ToString().Trim();
                    m_name.Text = rdr["LastName"].ToString().Trim();
                    m_address.Text = rdr["Address"].ToString().Trim();
                    m_city.Text = rdr["City"].ToString().Trim();

                    break;
                }
                con.Close();
            }

        }

        protected void m_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyPage.aspx");
        }

        protected void m_update_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                //StringBuilder sb1 = new StringBuilder();
                //sb1.Append("update  Employees set FirstName=");
                //sb1.Append("'");
                //sb1.Append(m_first.Text.Trim());
                //sb1.Append("'");
                //sb1.Append(",LastName=");
                //sb1.AppendFormat("'{0}'", m_name.Text.Trim());
                //sb1.Append(",Address=");
                //sb1.AppendFormat("'{0}'", m_address.Text.Trim());
                //sb1.Append(",City=");
                //sb1.AppendFormat("'{0}'", m_city.Text.Trim());
                //sb1.Append(" WHERE EmployeeID=");
                //sb1.Append(m_id.Text.Trim());
                //string S = sb1.ToString();
                //SqlCommand cmd = new SqlCommand(sb1.ToString(), con);
                //cmd.CommandType = CommandType.Text;

                SqlCommand cmd = new SqlCommand("sp_UpdateEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter1 = new SqlParameter("@Id", m_id.Text);
                cmd.Parameters.Add(parameter1);
                SqlParameter parameter2 = new SqlParameter("@FirstName", m_first.Text);
                cmd.Parameters.Add(parameter2);
                SqlParameter parameter3 = new SqlParameter("@LastName", m_name.Text);
                cmd.Parameters.Add(parameter3);
                SqlParameter parameter4 = new SqlParameter("@Address", m_address.Text);
                cmd.Parameters.Add(parameter4);
                SqlParameter parameter5 = new SqlParameter("@City", m_city.Text);
                cmd.Parameters.Add(parameter5);



                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("MyPage.aspx");

        }

        protected void m_delete_Click(object sender, EventArgs e)
        {

        }

        protected void m_open_Click(object sender, EventArgs e)
        {

        }
    }
}