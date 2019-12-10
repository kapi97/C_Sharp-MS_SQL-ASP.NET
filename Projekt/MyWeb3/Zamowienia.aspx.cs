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
    public partial class Zamowienia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String strSearch = this.m_search.Text;

            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            StringBuilder sb1 = new StringBuilder();
            //sb1.Append("select id_zamowienie,zamowiony_film,id_klient from dbo.zamowienia");
            sb1.Append("select id_zamowienie,zamowiony_film,id_klient,tytul,gatunek,rok,dbo.filmy.cena_kupna from dbo.filmy join dbo.zamowienia on dbo.zamowienia.zamowiony_film=dbo.filmy.id_film where dbo.filmy.cena_kupna !=0"); //is not null
                      //dbo.klienci.imie
            if (strSearch.Length > 0)
            {
                //sb1.AppendFormat(" where LastName like '%{0}%'", strSearch);
                sb1.Append(" where zamowiony_film like @LIKENAME");
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