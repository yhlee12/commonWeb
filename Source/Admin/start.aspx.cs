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
    public partial class start : PageBase
    {
        public Dictionary<string, menu> MenuList = null;

        public string result_status = "";
        public string result_message = "";

        public string flag = "";
        DataTable menuTable = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.basePageLoad();
            MenuList = new Dictionary<string, menu>();
            inqueryMenu();
            setMenu();
        }

        //Db Menu & Auth Select
        private void inqueryMenu()
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
                    menuTable = ds.Tables["O_RESULT_CURSOR"];
                    Session[adminGolbal._authSession] = menuTable.Copy();
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

        private void setMenu()
        {
            foreach (DataRow rows in menuTable.Rows)
            {
                if (rows["MENU_LEV"].ToString() == "1")
                {
                    createBigMenu(rows["MENU_NAME"].ToString(), rows["MENU_SID"].ToString(), rows["MENU_PATH"].ToString());
                }
                else if(rows["MENU_LEV"].ToString() == "2")
                {
                    insertSubMenu(rows["PARENT_MENU_SID"].ToString(), rows["MENU_NAME"].ToString(), rows["PARENT_MENU_SID"].ToString(), rows["MENU_SID"].ToString(), rows["MENU_PATH"].ToString(), (rows["AUTH_VISIBLE"].ToString() == "Y"));
                }
            }
            //createBigMenu("회원관리", "100");
            //createBigMenu("게시판관리", "200");

            //insertSubMenu("회원관리", "직원목록", "100", "100100", "/Source/Admin/User/T_USER_LIST");
            //insertSubMenu("회원관리", "직원상세", "100", "100200", "/Source/Admin/User/T_USER_REQUEST", false);

            //insertSubMenu("게시판관리", "공지사항", "200", "100200", "/Source/Admin/User/T_USER_REQUEST");
            //insertSubMenu("게시판관리", "공지사항상세", "200", "100200", "/Source/Admin/User/T_USER_REQUEST", false);
        }
        //SubMenu Insert
        private void insertSubMenu(string parentMenuKey, string title, string Pkey, string key, string path, bool showFlag = true)
        {
            subMenu subMenuS = new subMenu();
            subMenuS.Pkey = Pkey;
            subMenuS.key = key;
            subMenuS.title = title;
            subMenuS.path = path;
            subMenuS.showFlag = showFlag;
            if (MenuList[parentMenuKey].subMenu == null)
            {
                MenuList[parentMenuKey].subMenu = new List<subMenu>();
            }
            MenuList[parentMenuKey].subMenu.Add(subMenuS);
        }

        //우선은 굳이 3단 Depth등이 필요하지 않고, DB에서 관리하지 않기 때문에 딕셔너리로 처리
        //추후 DB 관리시 로직 수정이 필요.
        private void createBigMenu(string menuName, string key)
        {
            menu CreateMenu = new menu();
            CreateMenu.title = menuName;
            CreateMenu.key = key;
            MenuList.Add(key, CreateMenu);
        }
        //subMenu가 없는 대메뉴만 사용할경우 사용
        private void createBigMenu(string menuName, string key, string path)
        {
            menu CreateMenu = new menu();
            CreateMenu.title = menuName;
            CreateMenu.key = key;
            CreateMenu.path = path;
            MenuList.Add(key, CreateMenu);
        }

        protected void logoutClick_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            HttpCookie aCookie;
            string cookieName;
            int limit = Request.Cookies.Count;
            for (int i = 0; i < limit; i++)
            {
                cookieName = Request.Cookies[i].Name;
                aCookie = new HttpCookie(cookieName);
                aCookie.Expires = DateTime.Now.AddDays(-1); // make it expire yesterday
                Response.Cookies.Add(aCookie); // overwrite it
            }
            Request.Cookies.Clear();
            if (Request.Cookies["T2LHomePage"] != null)
            {
                Request.Cookies.Remove("T2LHomePage");
            }
            FormsAuthentication.SignOut();
            Response.Redirect("~/Source/Admin/loginPage.aspx");
        }
    }
}