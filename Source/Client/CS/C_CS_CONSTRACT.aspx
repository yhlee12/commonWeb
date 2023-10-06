<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_CS_CONSTRACT.aspx.cs" Inherits="T2LHomePage.Source.Client.CS.C_CS_CONSTRACT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
                img {
                    width: 100%;
                }
               
                p{
                    font-size: 14px;
                    color: rgb(230, 114, 94);
                }
                .constract_inquiry_title{
                    text-align:center;
                }
                .constract_title{
                    font-size:40px;
                    font-weight:800;
                }
                .constract_sub_title{
                    margin-top: 20px;
                    color: #222;
                    font-size: 18px;
                    font-weight: 400;
                    line-height: 1.4;
                }
                .category_input_size {    
                    font-size: 14px;
                    box-sizing: border-box;
                    padding: 8px 19px 8px 5px;
                    color: #707070;
                    border: 1px solid #c0c0c0;
                    border-radius: 4px;
                }
                .input_field{
                    display: flex;
                    justify-content: space-between;
                    flex-direction: column;
                }
                
                .grid_width{
                    width:48%;
                    margin-bottom: 20px;
                }
                .input_size{
                    width:100%;
                    font-size: 14px;
                    box-sizing : border-box;
                    padding: 14px 10px 12px 16px;
                    border: 1px solid #c0c0c0;
                    border-radius: 4px;
                }
                .email_input_size{
                    font-size: 14px;
                    width: 100%;
                    box-sizing: border-box;
                    border: 1px solid #c0c0c0;
                    border-radius: 4px;
                }
                .address_input_size{
                    font-size: 14px;
                    width: 100%;
                    box-sizing: border-box;
                    padding: 14px 10px 12px 8px;
                    color: #707070;
                    border: 1px solid #c0c0c0;
                    border-radius: 4px;
                }
                .address_select_size{
                    width:100%;
                    font-size: 22px;
                }
                .email-adress{
                    display:flex;
                    align-items: center;
                }
               .eid_dl{
               }
               .golbang{
                font-size: 18px;
                margin-left: 5px;
                margin-right: 5px;
               }

                .eserver_dl{
                    margin-left: 10px;
                }
                .required{
                    color: #222;
                    font-size: 16px;
                    font-weight: 600;
                    padding:0 0 8px 0;
                }
                .inquiry_write{               
                    width: 100%;                
        
                }
                .inquiry_email{
                    width:48%;
                }
                .constract_section{
                    padding:0.5vw 0;
                }
                .phone_num_section{
                    display:flex;
                    align-items: center;
        
                }
                .title_box{
                    padding: 1vw 0 3vw 0;
                }
                input{
                    padding: 14px 10px 12px 16px;
                }
                .name_space{
                    
                }
                .inquiry-stitle{
                    
                    padding:1rem 0;
                }
                .termArea{
                    border: 1px solid #c0c0c0;
                    border-radius: 4px;
                    padding: 10px;
                    background: #f8f8f8;
                }
                .fRight{
                    padding: 10px 0 0 10px;
                    font-size: 16px;
                }
                .bt_wrap{
                    padding: 5vw 0 0 0;
                }
                .clickBtnSet{
                    margin: 0 auto;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    font-size: 18px;
                    font-weight: 500;
                    color: #fff;                
                    background-color: #313131;
                    border-radius: 5px;
                    box-sizing: border-box;
                    padding: 1rem;
                    max-width: 500px;
                }
                .content_one{
                    display: flex;
                    justify-content: space-between;
                }
                .content_two{
                    display: flex;
                    justify-content: space-between;
                }
                .phone_input_size{
                    width: 100%;
                    font-size: 14px;
                    box-sizing : border-box;
                    border: 1px solid #c0c0c0;
                    border-radius: 4px;
                }

                dd{
                    font-size: 25px;
                }
                .barspace{
                    padding: 0 2% 0 2%;
                }
                
                .wptag{
                    margin-top: 10px;
                }
                .minquiry_email{
                        display:none;
                    }
                @media screen and (max-width:1025px){
                    .inquiry_email{
                        width: 48%;
                    }
                    .inquiry-stitle {
                        text-align:center;
                    }
                    
                }
                @media screen and (max-width:768px){
                    .content_one {
                        display: block;
                    }

                    .content_two {
                        display: block;
                    }

                    .inquiry_email{
                        width:100%
                    }
                    .grid_width {
                        width: 100%;
        
                    }
                }
                @media screen and (max-width:700px){
                   

                    .inquiry_email{
                        display:block;
                    }
                    .minquiry_email{
                        display:none;
        
                    }
                    .address_select_size{
                    width:100%;
                    font-size: 16px;
                    }
                    .address_input_size{
                        font-size: 16px;
                        width: 100%;
                        box-sizing: border-box;
                    }
                   
                    
                    .emailspace{
                        padding: 8px 0 0px 0;
                    }
                    .email_input_size {
                        font-size: 16px;
                    }
                    .input_size{
                        font-size:18px;
                    }
                    .phone_input_size{
                        font-size:18px;
                    }
                }
                @media screen and (max-width:376px){
                    .inquiry_email{
                        width:77%;
                    }
                }
                @media screen and (max-width:321px){
                    .inquiry_email{
                        width:77%;
                    }
                }
    </style>
    <script>
        var oEditors = [];
        var TargetTextAreaId;
        function input_email() {

            document.getElementById("USER_EMAIL_ADDRESS").value = document.getElementById("email_server").value;

        }
        function input_category() {

            document.getElementById("CONSTRACT_CATEGORY").value = document.getElementById("constract_category").value;
            console.log(document.getElementById("CONSTRACT_CATEGORY").value);
        }

        function SaveData() {
            if (checkParam() == false) {
                return;
            }

            var user_email = ($("#USER_EMAIL_ID")).val() + "@" + ($("#USER_EMAIL_ADDRESS")).val();


            if ($("#PHONE_NUM1").val() == "" && $("#PHONE_NUM2").val() == "" && $("#PHONE_NUM3").val() == "") {
                var phone_number = "전화번호를 입력하지 않았습니다.";

            }
            else {
                var phone_number = ($("#PHONE_NUM1").val() + "-" + $("#PHONE_NUM2").val() + "-" + $("#PHONE_NUM3").val());
            }


            $("#USER_EMAIL").val(user_email);
            $("#PHONE_NUM").val(phone_number);

            $("#flag").val("SendMail");
            $("#form1").submit();
        }


        function checkParam() {
            var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            const phoneRegex = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var test_email = ($("#USER_EMAIL_ID")).val() + "@" + ($("#USER_EMAIL_ADDRESS")).val();
            var test_phone = ($("#PHONE_NUM1").val() + "-" + $("#PHONE_NUM2").val() + "-" + $("#PHONE_NUM3").val());
            var test_nullphone = ($("#PHONE_NUM1").val() == "" && $("#PHONE_NUM2").val() == "" && $("#PHONE_NUM3").val() == "");



            var check = 0;
            if ($("input[name=CUSTOMER_NAME]").val() == "") {
                alert("작성자를 확인해주세요.");
                check += 1;
                return false;
            }
            if (check > 0) { return false; }

            if ($("input[name=COMPANY_NAME]").val() == "") {
                alert("기업명 또는 소속명을 확인해주세요.");
                check += 1;
                return false;
            }
            if (check > 0) { return false; }

            if ($("input[name=USER_EMAIL_ID]").val() == "") {
                alert("이메일을 확인해주세요.");
                check += 1;
                return false;
            }
            if (check > 0) { return false; }



            //if (!emailRegex.test(test_email)) {
            //    alert("유효하지 않은 이메일 양식입니다.");
            //    check += 1;
            //    return false;
            //}
            //if (check > 0) { return false; }

            if (test_nullphone == false) {

                if (!phoneRegex.test(test_phone)) {
                    alert("유효하지 않은 전화번호 양식입니다.");
                    check += 1;
                    return false;
                }

            }
            if (check > 0) { return false; }




            if (!regExp.test($("input[name=USER_EMAIL_ADDRESS]").val())) {
                alert("유효하지 않은 이메일주소 입니다.");
                check += 1;
                return false;
            }
            if (check > 0) { return false; }

            if ($("#agreeCheck:checked").is(":checked") != true) {
                alert("이용약관에 동의해주세요.");
                check += 1;
                return false;
            }
            if (check > 0) { return false; }

            if (check == 0) { alert("문의메일 전송완료"); }
            return true;

        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="sub_content">
                <div class="sub_layout">
                    <div id="content">
                        <input type="hidden" id="flag" name="flag" value="" />
                        <input type="hidden" id="USER_EMAIL" name="USER_EMAIL" value="" />
                        <input type="hidden" id="PHONE_NUM" name="PHONE_NUM" value="" />
                        <input type="hidden" id="CONSTRACT_CATEGORY_NUM" name="CONSTRACT_CATEGORY_NUM" value=""/>
                        <div class="content_wrap">
                            <div class="inquiry_wrap">
        
        
        
                                <div class="constract_inquiry_title">
                                    <div class="constract_title">문의하기</div>
                                    <div class="constract_sub_title">궁금하신 사항이 있으신가요? T2L에서 빠르고 정확하게 답변해 드리겠습니다.</div>
        
                                </div>
                                <p>(*)는 필수로 입력하셔야하는 항목입니다.</p>
        
                                <div class="inquiry_write">
                                    <div class="inquiry-stitle">
                                        <div class="category_title required" >문의 종류</div>
                                        <div class="constract_select">
                                            <select class="constract_category category_input_size" name="constract_category" id="constract_category" onchange="input_category();">
                                                <option value="">기타</option>
                                                <option value="1">물류</option>
                                                <option value="2">여행</option>
                                                <option value="3">쇼핑몰</option>
                                                
                                                        
                                            </select>
                                        </div>
                                        
                                        
                                    </div>
                                     
                                    <div class="input_field">
                                        
                                        <div class="content_one">
                                        <div class="writer grid_width">
                                            <div class="writer_inner required" >Name</div>
                                            <div>
                                                <dd>
                                                    <input class="input_size" type="text" maxlength="15" name="CUSTOMER_NAME" placeholder="*작성자 성명" autocomplete="off" required style="background:#f8f8f8;"/>
                                                </dd>
                                            </div>
                                        </div>
                                        <div class="company grid_width">
                                            <div class="writer_inner required" >Company</div>
                                            <dl>
                                                <dd>
                                                    <input class="input_size" type="text" maxlength="15" name="COMPANY_NAME" placeholder="*기업명 또는 소속명" autocomplete="off" required style="background:#f8f8f8;" />
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>


                                    <div class="content_two">
                                        <div class="phone grid_width">
                                            <div class="content_two_in">
                                            <div class="writer_inner required">PhoneNumber</div>
                                            <div class="phone_num_section">
                                                <div>
                                                    <div>
                                                        <input class="phone_input_size" maxlength="4" type="text" id="PHONE_NUM1" name="PHONE_NUM1" placeholder=" " autocomplete="off" required />
                                                        </div>
                                                </div>
                                                <div class="barspace ">
                                                    <div>
                                                        <div style="text-align: center;">
                                                            -
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>
                                                        <input class="phone_input_size" maxlength="4" type="text" id="PHONE_NUM2" name="PHONE_NUM2" placeholder=" " autocomplete="off" required />
                                                        </div>
                                                </div>
                                                <div class="barspace ">
                                                    <div>
                                                        <div style="text-align: center;">
                                                            -
                                                        </div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>
                                                        <input class="phone_input_size" maxlength="4" type="text" id="PHONE_NUM3" name="PHONE_NUM3" placeholder="" autocomplete="off" required />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        
                                            <div class="inquiry_email ">
                                                <div class="inquiry_email_inner required">E-Mail</div>
                                                <div class="email-adress">
                                                    <div class="eid_dl">
                                                            <input class="email_input_size" maxlength="15" type="text" id="USER_EMAIL_ID" name="USER_EMAIL_ID" placeholder="*답변 받으실 이메일" autocomplete="off" />

                                                    </div>
                                                    <div class="golbang"> @</div>

                                                    <div class="eaddress_dl ">
                                                        <div>
                                                            <input class="address_input_size" maxlength="15" type="text" id="USER_EMAIL_ADDRESS" name="USER_EMAIL_ADDRESS" placeholder="예)T2L.co.kr" autocomplete="off" />
            
                                                        </div>
                                                    </div>
                                                    <div class="eserver_dl ">
                                                        <select class="email_server address_input_size" name="email_server" id="email_server" onchange="input_email();">
                                                            <option value="">직접입력</option>
                                                            <option value="naver.com">naver.com</option>
                                                            <option value="nate.com">nate.com</option>
                                                            <option value="hanmail.net">hanmail.net</option>
                                                            <option value="gmail.com">gmail.com</option>
                                                            <option value="yahoo.com">yahoo.com</option>
                                                            <option value="yahoo.co.kr">yahoo.co.kr</option>
                                                            <option value="hotmail.com">hotmail.com</option>
            
                                                        </select>
                                                    </div>
            
                                                </div>
                                                <dl class="wptag">
                                                    <p>※이메일이 정확하지 않을 경우 답변이 어려울 수 있습니다.</p>
                                                </dl>
                                            </div>
                                        </div>



                                            <%--<div class="minquiry_email ">
                                                <div class="inquiry_email_inner required">E-Mail</div>
                                                <div class="email-adress">
                                                    <dl class="eid_dl">
                                                        <dd style="font-size: 25px;">
                                                            <input class="email_input_size" type="text" id="mUSER_EMAIL_ID" name="USER_EMAIL_ID" placeholder="*이메일" autocomplete="off" />
                                                            </dd>
                                                    </dl>
                                                    <dl class="emailspace ">
                                                        <dd>
                                                            <div style="text-align: center;">
                                                                @
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                    <dl class="eaddress_dl ">
                                                        <dd>
                                                            <input class="address_input_size" type="text" id="mUSER_EMAIL_ADDRESS" name="USER_EMAIL_ADDRESS" placeholder=" " autocomplete="off" />
            
                                                        </dd>
                                                        <dd class="eserver_dl ">
                                                            <select class="email_server address_select_size" name="email_server" id="memail_server" onchange="input_email();">
                                                                <option value="">직접입력</option>
                                                                <option value="naver.com">naver.com</option>
                                                                <option value="nate.com">nate.com</option>
                                                                <option value="hanmail.net">hanmail.net</option>
                                                                <option value="gmail.com">gmail.com</option>
                                                                <option value="yahoo.com">yahoo.com</option>
                                                                <option value="yahoo.co.kr">yahoo.co.kr</option>
                                                                <option value="hotmail.com">hotmail.com</option>
            
                                                            </select>
                                                        </dd>
                                                    </dl>
                                                    
            
                                                </div>
                                                <dl class="wptag">
                                                    <p>※이메일이 정확하지 않을 경우 답변이 어려울 수 있습니다.</p>
                                                </dl>
                                            </div>--%>
        
                                    </div>
                                    <div class="constract_section">
                                        <div class="title grid_width" style="width:100%;">
                                            <div class="title_inner required">문의제목</div>
                                            <dl>
                                                <dd>
                                                    <input class="input_size" type="text" name="CUSTOMER_TITLE" maxlength="20" placeholder="*문의 제목" autocomplete="off" />
        
                                                </dd>
                                            </dl>
                                        </div>
        
                                        <div class="title_box">
                                            <div class="title_text_inner required">문의내용</div>
                                            <dl>
                                                <dd>
                                                    <textarea class="input_size" name="TEXT_AREA" cols="30" rows="10" placeholder="*문의 내용" autocomplete="off" style="min-width:100%; max-width:100%; min-height:300px; max-height:300px; overflow:scroll; overflow-x: hidden;"></textarea>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
        
        
                                    <div class="term_section">
                                        <div class="terms_title required">
                                            <strong>약관 동의</strong>
                                        </div>
        
                                        <div class="termArea">
                                            <div class="termCont terms" style="overflow-y: scroll; height: 200px">
                                                <p style="color:#505050; margin:0 0 10px 0; font-size:16px">제1조 (목적)</p>
                                                <p style="color:#505050; margin:0 0 10px 0;">1) 정보수집동의</p>
        
                                                <p style="color:#505050; margin:0 0 10px 0;">(1) 수집하는 개인정보의 항목</p>
                                                <ul class="list_hyphen">
        
                                                    <!-- <li style="color:#505050; margin:0 0 4px 0;">1) 정보수집동의 </li>
                                                    <li style="color:#505050; margin:0 0 4px 0;">2) 정보수집동의</li> -->
                                                    <p style="color:#505050; margin:0 0 4px 0;">이용자의 개인정보를 중요시하며, ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’, ‘개인정보 보호법’을 준수하고 있습니다.</p>
                                                    <br>
                                                    <p style="color:#505050; margin:0 0 4px 0;">회사는 개인정보처리방침을 통하여 회사가 이용자로부터 제공받은 개인정보를 어떠한 용도와 방식으로 이용하고 있으며, 개인정보보호를 위해 어떠한 조치를 취하고 있는지 알려드립니다.개인정보’란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다.</p>
                                                    <br>
                                                    <p style="color:#505050; margin:0 0 4px 0;">회사는 개인정보처리방침의 지속적인 개선을 위하여 개인정보처리방침을 개정하는데 필요한 절차를 정하고 있습니다. 그리고 개인정보처리방침을 개정하는 경우 버전번호를 부여하여 개정된 사항을 쉽게 알아볼 수 있도록 하고 있습니다.</p>
                                                    <p style="color:#505050; margin:0 0 4px 0;">본 개인정보처리방침은 2022년 9월 20일부터 시행되며, 이를 개정하는 경우 웹사이트 공지사항(또는 서면/이메일/전화/SMS의 방법으로 개별공지)을 통하여 공지할 것입니다.</p>
        
                                                </ul>
        
                                                <p style="color:#505050; margin:0 0 4px 0;">(2) 개인정보 수집방법</p>
        
                                                <p style="color:#505050; margin:0 0 4px 0;">회사는 이용자께서 회사의 개인정보 수집·이용 동의서 각각의 내용에 대해 ‘동의’ 또는 ‘동의하지 않음’을 선택할 수 있도록 하고 있습니다. 다만, 이용자가 회사의 개인정보 수집·이용에 동의하지 않는 경우 관련 서비스의 이용 등이 제한될 수 있습니다.</p>
                                            </div>
                                        </div>
                                        <div class="fRight">
                                            <input type="checkbox" id="agreeCheck" />
                                            <label for="agreeCheck">약관에 동의합니다.(필수)</label>
        
                                        </div>
                                    </div>
               
                                    <div class="bt_wrap">
                                        
                                        <div class="clickBtnSet" onclick="SaveData();">문의 접수하기</div>
                                        <!--<a href="#">수정</a>
                            a태그 쓰지 말 것 값 그냥 넘어감 
                            -->
                                    </div>
        
        
                                </div>
                            </div>
        
                        </div>
        
                    </div>
                </div>
        
            </div>

    
</asp:Content>