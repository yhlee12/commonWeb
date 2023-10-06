<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_COMPANY_TOURPATEFORM.aspx.cs" Inherits="T2LHomePage.Source.Client.Company.C_COMPANY_TOURPATEFORM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
.tour_layout_wrap_inner {
  display: flex;
}

.tour_layout_wrap_inner_left {
  width: 50%;
  box-sizing: border-box;
  padding-right: 3rem;
}

.left_top_title > span {
  font-size: 32px;
  font-weight: bold;
}

.left_sub_itle {  
  padding: 1rem 0 3rem 0;
}

.left_sub_itle > span {
  font-size: 22px;
  color: #636262;
}

.tour_content,
.tour_content_two,
.tour_content_three {
    animation-delay: 2s;
}

.tour_content_title > span {
  font-size: 22px;
  color: rgb(240, 57, 57);
}

.tour_content_sub_title > span {
  font-size: 16px;
  color: #777474;
}

.tour_content_title {
  padding-bottom: 0.5rem;
}

.tour_content_main_txt {
  padding: 2rem 0;
}

.tour_content_main_txt > p { 
  font-size: 16px;
  color: #777474;
}

.tour_link {
  margin-bottom: 3rem;
}

.link_wrap {
  width: 13rem;
  box-sizing: border-box;
  padding: 1.3rem 3rem;
  border: 1px solid #cacaca;
  border-radius: 30px;
}

.link_wrap > a {
  display:flex;
}

.link_wrap > a > span {
  display: block;
  font-size: 16px;
}

.icon {
    position:relative;
    top: 50%;
    left:50%;
    transform: translate(-50%, 0%);
}

.tour_layout_wrap_inner_right {
  width: 50%;
}

.tour_right_img {
  position: relative;
  box-sizing: border-box;
  padding: 2rem;
  animation: showRight 2.5s infinite linear;
}

@keyframes showRight {
  0% {
    top: 0px;
  }
  50% {
    top: 20px;
  }
  100% {
    top: 0px;
  }
}

.slide_navbar {
  display: flex;
  overflow: hidden;
}

.slide_navbar_inner {
  width: 33.3333%;
}

.slide_navbar_inner_wrap_txt {
  box-sizing: border-box;
  padding: 1rem 3rem;
  text-align: center;
}

.slide_navbar_inner_wrap,
.slide_navbar_inner_wrap_two,
.slide_navbar_inner_wrap_three {
    border-top: 2px solid #cacaca;

}

.slid_click {
  border-color: red;
}

.slide_navbar_inner_wrap_txt > span {
  font-size: 16px;
}

#content {
  display: flex;
  width: 100%;
  overflow: hidden;
}

.tour_content_two, .tour_content_three {
  display: none;
}

.content_grid {
    display: grid;
    grid-template-columns: repeat(2,1fr);
    gap: 2rem;
}

@media screen and (max-width: 1024px) {
    
  #content {
      display:block;
  }
  .tour_layout_wrap_inner {
    display: block;
  }
  .tour_layout_wrap_inner_left {
    width: 100%;
    padding: 0;
  }
  .tour_layout_wrap_inner_right {
    width: 100%;
  }
  .tour_right_img {
    position: relative;
    top: 0;
    left: 0;
    transform: translate(18%,11%);
    width: 70%;
    box-sizing: border-box;
    padding: 2rem 0;
  }
}

@media screen and (max-width: 768px) {
    .content_grid {       
        grid-template-columns: repeat(1,1fr);
    }
}

