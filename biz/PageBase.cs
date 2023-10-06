using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace T2LHomePage
{
    public class PageBase : System.Web.UI.Page
    {
        public T2LHomePageinfo baseUser = null;
        public string basePgmId = null;

        //Master를 통한 새로운 PageRule 추가
        public string _flag = "";
        public string _result_status = "";
        public string _result_message = "";

        public void basePageInit()
        {
            string referrer = Request.Url.AbsoluteUri;

            if (!Page.User.Identity.IsAuthenticated)
            {
                if (Page.IsCallback)
                {
                    Response.Redirect("~/Source/common/Logout.aspx");
                }
                else
                {
                    Response.Redirect("~/Source/common/Logout.aspx");
                }
                return;
            }

            //pgm_id
            if (("" + Request["pgm_id"]).Length == 0)
            {
                basePgmId = "(pgm_id)";
            }
            else
            {
                basePgmId = Request["pgm_id"];
            }

            //사용자 정보
            if (baseUser == null)
            {
                setUser(Request, Session);
            }
            if (baseUser.USER_ID == null)
            {
                if (Page.IsCallback)
                {
                    Response.Redirect("~/Source/common/Logout.aspx");
                }
                else
                {
                    Response.Redirect("~/Source/common/Logout.aspx");
                }
                return;
            }

            //flag Request.Form 추가
            _flag = Request.Form["flag"];
        }

        /*
         * Page load 
         * */
        public void basePageLoad()
        {
            string referrer = Request.Url.AbsoluteUri;
            // PGM ID
            if (("" + Request["pgm_id"]).Length == 0)
            {
                basePgmId = "(pgm_id)";
            }
            else
            {
                basePgmId = Request["pgm_id"];
            }

            //사용자 정보
            if (baseUser == null)
            {
                setUser(Request, Session);
            }
            if (baseUser.USER_ID == null)
            {
                setUser(Request, Session);
            }

            //flag Request.Form 추가
            _flag = Request.Form["flag"];
        }

        // 사용자 정보 설정
        private void setUser(System.Web.HttpRequest req, System.Web.SessionState.HttpSessionState ses)
        {
            baseUser = BizUtil.getT2LHomePageinfo(ses, req);
        }

        //Master Page Form Submit Get flag
        public void setflag()
        {
            switch (this._flag)
            {
                case "inquery":
                    Inquery();
                    break;
                case "save":
                    Save();
                    break;
                case "delete":
                    Delete();
                    break;
                case "excel":
                    Excel();
                    break;
                case "flag1":
                    Flag1();
                    break;
                case "flag2":
                    Flag2();
                    break;
                    
            }
            Session[adminGolbal._sessionResult] = _result_status;
            Session[adminGolbal._sessionMessage] = _result_message;
        }

        public virtual void Save()
        {
            _result_status = "Y";
            _result_message = "작업준비중입니다.";
        }

        public virtual void Inquery()
        {
            _result_status = "Y";
            _result_message = "작업준비중입니다.";
        }

        public virtual void Delete()
        {
            _result_status = "Y";
            _result_message = "작업준비중입니다.";
        }

        public virtual void Excel()
        {
            _result_status = "Y";
            _result_message = "작업준비중입니다.";
        }

        public virtual void Flag1()
        {
            _result_status = "Y";
            _result_message = "작업준비중입니다.";
        }

        public virtual void Flag2()
        {
            _result_status = "Y";
            _result_message = "작업준비중입니다.";
        }
    }
}