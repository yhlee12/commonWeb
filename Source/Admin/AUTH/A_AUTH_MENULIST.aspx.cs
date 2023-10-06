using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace T2LHomePage.Source.Admin.AUTH
{
    public partial class A_AUTH_MENULIST : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //basePageLoad든 init든 필수 호출
            this.basePageLoad();

            if (!IsPostBack)
            {

            }
            else
            {
                //기본 세팅 setFlag는 PageBase에서 Setting되어있으며 기본적으로 주어지는
                //Btn의 Submit을 담당함
                //검색버튼 : Inquery
                //저장버튼 : Save
                //삭제버튼 : Delete
                //엑셀버튼 : Excel
                //Flag1버튼 : Flag1
                //Flag2버튼 : Flag2
                //Orderriding을 통해서 작업 모든 Return은 Void
                //Result Flag과 Message는 PageBase의 _result_status , _result_message을 사용
                this.setflag();
            }
        }

        public override void Inquery()
        {
            _result_status = "Y";
            _result_message = "orderride 처리 확인";
        }
    }
}