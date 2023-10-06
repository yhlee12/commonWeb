using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace T2LHomePage.Source.Client.Info
{
    public partial class C_INFO_COMPANY : System.Web.UI.Page
    {
        public string result_status = "";
        public string result_message = "";

        public string flag = "";

        public DataTable listTable, listDEPT = null;
        public DataSet resultDS = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            listTable = new DataTable();
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
                //hs 클리어후 작성
                //mssql 의 경우 변수를 받을때 반드시 @ <-- 가 들어감
                //Proc 룰로 인해서 O_ERROR_FLAG와 O_RETURN_MESSAGE는 OUTPARAM으로 자동으로 받아온다.
                //Proc의 Select 갯수만큼 O_RESULT_CURSOR가 리턴됨.
                //USER_NAME과 DEPT를 받아서 SELECT조건절에 넣어줘야함. 현재는 빈값으로 처리
                hs.Clear();
                hs.Add("SP_NAME", "SP_USER_USERLIST");
                hs.Add("@I_USER_NAME", "");
                hs.Add("@I_USER_DEPT", "");

                ds = biz.excuteDataSetProcedure(hs);

                result_status = ds.Tables["O_ERROR_FLAG"].Rows[0]["O_ERROR_FLAG"].ToString();
                result_message = ds.Tables["O_RETURN_MESSAGE"].Rows[0]["O_RETURN_MESSAGE"].ToString();

                if (result_status == "N")
                {
                    listTable = ds.Tables["O_RESULT_CURSOR"];
                    listDEPT = ds.Tables["O_RESULT_CURSOR_1"];

                    resultDS = new DataSet();

                    for (int i = 0; i < listDEPT.Rows.Count; i++)
                    {
                        if (listDEPT.Rows[i]["DEPT_CD"].ToString() != "999")
                        {
                            DataTable resultDT = listTable.Select("DEPT_CD = " + "'" + listDEPT.Rows[i]["DEPT_CD"].ToString() + "'").CopyToDataTable();
                            resultDT.TableName = listDEPT.Rows[i]["DEPT_CD"].ToString();
                            resultDS.Tables.Add(resultDT);
                        }                  
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