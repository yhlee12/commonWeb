using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;
using System.Windows.Forms;
//using System.Net.Mail;

namespace T2LHomePage.Source.Client.CS
{
    public partial class C_CS_CONSTRACT : System.Web.UI.Page
    {
        public string flag = "";
        public string CUSTOMER_NAME = "";
        public string COMPANY_NAME = "";
        public string PHONE_NUM = "";
        public string USER_EMAIL = "";
        public string CUSTOMER_TITLE = "";
        public string TEXT_AREA = "";
        public string CONSTRACT_CATEGORY_NUM = "";
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
                    case "SendMail":
                        //param Setting작업
                        ParamSet();
                        //메일을 보내는 로직을 태운다
                        SendMail();
                        break;
                }
            }

        }
        private void ParamSet()
        {
            CUSTOMER_NAME = Request.Form["CUSTOMER_NAME"];
            COMPANY_NAME = Request.Form["COMPANY_NAME"];
            PHONE_NUM = Request.Form["PHONE_NUM"];
            USER_EMAIL = Request.Form["USER_EMAIL"];
            CUSTOMER_TITLE = Request.Form["CUSTOMER_TITLE"];
            TEXT_AREA = Request.Form["TEXT_AREA"];
            CONSTRACT_CATEGORY_NUM = Request.Form["CONSTRACT_CATEGORY"];
        }

        private void SendMail()
        {
            string _writer = CUSTOMER_NAME;             //문의자
            string company = COMPANY_NAME;              //회사명
            string phonenumber = PHONE_NUM;             //전화번호
            string inquiryemail = USER_EMAIL;           //답장할 메일
            string inquirytitle = CUSTOMER_TITLE;       //문의 제목
            string inquirycontant = TEXT_AREA;          //문의 내용
            string category = CONSTRACT_CATEGORY_NUM;       //문의 종류
            string category_name = "";

            try
            {
                MailMessage mail = new MailMessage();
                mail.To = "help@t2l.co.kr";//문의메일 받는사람 배포시에는 tpls@t2l.co.kr로 할것. / 네이버 메일로 보낼시 스팸으로 등록 될 수도 있으니 주의할 것
                category_name = "기타";
                if (category == "1")// 물류
                {
                    mail.To = "help@t2l.co.kr";//문의메일 받는사람 배포시에는 tpls@t2l.co.kr로 할것. / 네이버 메일로 보낼시 스팸으로 등록 될 수도 있으니 주의할 것
                    category_name = "물류";
                }
                else if (category == "2")//여행
                {
                    mail.To = "help@t2l.co.kr";//문의메일 받는사람 배포시에는 tpls@t2l.co.kr로 할것. / 네이버 메일로 보낼시 스팸으로 등록 될 수도 있으니 주의할 것
                    category_name = "여행";
                }
                else if (category == "3")//쇼핑몰
                {
                    mail.To = "help@t2l.co.kr";//문의메일 받는사람 배포시에는 tpls@t2l.co.kr로 할것. / 네이버 메일로 보낼시 스팸으로 등록 될 수도 있으니 주의할 것
                    category_name = "쇼핑몰";
                }

                mail.From = inquiryemail;
                //mail.Bcc = ConfigurationManager.AppSettings["MailSenderAddress"].ToString();



                mail.Subject = "T2L 문의하기";
                mail.Body = @"
                    <html>
                      <body>
                        <div style='border:1px solid #bdbdbd; padding:20px 50px 15px 50px; max-width:750px;'>
                          <div>
                            <div style='font-size:30px; margin-top:20px; display:flex; flex-direction:column; align-items:center; '>
                              <div><span style='font-family:Noto Sans Korean;font-weight:500'>1:1문의가 등록 되었습니다</span></div>
                              <div><span style='font-family:Noto Sans Korean;font-weight:500'>고객에게 답변을 해주세요</span></div>
                            </div>
                          </div>
                          <div style='margin-top:30px;'>
                            <div>
                              <div style='overflow:hidden;  border-top: 1px solid #a5a5a5;display:flex'>
                                <div style='font-family:Noto Sans Korean;font-weight:500;width: 155px; float:left;background-color: #f3f3f3; padding: 12px 26px; font-size: 14px;'>문의자 성함</div>
                                <div style='font-family:Noto Sans Korean;font-weight:500;padding: 12px 26px;font-size: 14px;margin: 0px auto 0px 0px;'>" + _writer + @"</div>
                                <div style='font-family:Noto Sans Korean;font-weight:500;width: 70px;float:left;background-color: #f3f3f3;padding: 12px 26px;font-size: 14px;'>문의종류</div>    
                                <div style='font-family:Noto Sans Korean;font-weight:500;padding: 12px 26px;font-size: 14px;margin-left: 0px;'>" + category_name + @"</div>
                            </div> 
                              <div style='overflow:hidden;  border-top: 1px solid #e0e0e0;'>
                                <div style='font-family:Noto Sans Korean;font-weight:500;width: 155px; float:left;background-color: #f3f3f3; padding: 12px 26px; font-size: 14px;'>기업명 또는 소속</div>
                                <div style='font-family:Noto Sans Korean;font-weight:500;padding: 12px 26px;font-size: 14px;margin-left: 207px;'>" + company + @"</div>
                              </div>
                              <div style='overflow:hidden;  border-top: 1px solid #e0e0e0;'>
                                <div style='font-family:Noto Sans Korean;font-weight:500;width: 155px; float:left;background-color: #f3f3f3; padding: 12px 26px; font-size: 14px;'>전화번호</div>
                                <div style='font-family:Noto Sans Korean;font-weight:500;padding: 12px 26px;font-size: 14px;margin-left: 207px;'>" + phonenumber + @"</div>
                              </div>
                              <div style='overflow:hidden;  border-top: 1px solid #e0e0e0;'>
                                <div style='font-family:Noto Sans Korean;font-weight:500;width: 155px; float:left;background-color: #f3f3f3; padding: 12px 26px; font-size: 14px;'>문의 고객 이메일 주소</div>
                                <div style='font-family:Noto Sans Korean;font-weight:500;padding: 12px 26px;font-size: 14px;margin-left: 207px;'>" + inquiryemail + @"</div>
                              </div>
                              <div style='overflow:hidden;  border-top: 1px solid #e0e0e0;'>
                                <div style='font-family:Noto Sans Korean;font-weight:500;width: 155px; float:left;background-color: #f3f3f3; padding: 12px 26px; font-size: 14px;'>문의 제목</div>
                                <div style='font-family:Noto Sans Korean;font-weight:500;padding: 12px 26px;font-size: 14px;margin-left: 207px;'>" + inquirytitle + @"</div>
                              </div>
                              <div style='overflow:hidden; border-bottom: 1px solid #a5a5a5; border-top: 1px solid #e0e0e0;'>
                                <div style='font-family:Noto Sans Korean;font-weight:500;width: 155px; height:300px; float:left;background-color: #f3f3f3; padding: 12px 26px; font-size: 14px;'>문의 내용</div>
                                <div style='font-family:Noto Sans Korean;font-weight:500;padding: 12px 26px;font-size: 14px;margin-left: 207px;'>" + inquirycontant + @"</div>
                              </div>
                              
                            </div>
                            <div style='font-family:Noto Sans Korean;font-weight:600; padding: 35px 85px 0px 85px; font-size: 14px;'>
                                <button type=button onclick=window.open('http://www.t2l.co.kr/');  style='border:none; display:flex;justify-content:center; align-items:center; width:100%; height:50px; background-color:#009cfb; color:white; font-family:Noto Sans Korean;font-weight:600; font-size: 14px;'>T2L 홈페이지 바로가기＞</button>
                            </div>
                          </div>
                        </div>
                      </body>
                    </html>";
                //mail.Body = "<html><body>" + randNum + "</body></html>";
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.BodyFormat = MailFormat.Html;
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserver", "mail.t2l.co.kr");
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", 25);// 25
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", 2);  //sendusing: cdoSendUsingPort, value 2, for sending the message using the network.
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", false);
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", 1);       // cdoBasic, value 1. Use basic clear-text authentication. 
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "basement@t2l.co.kr");
                mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "xlxndpf0906!@3");



                SmtpMail.Send(mail);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
    }
}