<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_COMPANY_LOGISPATEFORM.aspx.cs" Inherits="T2LHomePage.Source.Client.Company.C_COMPANY_LOGISPATEFORM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .logic {
              box-sizing: border-box;
              margin: 0 auto;
            }

            .logic_top_title {
              font-size: 30px;
              font-weight: 700;
            }

            .logic_sub_title {
              padding : 2rem 0 ;
              font-size: 24px;
              color: #504f4f;
            }

            .logic_bottom_title {
              font-size: 24px;
              color: #504f4f;
              line-height:1.5;
            }

            .logic_content_wrap {
              position: relative;
              box-sizing: border-box;
              padding: 6rem 8rem;
            }

            .left_small {
              position: absolute;
              box-sizing: border-box;
              width: 10rem;
              top: 41%;
              left: 16.5%;
              animation: showLeftBounce 2.5s infinite linear;

            }

            @keyframes showLeftBounce {
              0% {
                top: 485px;
              }
              50% {
                top: 470px;
              }
              100% {
                top: 485px;
              }
            }

            .right_small {
              position: absolute;
              width: 10rem;
              top: 56.5%;
              left: 31%;
              animation: showRightBounce 2.5s infinite linear;
            }

            @keyframes showRightBounce {
              0% {
                top: 680px;
              }
              50% {
                top: 665px;
              }
              100% {
                top: 680px;
              }
            }

            .big_bounce {
              position: absolute;
              box-sizing: border-box;
              width: 19rem;
              top: 37%;
              left: 58.2%;
              animation: showBigBounce 1.5s infinite linear;
            }

            @keyframes showBigBounce {
              0% {
                top: 425px;
              }
              50% {
                top: 405px;
              }
              100% {
                top: 425px;
              }
            }

            .top_ch {
              position: absolute;
              box-sizing: border-box;
              width: 9.5rem;
              left: 79%;
              top: 14%;
            }

            .logic_bottom_txt {
              box-sizing: border-box;
              padding: 0 2rem;
            }

            .logic_bottom_txt_wrap {
              display: flex;
              justify-content: space-around;
            }

            .logic_bottom_txt_wrap > .wrap_txt {
              box-sizing: border-box;
              padding: 1rem 2rem;
              text-align: center;
              border: 1px solid #cacaca;
              width: 28%;
            }

            .logic_bottom_txt_wrap > .wrap_txt > .wrap_txt_title > .wrap_txt_main_title {
              box-sizing: border-box;
              padding: 1rem 0;
              border-bottom: 1px solid #cacaca;
              font-size: 24px;
              font-weight: 700;
            }

            .logic_bottom_txt_wrap > .wrap_txt > .wrap_txt_title > .wrap_txt_main_title > p {
              font-size: 18px;
              color: #7c7979;
              padding: 1rem 0 0 0;
              line-height: 1.5;
            }

            .wrap_txt_main_title_content {
              padding: 1rem 0;
            }

            .wrap_txt_main_title_content > ul > li {
              display: block;
              box-sizing: border-box;
              padding: 10px 0;
              font-size: 18px;
              color: #7c7979;
            }

            .title_content_img {
                box-sizing:border-box;
                padding: 1rem 6rem;
            }

            .ground_img {
                position: relative;
            }

            .bg_link {
                position:absolute;
                width:100%;
                height:15rem;
                bottom:0;
                z-index:999;
                cursor:pointer;
            }

            @media screen and (max-width: 1440px) {
                .title_content_img {       
                    padding: 1rem 5rem;
                    margin-bottom: 0.5rem;
                }
                 .left_small {
                width: 9rem;
                left: 17%;
                top: 40%;
              }
  
              @keyframes showLeftBounce {
                0% {
                  top: 435px;
                }
                50% {
                  top: 425px;
                }
                100% {
                  top: 435px;
                }
              }

              .right_small {
                width: 9rem;
                left: 31.3%;
                top: 55.5%;
              }

              @keyframes showRightBounce {
                0% {
                  top: 600px;
                }
                50% {
                  top: 590px;
                }
                100% {
                  top: 600px;
                }
              }
  
              .big_bounce {
                top: 32%;
                left: 56.4%;
              }
  
              @keyframes showBigBounce {
                0% {
                  top: 350px;
                }
                50% {
                  top: 340px;
                }
                100% {
                  top: 350px;
                }
              }

              .top_ch {
                left: 77%;
                top: 13%;
              }
            }

            @media screen and (max-width: 1024px) { 

              .left_small {
                width: 5.5rem;
                left: 20.5%;
                top: 41%;
              }
  
              @keyframes showLeftBounce {
                0% {
                  top: 310px;
                }
                50% {
                  top: 300px;
                }
                100% {
                  top: 310px;
                }
              }

              .right_small {
                width: 5.5rem;
                left: 33.3%;
                top: 54.5%;
              }

              @keyframes showRightBounce {
                0% {
                  top: 411px;
                }
                50% {
                  top: 401px;
                }
                100% {
                  top: 411px;
                }
              }
  
              .big_bounce {
                left: 55.9%;
                width: 12rem;
              }
  
              @keyframes showBigBounce {
                0% {
                  top: 250px;
                }
                50% {
                  top: 230px;
                }
                100% {
                  top: 250px;
                }
              }

              .top_ch {
                width: 6.5rem;
                left: 74%;
                top: 15%;
              }

              .title_content_img {
                  padding: 1em 2rem;
              }
            }

            @media screen and (max-width: 768px) {
                .logic_content_wrap {
                    padding: 4rem 3rem;
                }

                .logic_bottom_title {
                    font-size: 23px;
                }

              .left_small {
                width: 4.5rem;
                left: 15.5%;
                top: 41%;
              }
  
              @keyframes showLeftBounce {
                0% {
                  top: 250px;
                }
                50% {
                  top: 244px;
                }
                100% {
                  top: 250px;
                }
              }

              .right_small {
                width: 4.5rem;
                left: 30.5%;
                top: 56%;
              }

              @keyframes showRightBounce {
                0% {
                  top: 335px;
                }
                50% {
                  top: 329px;
                }
                100% {
                  top: 335px;
                }
              }
  
              .big_bounce {
                width: 9rem;
                left: 57.9%;
                top: 36%;
              }
  
              @keyframes showBigBounce {
                0% {
                  top: 210px;
                }
                50% {
                  top: 200px;
                }
                100% {
                  top: 210px;
                }
              }

              .top_ch {
                width: 5rem;
                left: 78.5%;
                top: 15%;
              }

                .logic_bottom_txt_wrap > .wrap_txt > .wrap_txt_title > .wrap_txt_main_title {
                font-size: 20px;
              }

              .logic_bottom_txt_wrap > .wrap_txt > .wrap_txt_title > .wrap_txt_main_title > p, 
              .wrap_txt_main_title_content > ul > li {
                font-size: 16px;
              }

                .title_content_img {
                  padding: 1em 0;
              }
            }

            @media screen and (max-width: 425px) {

              .logic_content_wrap {
                padding: 3rem 0;
              }

              .logic_top_title {
                font-size: 20px;
              }

              .logic_sub_title {
                font-size: 16px;
                padding: 1rem 0;
              }

              .logic_bottom_title {
                font-size: 16px;
              }

              .left_small {
                width: 3rem;
                left: 9.5%;
                top: 40.5%;
              }
  
              @keyframes showLeftBounce {
                0% {
                  top: 160px;
                }
                50% {
                  top: 154px;
                }
                100% {
                  top: 160px;
                }
              }

              .right_small {
                width: 3rem;
                left: 26.7%;
                top: 55.2%;
              }

              @keyframes showRightBounce {
                0% {
                  top: 215px;
                }
                50% {
                  top: 210px;
                }
                100% {
                  top: 215px;
                }
              }
  
              .big_bounce {
                width: 7rem;
                left: 56.4%;
                top: 31%;
              }
  
              @keyframes showBigBounce {
                0% {
                  top: 124px;
                }
                50% {
                  top: 114px;
                }
                100% {
                  top: 124px;
                }
              }

              .top_ch {
                width: 3rem;
                left: 84.5%;
                top: 16%;
              }

              .logic_bottom_txt {
                padding: 0;
              }



              .logic_bottom_txt_wrap > .wrap_txt > .wrap_txt_title > .wrap_txt_main_title > p, 
              .wrap_txt_main_title_content > ul > li {
                font-size: 16px;
              }

              .logic_bottom_txt_wrap {
                  display: block;
              }

              .logic_bottom_txt_wrap > .wrap_txt {
                  width: 100%;
                  margin-bottom: 1rem;
              }

              .title_content_img {
                  padding: 1em 4rem;

            }

            @media screen and (max-width: 390px) {

              .logic_sub_title {
                font-size: 15px;
              }

              .logic_bottom_title {
                font-size: 15px;
              }


              .left_small {
                width: 2.7rem;
                left: 9.5%;
                top: 41.5%;
              }
  
              @keyframes showLeftBounce {
                0% {
                  top: 150px;
                }
                50% {
                  top: 145px;
                }
                100% {
                  top: 150px;
                }
              }

              .right_small {
                width: 2.7rem;
                left: 27%;
                top: 54.2%;
              }

              @keyframes showRightBounce {
                0% {
                  top: 200px;
                }
                50% {
                  top: 195px;
                }
                100% {
                  top: 200px;
                }
              }
  
              .big_bounce {
                width: 6.1rem;
                left: 57.4%;
                top: 333%;
              }
  
              @keyframes showBigBounce {
                0% {
                  top: 114px;
                }
                50% {
                  top: 108px;
                }
                100% {
                  top: 114px;
                }
              }

              .top_ch {
                width: 3rem;
                left: 83.5%;
                top: 16%;
              }

              .logic_bottom_txt_wrap > .wrap_txt {
                  padding: 0.5rem;
              }

              .wrap_txt_main_title_content > ul > li {
                  padding: 5px 0;
              }
              .bg_link {
                  height:4rem;
              }
            }

            @media screen and (max-width: 375px) {
                  .left_small {
                width: 2.7rem;
                left: 9%;
                top: 41%;
              }
  
              @keyframes showLeftBounce {
                0% {
                  top: 145px;
                }
                50% {
                  top: 140px;
                }
                100% {
                  top: 145px;
                }
              }

              .right_small {
                width: 2.7rem;
                left: 26.5%;
                top: 54.2%;
              }

              @keyframes showRightBounce {
                0% {
                  top: 190px;
                }
                50% {
                  top: 185px;
                }
                100% {
                  top: 190px;
                }
              }
  
              .big_bounce {
                width: 6.1rem;
                left: 56.4%;
                top: 31%;
              }
  
              @keyframes showBigBounce {
                0% {
                  top: 114px;
                }
                50% {
                  top: 108px;
                }
                100% {
                  top: 114px;
                }
              }
            }

            @media screen and (max-width: 320px) {
                  .left_small {
                width: 2.1rem;
                left: 9.3%;
                top: 42%;
              }
  
              @keyframes showLeftBounce {
                0% {
                  top: 130px;
                }
                50% {
                  top: 125px;
                }
                100% {
                  top: 130px;
                }
              }

              .right_small {
                width: 2.1rem;
                left: 26.9%;
                top: 54.2%;
              }

              @keyframes showRightBounce {
                0% {
                  top: 167px;
                }
                50% {
                  top: 163px;
                }
                100% {
                  top: 167px;
                }
              }
  
              .big_bounce {
                width: 4.5rem;
                left: 58.3%;
                top: 35%;
              }
  
              @keyframes showBigBounce {
                0% {
                  top: 104px;
                }
                50% {
                  top: 100px;
                }
                100% {
                  top: 104px;
                }
              }
            }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="sub_content">
        <div class="sub_layout">
          <div id="content">

               <div class="logic">
                  <div class="logic_top">
                    <div class="logic_top_title">
                      <span>스마트 물류 플랫폼</span>
                    </div>
  
                    <div class="logic_sub_title">
                      <span>티투엘의 물류 솔루션, 그 중심에</span>
                    </div>
  
                    <div class="logic_bottom_title">
                      <p>국내 정보산업의 발전을 위하여 우수한 국내의 솔루션들을 발굴하여 조화롭게 융화시킨 시스템 개발에 역점을 둘 것입니다.<br>
                        산업분야별 프로토타입 개발과 이를 기반으로 한 시스템 구축 사업에 모든 역량을 쏟을 것입니다.</p>
                    </div>
                  </div>
  
                  <div class="logic_content">
                    <div class="logic_content_wrap">
                      <div class="logic_content_wrap_inner"> <!--이미지 기준점-->
                        <div class="ground_img">
                          <img src="/Source/Client/img/Rojistics_background.png" alt="">

                            <a href="https://www.shippinggate.com/" target="_blank"><div class="bg_link"></div></a>
                        </div>

                        <div class="left_small">
                          <img src="/Source/Client/img/left_small.png" alt="">
                        </div>
                        <div class="right_small">
                          <img src="/Source/Client/img/right_small.png" alt="">
                        </div>
                        <div class="big_bounce">
                          <img src="/Source/Client/img/big_bounce.png" alt="">
                        </div>
                        <div class="top_ch">
                          <img src="/Source/Client/img/top_ch.png" alt="">
                        </div>

                      
                      </div>
                    </div>
                  </div>

                  <div class="logic_bottom_txt">
                    <div class="logic_bottom_txt_wrap">

                      <div class="wrap_txt">
                        <div class="wrap_txt_title">
                          <div class="wrap_txt_main_title">
                            <span>Basic Service</span>
                          </div>
                          <div class="wrap_txt_main_title_content">
                            <ul>
                              <li>견적요청</li>
                              <li>운임조회</li>
                              <li>C/O, BK, T/0</li>
                              <li>중장기 입찰 서비스</li>
                              <li>구인 구직 서비스</li>
                              <li>Visibility</li>
                              <li>스케줄 조회</li>
                              <li>공지사항</li>
                              <li>물류컨설팅</li>
                              <li>Helpdesk</li>
                              <li>컨테이너 운임 조회</li>
                            </ul>
                          </div>
                        </div>
                      </div>

                      <div class="wrap_txt">
                        <div class="wrap_txt_title">
                          <div class="wrap_txt_main_title">
                            <span>Common Services</span><br>
                            <p>
                              integrated<br>
                              Management<br>
                              Services
                            </p>
                          </div>
                          <div class="wrap_txt_main_title_content">
                            <ul>
                              <li>항공 수출 관리</li>
                              <li>항공 수입 관리</li>
                              <li>창고 관리</li>
                              <li>해상 수출 관리</li>
                              <li>해상 수입 관리</li>
                              <li>운송 관리</li>
                              <li>철송 관리</li>
                              <li>특송 관리</li>
                   
                            </ul>
                          </div>
                        </div>
                      </div>

                      <div class="wrap_txt">
                        <div class="wrap_txt_title">
                          <div class="wrap_txt_main_title">
                            <span>국내 주요 VAN 연게</span>
                          </div>
                            <div class="wrap_txt_main_title_content">
                                <div class="title_content_img">
                                    <img src="/Source/Client/img/content_img_one.jpg" alt="Alternate Text" />
                                </div>
                            
                                 <div class="title_content_img">
                                    <img src="/Source/Client/img/content_img_three.jpg" alt="Alternate Text" />
                                </div>
                                 <div class="title_content_img">
                                    <img src="/Source/Client/img/content_img_four.png" alt="Alternate Text" />
                                </div>
                                 <div class="title_content_img">
                                    <img src="/Source/Client/img/content_img_five.jpg" alt="Alternate Text" />
                                </div>
                                 <div class="title_content_img">
                                    <img src="/Source/Client/img/content_img_six.png" alt="Alternate Text" />
                                </div>
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