@media screen and (max-width: 425px) {
  .left_top_title,
  .left_sub_itle,
  .tour_content_title,
  .tour_content_sub_title,
  .tour_content_main_txt{
    text-align: center;
  }

  .link_wrap {
    margin: 0 auto;
    width: 12rem;
    padding: 0.8rem 3rem;
  }

  .slide_navbar_inner_wrap_txt {
      padding: 1rem 0;
  }

  .tour_right_img {
    width: 87%;
    transform: translate(7%,6%);
    
  }
 
}
        
    </style>

    <script>
        $(document).ready(function () {
           
            $('#slid1').click(function () {
                $('div.tour_content').css("display", "block");
                $('div.slide_navbar_inner_wrap').addClass('slid_click');
                $('div.tour_content_two').css("display", "none");
                $('div.slide_navbar_inner_wrap_two').removeClass('slid_click');
                $('div.tour_content_three').css("display", "none");
                $('div.slide_navbar_inner_wrap_three').removeClass('slid_click');
            });

            $('#slid2').click(function () {
                $('div.tour_content').css("display", "none");
                $('div.slide_navbar_inner_wrap').removeClass('slid_click');
                $('div.tour_content_two').css("display", "block");
                $('div.slide_navbar_inner_wrap_two').addClass('slid_click');
                $('div.tour_content_three').css("display", "none");
                $('div.slide_navbar_inner_wrap_three').removeClass('slid_click');
            });

            $('#slid3').click(function () {
                $('div.tour_content').css("display", "none");
                $('div.slide_navbar_inner_wrap').removeClass('slid_click');
                $('div.tour_content_two').css("display", "none");
                $('div.slide_navbar_inner_wrap_two').removeClass('slid_click');
                $('div.tour_content_three').css("display", "block");
                $('div.slide_navbar_inner_wrap_three').addClass('slid_click');
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sub_content">
        <div class="sub_layout">
          <div id="content">

              <div class="tour_layout">
                  <div class="tour_layout_wrap">
                    <div class="tour_layout_wrap_inner">

                      <div class="tour_layout_wrap_inner_left">
                        <div class="tour_left">

                          <div class="title_wrap">
                            <div class="left_top_title">
                              <span>TOUR SOLUTION</span>
                            </div>
                            <div class="left_sub_itle">
                              <span>여행사를 위한 통합 프로그램</span>
                            </div>
                          </div>
                        </div>

                        <div id="content">
                          <div class="tour_content">
                            <div class="tour_content_title">
                              <span>기본형 솔루션</span>
                            </div>
                            <div class="tour_content_sub_title">
                              <span>여행사 운영의 모든것을 담았습니다.</span>
                            </div>
                            <div class="tour_content_main_txt">
                              <p>
                                여행사 운영 30년 이상의 배테랑 운영자와 우수한 개발자들이 만든 여행사 최고의 솔루션!<br>
                                단순한 홈페이지가 아닌 성공의 지름길을 드립니다.
                              </p>
                            </div>
  
                          </div>
  
                          <div class="tour_content_two">
                            <div class="tour_content_title">
                              <span>종합형 솔루션</span>
                            </div>
                            <div class="tour_content_sub_title">
                              <span>여행사 운영의 모든것을 담았습니다.</span>
                            </div>
                            <div class="tour_content_main_txt">
                              <p>
                                보다 효율적이고 종합적인 기능을 활용하여 체계적인 여행사 관리를 할 수 있습니다.<br>
                              </p>
                            </div>
  
                          </div>
  
                          <div class="tour_content_three">
                            <div class="tour_content_title">
                              <span>주문형 솔루션</span>
                            </div>
                            <div class="tour_content_sub_title">
                              <span>여행사 운영의 모든것을 담았습니다.</span>
                            </div>
                            <div class="tour_content_main_txt">
                              <p>
                                자유로운 형식의 디자인과 특별한 기능이 필요하시면 주문형으로 제작하시면 됩니다.<br>
                                창의적인 생각, 철저한 업무분석과 정확한 컨셉을 찾아 여행사에 꼭 맞는 홈페이지를 만들어 드립니다.<br>    
                              </p>
                            </div>
  
                          </div>
                        </div>
                

                        <div class="tour_link">
                          <div class="link_wrap">
                            <a href="http://www.toursolution.co.kr/"> <!--투어 솔루션 홈페이지 링크-->
                              <span>자세히 보기</span>
                              <span class="material-icons icon">navigate_next</span>
                            </a>         
                          </div>
                        </div>

                        <div class="slide_navbar">
                          <div id="slid1" class="slide_navbar_inner" >
                            <div class="slide_navbar_inner_wrap slid_click">
                              <div class="slide_navbar_inner_wrap_txt">
                                <span>기본형</span>
                              </div>
                            </div>
                          </div>
                          <div id="slid2" class="slide_navbar_inner" >
                            <div class="slide_navbar_inner_wrap_two">
                              <div class="slide_navbar_inner_wrap_txt">
                                <span>종합형</span>
                              </div>
                            </div>
                          </div>
                          <div id="slid3" class="slide_navbar_inner">
                            <div class="slide_navbar_inner_wrap_three">
                              <div class="slide_navbar_inner_wrap_txt">
                                <span>주문형</span>
                              </div>
                            </div>
                          </div>
                        </div>                
                      </div>

                      <div class="tour_layout_wrap_inner_right">
                        <div class="tour_right">
                          <div class="tour_right_img">
                            <img src="/Source/Client/img/tour_right_img.png" alt="">
                          </div>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
             
            </div>

            <%--스마트 여행 플랫폼 소개 --%>
              <div class="tour_grid">
                  <div class="tour_grid_wrap">
                      <div class="tour_grid_wrap_inner">
                          <div class="content_grid">
                              <div class="grid_img">
                                  <img src="/Source/Client/img/T2l_tour_one.jpg" alt="tour_img" />
                              </div>
                              <div class="grid_img">
                                  <img src="/Source/Client/img/T2l_tour_two.jpg" alt="tour_img" />
                              </div>
                              <div class="grid_img">
                                  <img src="/Source/Client/img/T2l_tour_three.jpg" alt="tour_img" />
                              </div>
                              <div class="grid_img">
                                  <img src="/Source/Client/img/T2l_tour_four.jpg" alt="tour_img" />
                              </div>
                              <div class="grid_img">
                                  <img src="/Source/Client/img/T2l_tour_five.jpg" alt="tour_img" />
                              </div>
                              <div class="grid_img">
                                  <img src="/Source/Client/img/T2l_tour_six.jpg" alt="tour_img" />
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
        </div>
    </div>
</asp:Content>
