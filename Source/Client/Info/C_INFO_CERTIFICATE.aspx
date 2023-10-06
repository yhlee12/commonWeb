<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_INFO_CERTIFICATE.aspx.cs" Inherits="T2LHomePage.Source.Client.Info.C_INFO_CERTIFICATE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <!--스크립트와 스타일은 항상 이쪽 head에 반드시 입력  -->
        <!-- 스크립트 지연이 필요할경우 defer와 $(function)을 사용하자. main.aspx참조.  -->
    <style>
         /*
        table-contents안에 부터 시작함! 
        table-contents는 padding-top 걸려 있음 
        */

         .top_Btn_layout_inner {
              text-align: center;
              margin: 0 auto;
              max-width: 300px;
              box-sizing: border-box;
              padding: 1rem 0;
              border: 1px solid #cacaca;
              border-radius: 20px;
            }

         .top_Btn_layout_inner:hover {
             border-color:orange;
         }


            .top_Btn_layout_inner > span {
              font-size: 20px;
            }

            .border_list {
              display: flex;
            }

            .border_list > div {
              width: 33.3333%;
              box-sizing: border-box;
              padding: 3rem 4rem;
            }

            .list_img {
              display: block;
              width: 100%;
              position: relative;
              border: 1px solid #837d7d;
              box-sizing: border-box;
              padding: 10px;
            }

          

            .list_img::after {
               background: rgba(0,0,0,0.3);
            }

            .list_img > img {
              width: 100%;
              height: 550px;
            }

            .view_img {
                position:absolute;
                display: none;
                width: 3rem;
                top: 50%;
                left :50%;
                transform: translate(-50%, -50%);
            }

            .view_img 

            .view_img > img {
                width: 100%;
            }

            .list_txt {
              box-sizing: border-box;
              padding: 1rem 0;
              text-align:center;
            }

            .list_txt > span {
              font-size: 24px;
              font-weight: 400;
            }

            @media screen and (max-width: 1440px) {
                .border_list > div {
                    padding: 3rem 1rem;
                }
            }

            @media screen and (max-width: 1025px) {
                .list_img > img {
                    height: 430px;
                }
            }

            @media screen and (max-width:768px) {
               .border_list {
                   display: block;
               }
               .border_list > div {
                   width: 100%;
                   padding:3rem 8rem;
               }
            }

             @media screen and (max-width:425px) {
               .border_list > div {
                   padding: 1rem 0rem;
               }
            }

             @media screen and (max-width:390px) {
                 .list_txt > span {
                     font-size: 22px;
                 }
             }
         
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sub_content">
        <div class="sub_layout">
            <div id="content">
                <div class="top_Btn">
                    <div class="top_Btn_layout">
                        <div class="top_Btn_layout_inner">
                            <span>인증/특허 소개</span>
                        </div>
                    </div>
                </div>

                <div class="certify">
                  <div class="border_wrap">
                    <div class="border">
                      <div class="border_list">

                        <div>
                          <div class="list_img">                  
                            <img src="/Source/Client/img/Cer_eight1.jpg" alt="">                    
                          </div>
                          <div class="list_txt">
                            <span>기업부설연구소 인정서</span>
                          </div>
                        </div>

                        <div>
                          <div class="list_img">                 
                            <img src="/Source/Client/img/Cer_one.jpg" alt="">  
                               
                          
                          </div>
                           
                          <div class="list_txt">
                            <span>기술평가 우수기업 인증서</span>
                          </div>
                        </div>

                        <div>
                          <div class="list_img">                  
                            <img src="/Source/Client/img/Cer_two.jpg" alt="">                    
                          </div>
                          <div class="list_txt">
                            <span>투자양해각서</span>
                          </div>
                        </div>

                    
                      </div>
                    </div>
                  </div>
                </div>

                <div class="certify">
                  <div class="border_wrap">
                    <div class="border">
                      <div class="border_list">

                        <div>
                          <div class="list_img trans_img">               
                            <img src="/Source/Client/img/Cer_three.jpg" alt="">                   
                          </div>
                          <div class="list_txt">
                            <span>벤처기업확인서</span>
                          </div>
                        </div>

                        <div>
                          <div class="list_img">                 
                            <img src="/Source/Client/img/Cer_four.jpg" alt="">                    
                          </div>
                          <div class="list_txt">
                            <span>프로그램 등록증(와이즈 벌크시스템)</span>
                          </div>
                        </div>

                        <div>
                          <div class="list_img">                  
                            <img src="/Source/Client/img/Cer_five.jpg" alt="">                    
                          </div>
                          <div class="list_txt">
                            <span>프로그램 등록증(와이즈 오퍼)</span>
                          </div>
                        </div>

                      
                      </div>
                    </div>
                  </div>
                </div>

                <div class="certify">
                  <div class="border_wrap">
                    <div class="border">
                      <div class="border_list">

                        <div>
                          <div class="list_img trans_img">               
                            <img src="/Source/Client/img/Cer_six.jpg" alt="">                   
                          </div>
                          <div class="list_txt">
                            <span>프로그램 등록증(와이즈 이알피)</span>
                          </div>
                        </div>

                        <div>
                          <div class="list_img">                 
                            <img src="/Source/Client/img/Cer_seven.jpg" alt="">                    
                          </div>
                          <div class="list_txt">
                            <span>프로그램 등록증(와이즈 타리프)</span>
                          </div>
                        </div>

                        <div>
                          <div class="list_img">                  
                            <img src="/Source/Client/img/Cer_eight.jpg" alt="">                    
                          </div>
                          <div class="list_txt">
                            <span>특허증</span>
                          </div>
                        </div>

                          

                      </div>
                    </div>
                  </div>
                </div>

                <div class="certify">
                  <div class="border_wrap">
                    <div class="border">
                      <div class="border_list">
                        <div>
                          <div class="list_img">                  
                            <img src="/Source/Client/img/Cer_nine.jpg" alt="">                    
                          </div>
                          <div class="list_txt">
                            <span>동의대학교 IPP</span>
                          </div>
                        </div>
                        <div>
                          <div class="list_img">                 
                            <img src="/Source/Client/img/Cer_ten.png" alt="">                    
                          </div>
                          <div class="list_txt">
                            <span>백만불 수출의 탑</span>
                          </div>
                        </div>

                        <div>
                          <div class="list_img">                  
                            <img src="/Source/Client/img/Cer_eleven.png" alt="">                    
                          </div>
                          <div class="list_txt">
                            <span>SK해운 감사패</span>
                          </div>
                        </div>

                       
                      </div>
                    </div>
                  </div>
                </div>


            </div>
        </div>
    </div>
</asp:Content>
