using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace T2LHomePage.Source.Admin
{
    public partial class Web : System.Web.UI.MasterPage
    {
        public T2LHomePageinfo baseUser = null;

        public string menu_status = "";
        public string menu_message = "";

        public string result_status = "";
        public string result_message = "";

        public string menu_path_code = "";
        public adminAuth _auth = new adminAuth();
        public string nowName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            baseUser = BizUtil.getT2LHomePageinfo(Session, Request);
            menu_path_code = Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/") + 1).Split('.')[0];
            AuthChecker();
        }

        private void basePageChecker()
        {
            if (Session[adminGolbal._sessionResult] != null && Session[adminGolbal._sessionMessage] != null)
            {
                result_status = Session[adminGolbal._sessionResult].ToString();
                result_message = Session[adminGolbal._sessionMessage].ToString();
            }
            Session[adminGolbal._sessionResult] = null;
            Session[adminGolbal._sessionMessage] = null;
        }

        private void AuthChecker()
        {
            DataTable authTable;
            //만약 세션이 끊겼을 경우 Select 보통 세션 종료됬으면 Baseuser도 날라가서 안되긴할것.
            if (Session[adminGolbal._authSession] == null)
            {
                bizHelper biz = new bizHelper("mssqlConnectionString");
                Hashtable hs = new Hashtable();
                DataSet ds = new DataSet();

                try
                {
                    hs.Clear();
                    hs.Add("SP_NAME", "SP_PCM_MENULIST");
                    hs.Add("@I_USER_ID", baseUser.USER_ID);

                    ds = biz.excuteDataSetProcedure(hs);

                    result_status = ds.Tables["O_ERROR_FLAG"].Rows[0]["O_ERROR_FLAG"].ToString();
                    result_message = ds.Tables["O_RETURN_MESSAGE"].Rows[0]["O_RETURN_MESSAGE"].ToString();

                    if (result_status == "N")
                    {
                        authTable = ds.Tables["O_RESULT_CURSOR"];
                        Session[adminGolbal._authSession] = authTable;
                    }
                    else
                    {
                        menu_status = result_status;
                        menu_message = result_message;
                        return;
                    }
                }
                catch (Exception ex)
                {
                    menu_status = "Y";
                    menu_message = ex.Message;
                    return;
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
            else
            {
                //Session 값 Setting
                authTable = (DataTable)Session[adminGolbal._authSession];
            }
            //Linq Select
            DataTable dt = authTable.AsEnumerable().Where(Row => Row.Field<string>("MENU_PATH").Contains(menu_path_code)).CopyToDataTable();
            if (dt.Rows.Count == 0)
            {
                //Dt Select 안될경우 권한 없는 Page
                menu_status = "Y";
                menu_message = "권한이 없습니다.";
                return;
            }
            else
            {
                //초기 세팅
                _auth.AUTH_EDIT = false;
                _auth.AUTH_EXCEL = false;
                _auth.AUTH_FLAG1 = false;
                _auth.AUTH_FLAG2 = false;
                //Select된 Path의 권한중 하나라도 Y면 Y로 처리
                //Contain을 써서 Path에 Name이 속해있기라도 하면 찾아오기 때문에 MENU_PATH를 넣을시에 주의하자(겁치게 넣으면 안됨)
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["AUTH_EDIT"].ToString() == "Y")
                    {
                         _auth.AUTH_EDIT = true;
                    }
                    if (dr["AUTH_EXCEL"].ToString() == "Y")
                    {
                        _auth.AUTH_EXCEL = true;
                    }
                    if (dr["AUTH_FLAG1"].ToString() == "Y")
                    {
                        _auth.AUTH_FLAG1 = true;
                    }
                    if (dr["AUTH_FLAG2"].ToString() == "Y")
                    {
                        _auth.AUTH_FLAG2 = true;
                    }
                    if (dr["AUTH_FLAG1_NAME"].ToString() != "")
                    {
                        _auth.AUTH_FLAG1_NAME = dr["AUTH_FLAG1_NAME"].ToString();
                    }
                    if (dr["AUTH_FLAG2_NAME"].ToString() != "")
                    {
                        _auth.AUTH_FLAG2_NAME = dr["AUTH_FLAG2_NAME"].ToString();
                    }
                    nowName = dr["MENU_NAME"].ToString();
                }
                //Master Page 사용하는 곳에서 일어난 Error Checking
                basePageChecker();
            }
        }
    }
}