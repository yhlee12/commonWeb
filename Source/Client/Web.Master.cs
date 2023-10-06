using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace T2LHomePage.Source.Client
{
    public class NowSet
    {
        public string title { get; set; }
        public string subtitle { get; set; }
        public string imagePath { get; set; }
        public List<subMenu> submenuL { get; set; }
        public subMenu nowMenu { get; set; }
    }
    public partial class Web : System.Web.UI.MasterPage
    {
        public Dictionary<string, menu> MenuList = null;
        public NowSet nowPage = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            MenuList = new Dictionary<string, menu>();
            setMenu();
            nowSet();
        }

        private void nowSet()
        {
            nowPage = new NowSet();
            //default Setting
            nowPage.imagePath = "/Source/Client/img/informataion_page_img.jpg";
            nowPage.title = "";
            nowPage.subtitle = "";

            string nowPath = System.IO.Path.GetFileName(Request.Url.LocalPath).ToString().Replace(".aspx","");
            foreach (var item in MenuList)
            {
                if (item.Value.subMenu == null || item.Value.subMenu.Count == 0)
                {
                    continue;
                }
                else
                {
                    foreach (var data in item.Value.subMenu)
                    {
                        if (data.path.Contains(nowPath))
                        {
                            nowPage.title = data.subPageTitle;
                            nowPage.subtitle = data.subPageSubTitle;
                            nowPage.imagePath = data.subPageImageLink;
                            nowPage.submenuL = item.Value.subMenu;
                            nowPage.nowMenu = data;
                            break;
                        }
                    }
                }
            }
        }

        private void setMenu()
        {
            createBigMenu("회사소개", "100");
            createBigMenu("사업분야", "200");
            createBigMenu("고객센터", "300");
            createBigMenu("직원전용", "400", "/Source/Admin/LoginPage");
            /*
             * parentMenuName : Bigmenu의 이름 동일하게 설정해야함(반드시)
             * title : sub 메뉴의 이름
             * Pkey : BigMenu의 key
             * key : Submenu의 Key
             * path : submenu를 누를시 넘어갈 Path. aspx제외하고 입력
             * showFlag : Client에서는 사용하지않음 반드시 True
             * subPageTitle : SubPage 상단의 Title 글자
             * subPageSubTitle : SubPage 상단의 SubTitle 글자
             * subPageImageLink : SubPage 상단의 이미지 링크
             * 
             * 
             */
            
            // 회사소개 메뉴들 메인 이미지 통일 시킴//
            insertSubMenu("회사소개", "회사소개", "100", "100100", "/Source/Client/Info/C_INFO_INFOMATION", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/Background_img.jpg");
            insertSubMenu("회사소개", "대표이사 인사말", "100", "100200", "/Source/Client/Info/C_INFO_CEOSAY", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/Background_img.jpg");
            insertSubMenu("회사소개", "조직도", "100", "100300", "/Source/Client/Info/C_INFO_COMPANY", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/Background_img.jpg");
            insertSubMenu("회사소개", "연혁", "100", "100400", "/Source/Client/Info/C_INFO_HISTORY", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/Background_img.jpg");
            insertSubMenu("회사소개", "인증 특허소개", "100", "100500", "/Source/Client/Info/C_INFO_CERTIFICATE", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/Background_img.jpg");
            insertSubMenu("회사소개", "찾아오시는 길", "100", "100600", "/Source/Client/Info/C_INFO_LOCATION", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/Background_img.jpg");
            insertSubMenu("회사소개", "Reference", "100", "100700", "/Source/Client/Info/C_INFO_REFERENCE", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/Background_img.jpg");
            insertSubMenu("회사소개", "Recruit", "100", "100800", "/Source/Client/Info/C_INFO_RECRUIT", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/Background_img.jpg");

            insertSubMenu("사업분야", "우리가 하는 일", "200", "200100", "/Source/Client/Company/C_COMPANY_WORK", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/business_img.jpg");
            insertSubMenu("사업분야", "경영이념", "200", "200200", "/Source/Client/Company/C_COMPANY_THINK", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/business_img.jpg");
            insertSubMenu("사업분야", "스마트물류플랫폼", "200", "200300", "/Source/Client/Company/C_COMPANY_LOGISPATEFORM", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/business_img.jpg");
            insertSubMenu("사업분야", "스마트여행플랫폼", "200", "200400", "/Source/Client/Company/C_COMPANY_TOURPATEFORM", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/business_img.jpg");
            insertSubMenu("사업분야", "스마트쇼핑몰플랫폼", "200", "200500", "/Source/Client/Company/C_COMPANY_SHOPPING", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/business_img.jpg");

            insertSubMenu("고객센터", "공지사항", "300", "300100", "/Source/Client/CS/C_CS_NOTICE", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/customer_img.jpg");
            insertSubMenu("고객센터", "문의", "300", "300200", "/Source/Client/CS/C_CS_CONSTRACT" , true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/customer_img.jpg");
            insertSubMenu("고객센터", "스마트물류플랫폼", "300", "300300", "http://smart.shippinggate.com", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/customer_img.jpg", false);
            insertSubMenu("고객센터", "다운로드", "300", "300400", "/Source/Client/CS/C_DOWN", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/customer_img.jpg");
            
        }
        //SubMenu Insert
        private void insertSubMenu(string parentMenuName, string title, string Pkey, string key, string path, bool showFlag = true , string subPageTitle = null,string subPageSubTitle = null, string subPageImageLink = null,bool otherFlag = true)
        {
            subMenu subMenuS = new subMenu();
            subMenuS.Pkey = Pkey;
            subMenuS.key = key;
            subMenuS.title = title;
            subMenuS.path = path;
            subMenuS.showFlag = showFlag;
            subMenuS.subPageTitle = subPageTitle;
            subMenuS.subPageSubTitle = subPageSubTitle;
            subMenuS.subPageImageLink = subPageImageLink;
            subMenuS.otherFlag = otherFlag;
            if (MenuList[parentMenuName].subMenu == null)
            {
                MenuList[parentMenuName].subMenu = new List<subMenu>();
            }
            MenuList[parentMenuName].subMenu.Add(subMenuS);
        }

        //우선은 굳이 3단 Depth등이 필요하지 않고, DB에서 관리하지 않기 때문에 딕셔너리로 처리
        //추후 DB 관리시 로직 수정이 필요.
        private void createBigMenu(string menuName, string key)
        {
            menu CreateMenu = new menu();
            CreateMenu.title = menuName;
            CreateMenu.key = key;
            MenuList.Add(menuName, CreateMenu);
        }
        //subMenu가 없는 대메뉴만 사용할경우 사용
        private void createBigMenu(string menuName, string key, string path)
        {
            menu CreateMenu = new menu();
            CreateMenu.title = menuName;
            CreateMenu.key = key;
            CreateMenu.path = path;
            MenuList.Add(menuName, CreateMenu);
        }
    }
}