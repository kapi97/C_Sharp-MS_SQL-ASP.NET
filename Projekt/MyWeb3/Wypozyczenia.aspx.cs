using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace MyWeb3
{
    public partial class Wypozyczenia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String strSearch = this.m_search.Text;

            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            StringBuilder sb1 = new StringBuilder();
            //sb1.Append("select id_wypozyczenie,wypozyczony_film,okres_wypozyczenia,id_klient from dbo.wypozyczenia");
            sb1.Append("select id_wypozyczenie,wypozyczony_film,okres_wypozyczenia,id_klient from dbo.filmy join dbo.wypozyczenia on dbo.wypozyczenia.wypozyczony_film=dbo.filmy.id_film where dbo.filmy.cena_wypozyczenia !=0");
            if (strSearch.Length > 0) //,tytul,gatunek,rok,dbo.filmy.cena_wypozyczenia
            {
                //sb1.AppendFormat(" where LastName like '%{0}%'", strSearch);
                sb1.Append(" where wypozyczony_film like @LIKENAME");
            }
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(sb1.ToString(), con);
                cmd.CommandType = CommandType.Text;
                if (strSearch.Length > 0)
                {
                    string str = "%" + strSearch + "%";
                    cmd.Parameters.Add(new SqlParameter("@LIKENAME", str));
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                this.m_rptEmployees.DataSource = ds;

                this.m_rptEmployees.DataBind();
            }

        }

        protected void m_refresh_Click(object sender, EventArgs e)
        {

        }
    }
}