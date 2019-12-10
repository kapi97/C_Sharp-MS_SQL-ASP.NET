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
    public partial class EditFilmy : System.Web.UI.Page
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
                sb1.Append("select id_film,tytul,gatunek,rok,cena_kupna,cena_wypozyczenia from dbo.filmy WHERE id_film=@ID");
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

                    m_id_film.Text = rdr["id_film"].ToString().Trim();
                    m_tytul.Text = rdr["tytul"].ToString().Trim();
                    m_gatunek.Text = rdr["gatunek"].ToString().Trim();
                    m_rok.Text = rdr["rok"].ToString().Trim();
                    m_cena_kupna.Text = rdr["cena_kupna"].ToString().Trim();
                    m_cena_wypozyczenia.Text = rdr["cena_wypozyczenia"].ToString().Trim();

                    break;
                }
                con.Close();
            }

        }

        protected void m_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Filmy.aspx");
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

                SqlCommand cmd = new SqlCommand("sp_UpdateFilmy", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter1 = new SqlParameter("@id_film", m_id_film.Text);
                cmd.Parameters.Add(parameter1);
                SqlParameter parameter2 = new SqlParameter("@tytul", m_tytul.Text);
                cmd.Parameters.Add(parameter2);
                SqlParameter parameter3 = new SqlParameter("@gatunek", m_gatunek.Text);
                cmd.Parameters.Add(parameter3);
                SqlParameter parameter4 = new SqlParameter("@rok", m_rok.Text);
                cmd.Parameters.Add(parameter4);
                SqlParameter parameter5 = new SqlParameter("@cena_kupna", m_cena_kupna.Text);
                cmd.Parameters.Add(parameter5);
                SqlParameter parameter6 = new SqlParameter("@Cena_wypozyczenia", m_cena_wypozyczenia.Text);
                cmd.Parameters.Add(parameter6);



                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Filmy.aspx");

        }

        protected void m_delete_Click(object sender, EventArgs e)
        {

        }

        protected void m_open_Click(object sender, EventArgs e)
        {

        }
    }
}