using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace T2LHomePage.Source.Client.CS
{
    public partial class C_CS_REQUEST : System.Web.UI.Page
    {
        public string result_status = "";
        public string result_message = "";

        public string flag = "";

        public DataTable resultDT = null;
        public DataSet resultDS = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            resultDT = new DataTable();
            if (!IsPostBack)
            {
                inquery();
            }
            else
            {
                flag = Request.Form["flag"];

                switch (flag)
                {
                    case "inquery":
                        break;
                    default:
                        result_status = "N";
                        result_message = "잘못된 경로로 접근하셨습니다.";
                        break;
                }
            }
        }

        private void inquery()
        {
            //상단 필수 정의 biz hs ds
            bizHelper biz = new bizHelper("mssqlConnectionString");
            Hashtable hs = new Hashtable();
            DataSet ds = new DataSet();

            try
            {

                hs.Clear();
                hs.Add("SP_NAME", "SP_BOARD_REQUEST");
                hs.Add("@I_USER_ID", "");
                hs.Add("@I_BOARD_CLASS", "");
                hs.Add("@I_BOARD_SID", "");
                hs.Add("@I_BOARD_TITLE", "");
                hs.Add("@I_BOARD_MESSAGE", "");
                hs.Add("@I_IMPORTANT_FLAG", "");

                ds = biz.excuteDataSetProcedure(hs);

                result_status = ds.Tables["O_ERROR_FLAG"].Rows[0]["O_ERROR_FLAG"].ToString();
                result_message = ds.Tables["O_RETURN_MESSAGE"].Rows[0]["O_RETURN_MESSAGE"].ToString();

                if (result_status == "N")
                {
                    resultDT = ds.Tables["O_RESULT_CURSOR"];
                }
            }

            catch (Exception ex)
            {
                result_status = "Y";
                result_message = ex.Message;
            }

            finally
            {
                if (biz != null)
                {
                    biz.DisConnect();
                    biz = null;
                }
            }
        }
    }
}