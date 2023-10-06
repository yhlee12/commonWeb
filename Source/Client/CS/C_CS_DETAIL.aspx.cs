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
    public partial class C_CS_DETAIL : PageBase //System.Web.UI.Page
    {
        public string result_status = "";
        public string result_message = "";

        public string flag = "";

        public DataTable resultDT = null;
        public DataSet resultDS = null;

        // ParamSet
        public decimal BOARD_SID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            resultDT = new DataTable();
            if (!IsPostBack)
            {
                //param Setting작업
                ParamSet();
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

        private void ParamSet()
        {
            if(!String.IsNullOrEmpty(Request["BOARD_SID"]))
            {
                BOARD_SID = Convert.ToDecimal(Request["BOARD_SID"]);
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
                hs.Add("SP_NAME", "SP_BOARD_DETAIL");
                hs.Add("@I_BOARD_SID", BOARD_SID);
                hs.Add("@I_USER_SID", baseUser == null ? "0" : baseUser.USER_SID);

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

