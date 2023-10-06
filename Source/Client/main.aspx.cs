using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace T2LHomePage.Source.Client
{
    public partial class main : System.Web.UI.Page
    {
        public Dictionary<string, menu> MenuList = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            MenuList = new Dictionary<string, menu>();
            setMenu();
        }

        private void setMenu()
        {
            createBigMenu("회사소개", "100");
            createBigMenu("사업분야", "200");
            createBigMenu("고객센터", "300");
            createBigMenu("직원전용", "400","/Source/Admin/LoginPage");

            //Client Page 생성 룰
            //C_대메뉴파일명_파일명 (ex : C_INFO_INFOMATION <- 회사소개)
            //상세 SubPage 세팅은 Web.Master.cs에서 처리
            //메뉴 Path등은 Web.Master.cs와 동일해야하나 SubMenu Insert 쪽의 뒤에 3개 변수는 Main에서는 없어도 무방함.
            //SubMenu Insert의 기능은 WebMaster.cs에서 상세하게 기술.
            insertSubMenu("회사소개", "회사소개", "100", "100100", "/Source/Client/Info/C_INFO_INFOMATION");
            insertSubMenu("회사소개", "대표이사 인사말", "100", "100200", "/Source/Client/Info/C_INFO_CEOSAY");
            insertSubMenu("회사소개", "조직도", "100", "100300", "/Source/Client/Info/C_INFO_COMPANY");
            insertSubMenu("회사소개", "연혁", "100", "100400", "/Source/Client/Info/C_INFO_HISTORY");
            insertSubMenu("회사소개", "인증 특허소개", "100", "100500", "/Source/Client/Info/C_INFO_CERTIFICATE");
            insertSubMenu("회사소개", "찾아오시는 길", "100", "100600", "/Source/Client/Info/C_INFO_LOCATION");
            insertSubMenu("회사소개", "Reference", "100", "100700", "/Source/Client/Info/C_INFO_REFERENCE");
            insertSubMenu("회사소개", "Recruit", "100", "100800", "/Source/Client/Info/C_INFO_RECRUIT");

            insertSubMenu("사업분야", "우리가 하는 일", "200", "200100", "/Source/Client/Company/C_COMPANY_WORK");
            insertSubMenu("사업분야", "경영이념", "200", "200200", "/Source/Client/Company/C_COMPANY_THINK");
            insertSubMenu("사업분야", "스마트물류플랫폼", "200", "200300", "/Source/Client/Company/C_COMPANY_LOGISPATEFORM");
            insertSubMenu("사업분야", "스마트여행플랫폼", "200", "200400", "/Source/Client/Company/C_COMPANY_TOURPATEFORM");
            insertSubMenu("사업분야", "스마트쇼핑몰플랫폼", "200", "200500", "/Source/Client/Company/C_COMPANY_SHOPPING");

            insertSubMenu("고객센터", "공지사항", "300", "300100", "/Source/Client/CS/C_CS_NOTICE");
            insertSubMenu("고객센터", "문의", "300", "300200", "/Source/Client/CS/C_CS_CONSTRACT");
            insertSubMenu("고객센터", "스마트물류플랫폼", "300", "300300", "http://smart.shippinggate.com", true, "우리의 기술로 세계로, 우리 함께", "Trade To Logistics 든든한 동반자가 되겠습니다.", "/Source/Client/img/customer_img.jpg", false);
            insertSubMenu("고객센터", "다운로드", "300", "300400", "/Source/Client/CS/C_DOWN");
        }
        //SubMenu Insert
        private void insertSubMenu(string parentMenuName, string title, string Pkey, string key, string path, bool showFlag = true, string subPageTitle = null, string subPageSubTitle = null, string subPageImageLink = null, bool otherFlag = true)
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