<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_COMPANY_WORK.aspx.cs" Inherits="T2LHomePage.Source.Client.Company.C_COMPANY_WORK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Work_title_inner {
  text-align: center;
}


.center_line {
  width: 15rem;
  height: 1px;
  background: #cacaac;
  margin: 0 auto;
}

.txt_Top_wrap {
  animation: showTopText 1.5s;
}


.Work_title_inner_first_txt {
  box-sizing: border-box;
  padding: 2rem 0;
  font-size: 32px;
  font-weight: 700;
  transition: all 0.3s ease-in-out;
}

.txt_Down_wrap {
  animation: showDownText 1.5s;
}

.Work_title_inner_second_txt {
  box-sizing: border-box;
  padding: 3rem 0 2rem 0;
  transition: all 0.6s ease-in-out;
  font-size: 16px;
  color: #5c5757;
}

.Work_title_inner_second_txt {
  box-sizing: border-box;
}


.bottom_content_inner {
  display: flex;
}

@keyframes showTopText {
  0% {
    transform: translate3d(0, 100%, 0);
  }
  100% {
    transform: translate3d(0, 0, 0);
  }
}

.work {
}

.bottom_content_section {
  position: relative;
  box-sizing: border-box;
  padding: 2rem;
  height: 600px;
}

.bottom_content_section > img {
  width: 100%;
  height: 100%;
}

.section_title {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.section_title > p {
  text-align: center;
  font-size: 20px;
  font-weight: 700;
  color: #fff;
}

.sub_main_title {
  font-weight: 700;
  font-size: 20px;
}

.txt {
  padding-top: 1rem;
  line-height: 1.5rem;
}

.section_sub_first_title {
  box-sizing: border-box;
  text-align: center;
  padding:0.7rem 1.8rem;

}

@media screen and (max-width:1024px) {
  .bottom_content_section {
    height: 550px;
  }
}

@media screen and (max-width:768px) {
  .bottom_content_inner {
    display: block;
  }
}

@media screen and (max-width:425px) {
  .bottom_content_section {
    height: 500px;
  }
  .Work_title_inner_first_txt {
    font-size: 24px;
  }
}

@media screen and (max-width:425px) {
  .bottom_content_section {
    padding: 2rem 0;
  }
}

@media screen and (max-width:320px) {
  .bottom_content_section {
    height: 450px;
  }
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sub_content">
        <div class="sub_layout">
          <div id="content">
                      <div class="Work_title">
          <div class="Work_title_inner">
            <div class="txt_Top_wrap">
              <p class="Work_title_inner_first_txt">
                티투엘은 물류/여행/유통 시스템과 연동되는<br> 소프트웨어를 개발하고 운영 지원하고 있습니다.
              </p>
              <p class="Work_title_inner_second_txt">
                정부와 대기업과는 시스템통합(SI) 사업을 통한 주문개발 방식과 클라이언트의 요구 사항을 정확히 분석한 <br>
                T2L만의 차별화된 프로그램을 개발해 판매/공급하고 있습니다.
              </p>
            </div>
          
            <div class="center_line"></div>

            <div class="txt_Top_wrap">
              <p class="Work_title_inner_second_txt">
                2020년 출시된 T2L투어솔루션은 한국관광공사 바우처 및 DT(Digital Transformation) 사업 지원 업체로 선정되어 <br>
                여행시스템을 전문적으로 제작해 운영하고 있습니다.
              </p>

            </div>
            
          </div>
        </div>

        <div class="bottom_content">
          <div class="bottom_content_wrap">
            <div class="bottom_content_inner">

              <div class="work">
                <div class="bottom_content_section">
                  <img src="/Source/Client/img/Smart_logist_background.jpg" alt="">
                  <div class="section_title">
                    <p>
                      Smart<br>
                      Logistics Platform
                    </p>
                  </div>
                </div>
  
                <div class="section_sub_first_title">
                  <p class="sub_main_title">T2L의 물류 사업</p>
                  <p class="txt common-font">
                    2001년부터 22년간 컨테이너와 벌크선사, 선사 대리점, 포워더, 2.3자 물류, 창고, 항공 터미널, 컨테이너야드·운송·철송장, 벌크 운송 등의 다양한 분야의 개발 경험이 있습니다.
                  </p>
                </div>
              </div>

              <div class="work">
                <div class="bottom_content_section">
                  <img src="/Source/Client/img/Smart_Shopping_background.jpg" alt="">
                  <div class="section_title">
                    <p>
                      Smart<br>
                      Travel Platform
                    </p>
                  </div>
                </div>
  
                <div class="section_sub_first_title">
                  <p class="sub_main_title">자체 개발한 투어 솔루션</p>
                  <p class="txt common-font">
                    국내/외 여행 전문업체 솔루션 개발과 종합 여행플랫폼 개발 사업을 하고 있고, 2023년 지금까지 경험하지 못한 혁신적인 신규 여행플랫폼을 운영, 출시할 예정입니다.
                  </p>
                </div>
              </div>
              

              <div class="work">
                <div class="bottom_content_section">
                  <img src="/Source/Client/img/test_green.jpg" alt="">
                  <div class="section_title">
                    <p>
                      Smart<br>
                      Shopping mall Platform
                    </p>
                  </div>
                </div>
  
                <div class="section_sub_first_title">
                  <p class="sub_main_title">유통(쇼핑몰)사업</p>
                  <p class="txt common-font">
                    물류사업과 연계해 B2C 화주들의 영업, 구매를 온라인 비즈니스를 통해 할 수 있도록 온라인 쇼핑몰 구축과 물류(재고, 입출고 오더, 운송 오더) 등을 일체형으로 제공하는 사업입니다.
                  </p>
                </div>
              </div>

            </div>
          </div>
        </div>
              
            </div>
        </div>
    </div>
</asp:Content>
