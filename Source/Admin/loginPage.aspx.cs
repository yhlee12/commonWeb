using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace T2LHomePage.Source.Admin
{
    public partial class loginPage : System.Web.UI.Page
    {
        public string result_status = "";
        public string result_message = "";

        public string flag = "";

        public string USER_ID = "";
        public string USER_PASSWORD = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            else
            {
                flag = Request.Form["flag"];

                switch (flag)
                {
                    case "login":
                        USER_ID = Request.Form["USER_ID"];
                        USER_PASSWORD = Request.Form["USER_PASSWORD"];
                        login();
                        break;
                    default:
                        result_status = "N";
                        result_message = "잘못된 경로로 접근하셨습니다.";
                        break;
                }
            }
        }

        private void login()
        {
            bizHelper biz = new bizHelper("mssqlConnectionString");
            Hashtable hs = new Hashtable();
            DataSet ds = new DataSet();

            //암호화
            string Check_Pass = BizUtil.getSHA512(USER_PASSWORD);

            try
            {
                hs.Clear();
                hs.Add("SP_NAME", "SP_PCM_LOGIN");
                hs.Add("@I_USER_ID", USER_ID);
                hs.Add("@I_USER_PASSWORD", Check_Pass);

                ds = biz.excuteDataSetProcedure(hs);

                result_status = ds.Tables["O_ERROR_FLAG"].Rows[0]["O_ERROR_FLAG"].ToString();
                result_message = ds.Tables["O_RETURN_MESSAGE"].Rows[0]["O_RETURN_MESSAGE"].ToString();

                if (result_status == "N")
                {
                    //최초 로그인 시.
                    if (ds.Tables["O_RESULT_CURSOR"].Rows[0]["FRIST_FLAG"].ToString() == "Y")
                    {
                        result_status = "Y";
                        result_message = "App에서 최초 로그인 이후 비밀번호 변경이 이루어져야합니다.";
                    }
                    else
                    {
                        //로그인 성공
                        BizUtil.setT2LHomePageinfo(Request, Session, ds.Tables["O_RESULT_CURSOR"]);
                        FormsAuthentication.SetAuthCookie(USER_ID, false);
                        Response.Redirect("/Source/admin/start.aspx");
                    }
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