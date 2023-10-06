<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="T2LHomePage.Source.Client.main" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="preload" as="style" href="/Source/common/common.css?ver=<%=DateTime.Now.ToString("yyyyMMddHHmmss") %>"/>
    <link rel="preload" as="style" href="/Source/common/font.css?ver=202302012"/>
    <link rel="stylesheet" href="/Source/common/common.css?ver=<%=DateTime.Now.ToString("yyyyMMddHHmmss") %>"/>
    <link rel="stylesheet" href="/Source/common/font.css?ver=202302012"/>
    <script type="text/javascript" src="/js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="/js/jquery.ui.datepicker-ko.js"></script>
    <script type="text/javascript" src="/js/Logout.js"></script>
    <meta  property="og:title" content="티투엘::T2L,TradeToLogistics"/>
    <meta  property="og:type" content="website"/>
    <meta  property="og:url" content="http://t2l.co.kr"/>
    <meta  property="og:image" content="http://t2l.co.kr/image/t2l_logo1.png"/>
    <script src="/Source/Client/dist/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="/Source/Client/dist/jquery.bxslider1.css"/>
    <link rel="stylesheet" href="/Source/Client/dist/jquery.bxslider2.css"/>
    <link rel="stylesheet" href="/Source/Client/dist/jquery.bxslider3.css"/>
    <link rel="stylesheet" type="text/css" href="/Source/Client/css/accordion-slider.min.css"/>
    <script type="text/javascript" src="/Source/Client/js/jquery.accordionSlider.js"></script>
    <link rel="stylesheet" href="/Source/Client/css/basic.css"/>
    <link rel="stylesheet" href="/Source/Client/css/scrolling-menu.css"/>
    <link rel="stylesheet" href="/Source/Client/css/main.css"/>
    <link rel="stylesheet" href="/Source/Client/css/main-re.css"/>
    <title>T2L::Trade To Logistics</title>
    <script src="/Source/Client/js/ScrollTrigger.min.js" defer="defer"></script>
    <script src="/Source/Client/js/gsap.min.js" defer="defer"></script>
    <script src="/Source/Client/js/jquery.serialscrolling.js" defer="defer"></script>
    <script>
        $(document).ready(function () {
            // jquery.serialscrolling initialisation
            $('[data-serialscrolling]').serialscrolling();
        });
    </script>
    <script>
        $(document).ready(function () {
            //Main slide
            $(".mslide1").bxSlider({
                auto: true,
                speed: 300,
                pause: 2500
            })

            $(".mslide2").bxSlider({
                auto: false,
                pause: 2000,
                speed: 300,
                autoControls: false,
                minSlides: 1,
                maxSlides: 3,
                slideWidth: 400,
                moveSlides: 1,
                slideMargin: 50,
                swipeThreshold: 0,
            })

            $(".mslide3").bxSlider({
                auto: true,
                pause: 2000,
                speed: 300,
                autoControls: true,
                minSlides: 1,
                maxSlides: 6,
                slideWidth: 500,
                moveSlides: 1,
                slideMargin: 60,
            })

            //popup
            $("#close").click(function () {
                $(".popup_overlay").css("display", "none");
                $(".main_popup").css("display", "none");
            });
            //popup2
            $("#close2").click(function () {
                $(".popup_overlay").css("display", "none");
                $(".main_popup2").css("display", "none");
            });

            //Main hover
            $('.menu100').hover(function () {
                $('.sub_menu100').stop(true).slideDown('normal');
            }, function () {
                $('.sub_menu100').stop(true).slideUp('normal');
            })

            $('.menu200').hover(function () {
                $('.sub_menu200').stop(true).slideDown('normal');
            }, function () {
                $('.sub_menu200').stop(true).slideUp('normal');
            })

            $('.menu300').hover(function () {
                $('.sub_menu300').stop(true).slideDown('normal');
            }, function () {
                $('.sub_menu300').stop(true).slideUp('normal');
            })

            $('.sub_menu').hover(function () {
                $(this).stop(true).slideDown('normal');
            }, function () {
                $(this).stop(true).slideUp('normal');
            })
            //hamberger btn
             $('.gnb_btn').on('click', function () {
                 $('.gnb_blind').css({ display: 'block' });
                 $('#gnb').animate({ right: '0' });
                 $('body').addClass('scrollLock')
             })
             $('.gnb_close').on('click', function () {
                $('#gnb').animate({ right: '-500px' });
                $('.gnb_blind').css({ display: 'none' });
                $('body').removeClass('scrollLock')
            })
             $('.gnb_menu100').click(function () {
                 $('.gnb_sub_menu100').slideToggle('normal');
                 $('.gnb_sub_menu200').slideUp('normal');
                 $('.gnb_sub_menu300').slideUp('normal');
             });
             $('.gnb_menu200').click(function () {
                 $('.gnb_sub_menu200').slideToggle('normal');
                 $('.gnb_sub_menu100').slideUp('normal');
                 $('.gnb_sub_menu300').slideUp('normal');
             });
             $('.gnb_menu300').click(function () {
                 $('.gnb_sub_menu300').slideToggle('normal');
                 $('.gnb_sub_menu100').slideUp('normal');
                 $('.gnb_sub_menu200').slideUp('normal');
             });
             $('.gnb_menu04').click(function () {
                 $('.gnb_sub_menu100').slideUp('normal');
                 $('.gnb_sub_menu200').slideUp('normal');
                 $('.gnb_sub_menu300').slideUp('normal');
             });

             gsap.registerPlugin(ScrollTrigger);
             gsap.to(".info-con1", {
                 scrollTrigger: {
                     trigger: ".info-box",
                     markers: true,
                     start: "top center",
                     scrub: true,

                 },
                 width: '100%', duration: 10,
             });
             gsap.to(".info-con1-box", {
                 scrollTrigger: {
                     trigger: ".info-box",
                     markers: true,
                     start: "center center",
                     scrub: true,
                     pin: true,
                 },
                 y: '-1200', duration: 10,
             });
     });
</script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        // instantiate the accordion
        $('#example1').accordionSlider({
            width: 1490,
            height: 564,
            responsiveMode: 'auto',
            visiblePanels: 6,
            startPanel: 0,
            closePanelsOnMouseOut: false,
            autoplay: true,
            mouseWheel: false,
            breakpoints: {
                1280: { visiblePanels: 3, width: '100%', height: 564 },
                990: { visiblePanels: 1, width: '100%', height: 564 },
                768: { visiblePanels: 1, width: '100%', height: 450 }
            }
        });
    });
</script>
<script>
    
</script>
</head>
<body>
    <div id="wrap">
        <div class="popup_overlay"></div>
        <div class="main_popup">
            <div class="main_popup_img">
                <img src="/Source/Client/img/t2l_main_popup.jpg" alt="main_popup" />
                <div class="popup_close" id="close">
                    <span class="material-icons">close</span>
                </div>
            </div>
        </div>

        <div class="main_popup2">
            <div class="main_popup_img">
                <img src="/Source/Client/img/t2l_soul.png" alt="main_popup" />
                <div class="popup_close" id="close2">
                    <span class="material-icons">close</span>
                </div>
            </div>
        </div>
      
      <header>
        <div class="align">
          <div class="header">
            <div id="logo">
              <h1><a href="#">T2l</a></h1>
            </div>

            <nav>
              <ul id="nav">
                  <%foreach(var item in MenuList){ %>
                    <li class="menu"><a href="<%=item.Value.subMenu != null ? "#" :item.Value.path+".aspx" %>" class="menu<%=item.Value.key %>"><%=item.Value.title %></a>
                        <%if(item.Value.subMenu != null && item.Value.subMenu.Count > 0){ %>
                            <ul class="sub_menu sub_menu<%=item.Value.key %>">
                                <%foreach(var subitem in item.Value.subMenu){ %>
                                <li><a href="<%=subitem.otherFlag == false ? subitem.path : subitem.path+".aspx" %>" <%=subitem.otherFlag == false ? "target=\"_blank\"" : "" %>><%=subitem.title %></a></li>
                                <%} %>
                            </ul>
                        <%} %>
                    </li>
                  <%} %>
       
              </ul>
            </nav>

            <div class="gnb_btn">
              <button>메뉴열기</button>
            </div>
          </div>
        </div>
        
      </header>
      <div class="gnb_blind">
        <ul id="gnb">
          <button class="gnb_close">메뉴닫기</button>
            <%foreach(var item in MenuList){ %>
                <li class="gnb_menu"><a href="<%=item.Value.subMenu != null ? "#" :item.Value.path+".aspx" %>" class="gnb_menu<%=item.Value.key %>"><%=item.Value.title %></a>
                    <%if(item.Value.subMenu != null && item.Value.subMenu.Count > 0){ %>
                    <ul class="gnb_sub_menu gnb_sub_menu<%=item.Value.key %>">
                        <%foreach(var subitem in item.Value.subMenu){ %>
                            <li><a href="<%=subitem.otherFlag == false ? subitem.path : subitem.path+".aspx" %>" <%=subitem.otherFlag == false ? "target=\"_blank\"" : "" %>><%=subitem.title %></a></li>
                            <%--<li><a href="<%=subitem.path %>.aspx"><%=subitem.title %></a></li>--%>
                        <%} %>
                    </ul>
                    <%} %>
                </li>
            <%} %>
        </ul>
      </div>
      <!-- <ul id="nav-serialscrolling">
        <li><span class="sub-link" data-serialscrolling="main">MAIN</span></li>
        <li><span class="sub-link" data-serialscrolling="company">COMPANY</span></li>
        <li><span class="sub-link" data-serialscrolling="business">BUSINESS</span></li>
        <li><span class="sub-link" data-serialscrolling="support">SUPPORT</span></li>
        <li><span class="sub-link" data-serialscrolling="information">INFORMATION</span></li>
      </ul> -->

      <div data-serialscrolling-target="main" id="main">
        <%--<div class="main_popup">
            <div class="main_popup_img">
                <img src="/Source/Client/img/t2l_main_popup.jpg" alt="main_popup" />
                <div class="popup_close" id="close">
                    <span class="material-icons">close</span>
                </div>
            </div>
        </div>--%>

        <ul class="mslide1">
          <li>         
            <video src="/Source/Client/video/main-1.mp4" autoplay loop muted></video>
          </li>
          <li><img src="/Source/Client/img/visual_02.jpg" alt="메인이미지2"></li>
          <li><img src="/Source/Client/img/visual_01.jpg" alt="메인이미지1"></li>
          <li><img src="/Source/Client/img/visual_04.jpg" alt="메인이미지2"></li>
        </ul>
   
          <div class="mtitle">
              <p>우리의 기술로 세계로<br>우리 함께</p>
              <p>IT서비스를 선도하는 프론티어</p>
          </div>
  
        <div class="main-box">
          <ul>
            <li>
              <a href="/Source/Client/Company/C_COMPANY_LOGISPATEFORM.aspx" class="bg-blur">
                <h3>스마트물류플랫폼</h3>
                <p>티투엘은 해운 물류 IT서비스를 통합한 플랫폼을 공급하여 스마트물류플랫폼 시대를 선도합니다.</p>
                <span>자세히보기</span>
              </a>
            </li>
            <li>
              <a href="/Source/Client/Company/C_COMPANY_TOURPATEFORM.aspx" class="bg-blur">
                <h3>스마트여행플랫폼</h3>
                <p>인바운드 아웃바운드 전체를 아우르는 스마트여행플랫폼 시대를 선도합니다.</p>
                <span>자세히보기</span>
              </a>
            </li>
            <li>
              <a href="/Source/Client/Company/C_COMPANY_SHOPPING.aspx" class="bg-blur">
                <h3>스마트쇼핑몰플랫폼</h3>
                <p>성장과 나눔의 균형을 통해 글로벌
                  기업의 역할을 다하겠습니다.</p>
                <span>자세히보기</span>
              </a>
            </li>
            <li>
              <a href="/Source/Client/CS/C_CS_CONSTRACT.aspx">
                <h3>문의하기</h3>
                <p>티투엘은 고객에게 필요한 문의를 신속하게 답변하기 위해 최선을 다하고 있습니다.</p>
                <span>자세히보기</span>
              </a>
            </li>
          </ul>
        </div>

      </div>

  


  <div data-serialscrolling-target="company" id="company">
    <div class="align">
      <div class="com-title eng-font">
        <h5>Logistics News</h5>
        <h2>함께 보는<br> 최신 물류</h2>
        <a href="#" class="goto-btn">스마트 매거진</a>
        <div class="com-blind"></div>
      </div>
      <ul class="mslide2">
        <li class="mslide2-6">
          <div class="mslide2-text">
            <h3>해운 물류</h3>
            <p>대한민국 해운물류 정보를 받아볼 수 있는 기회</p>
          </div>
          <img src="/Source/Client/img/List_02.jpg" alt="슬라이드이미지">
        </li>
        <li class="mslide2-1">
          <img src="/Source/Client/img/List_01.jpg" alt="슬라이드이미지">
          <div class="mslide2-text">
            <h3>Hi, Tra-Lo</h3>
            <p>최신 물류정보를<br>스마트 매거진으로 만나보세요</p>
          </div>
        </li>
        <li class="mslide2-2">
          <div class="mslide2-text">
            <h3>해운 물류</h3>
            <p>대한민국 해운물류 정보를 받아볼 수 있는 기회</p>
          </div>
          <img src="/Source/Client/img/List_04.jpg" alt="슬라이드이미지">     
        </li>
        <li class="mslide2-3">
          <img src="/Source/Client/img/List_03.jpg" alt="슬라이드이미지">
          <div class="mslide2-text">
            <h3>Hi, Tra-Lo</h3>
            <p>최신 물류정보를<br>스마트 매거진으로 만나보세요</p>
          </div>
        </li>
        <li class="mslide2-4">
          <div class="mslide2-text">
            <h3>해운 물류</h3>
            <p>대한민국 해운물류 정보를 받아볼 수 있는 기회</p>
          </div>
          <img src="/Source/Client/img/List_02.jpg" alt="슬라이드이미지">
        </li>
        <li class="mslide2-5">
          <img src="/Source/Client/img/List_01.jpg" alt="슬라이드이미지">
          <div class="mslide2-text">
            <h3>Hi, Tra-Lo</h3>
            <p>최신 물류정보를<br>스마트 매거진으로 만나보세요</p>
          </div>
        </li>        
      </ul>
    </div>
  </div>

  <div data-serialscrolling-target="business" id="business">
    
    <div id="example1" class="accordion-slider">
      <h5 class="eng-font">Business</h5>
      <h2 class="eng-font">What we do</h2>
      <div class="as-panels">
  
        <!-- Panel 1 -->
        <div class="as-panel">
  
            <img class="as-background" src="/Source/Client/img/accordion_three_gray.jpg" data-retina="/Source/Client/img/accordion_three_gray.jpg"/>
  
          <a href="#">
            <img class="as-background-opened" src="/Source/Client/img/accordion_three.jpg" data-retina="/Source/Client/img/accordion_three.jpg"/>
          </a>
          
          <div class="as-layer as-closed as-black as-vertical panel-counter re-none eng-font" 
             data-position="topLeft" data-horizontal="70" data-vertical="0" data-show-delay="300">
              <b>SOFTWARE</b> DEVELOPMENT
          </div>
  
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="10%" 
            data-show-transition="left" data-show-delay="300" data-hide-transition="right" data-hide-delay="100">
            개발
          </p>
          <h3 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="14%" data-width=""
            data-show-transition="left" data-show-delay="400" data-hide-transition="right" data-hide-delay="100">
            소프트웨어
          </h3>
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="30%" data-width="" 
            data-show-transition="left" data-show-delay="500" data-hide-transition="right" data-hide-delay="100">
            물류/여행/유통 시스템과 연동되는 소프트웨어를 개발하고 운영 지원하고 있습니다.
          </p>
          <h6 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="50%" data-width="250" 
            data-show-transition="left" data-show-delay="700" data-hide-transition="right" data-hide-delay="100">
            <!--<div class="as-text">
              VIEW DETAIL <span></span>
             </div>-->
          </h6>
        </div>
  
        <!-- Panel 2 -->
        <div class="as-panel">
          <img class="as-background" src="/Source/Client/img/accordion_one_gray.jpg" data-retina="/Source/Client/img/accordion_one_gray.jpg"/>
  
          <a href="#">
            <img class="as-background-opened" src="/Source/Client/img/accordion_one.jpg" data-retina="/Source/Client/img/accordion_one.jpg"/>
          </a>
  
          <div class="as-layer as-closed as-black as-vertical panel-counter re-none eng-font"
             data-position="topLeft" data-horizontal="70" data-vertical="0" data-show-delay="300">
             <b>SI</b>DEVELOPMENT
          </div>
  
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="10%" 
            data-show-transition="left" data-show-delay="300" data-hide-transition="right" data-hide-delay="100">
            개발
          </p>
          <h3 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="14%" data-width=""
            data-show-transition="left" data-show-delay="400" data-hide-transition="right" data-hide-delay="100">
            시스템통합 SI 
          </h3>
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="30%" data-width="" 
            data-show-transition="left" data-show-delay="500" data-hide-transition="right" data-hide-delay="100">
           정부와 대기업과는 시스템통합(SI) 사업을 통한 주문개발 방식과 클라이언트의 요구 사항을 정확히 분석한 T2L만의 차별화된 프로그램을 개발해 판매/공급하고 있습니다.
          </p>
          <h6 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="50%" data-width="250" 
            data-show-transition="left" data-show-delay="700" data-hide-transition="right" data-hide-delay="100">
            <!--<div class="as-text">
              VIEW DETAIL <span></span>
             </div>-->
          </6>
        </div>
        
  
        <!-- Panel 3 -->
        <div class="as-panel">
          <img class="as-background" src="/Source/Client/img/accordion_five_gray.jpg" data-retina="/Source/Client/img/accordion_five_gray.jpg">
  
          <a href="#">
            <img class="as-background-opened" src="/Source/Client/img/accordion_five.jpg" data-retina="/Source/Client/img/accordion_five.jpg"/>
          </a>
          <div class="as-layer as-closed as-black as-vertical panel-counter re-none eng-font"
             data-position="topLeft" data-horizontal="70" data-vertical="0" data-show-delay="300">
             <b>바우처 및</b> DT사업
          </div>
  
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="10%" 
            data-show-transition="left" data-show-delay="300" data-hide-transition="right" data-hide-delay="100">
            투어솔루션
          </p>
          <h3 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="14%" data-width="280"
            data-show-transition="left" data-show-delay="400" data-hide-transition="right" data-hide-delay="100">
            바우처 및 DT 사업
          </h3>
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="30%" data-width="" 
            data-show-transition="left" data-show-delay="500" data-hide-transition="right" data-hide-delay="100">
            2020년 출시된 투어솔루션은 한국관광공사 바우처 및 DT(Digital Transformation) 사업 지원 업체로 선정되어 여행시스템을 전문적으로 제작해 운영하고 있습니다.
          </p>
          <h6 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="50%" data-width="250" 
            data-show-transition="left" data-show-delay="700" data-hide-transition="right" data-hide-delay="100">
            <!--<div class="as-text">
              VIEW DETAIL <span></span>
             </div>-->
          </h6>
        </div>
  
        <!-- Panel 4 -->
        <div class="as-panel">
          <img class="as-background" src="/Source/Client/img/accordion_six_gray.jpg" data-retina="/Source/Client/img/accordion_six_gray.jpg"/>
  
          <a href="#">
            <img class="as-background-opened" src="/Source/Client/img/accordion_six.jpg" data-retina="/Source/Client/img/accordion_six.jpg"/>
          </a>
  
          <div class="as-layer as-closed as-black as-vertical panel-counter re-none eng-font"
             data-position="topLeft" data-horizontal="70" data-vertical="0" data-show-delay="300">
             <b>Smart Logistics</b> Platform
          </div>
  
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="10%" 
            data-show-transition="left" data-show-delay="300" data-hide-transition="right" data-hide-delay="100">
            물류
          </p>
          <h3 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="14%" data-width=""
            data-show-transition="left" data-show-delay="400" data-hide-transition="right" data-hide-delay="100">
            스마트 물류 플랫폼
          </h3>
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="30%" data-width="" 
            data-show-transition="left" data-show-delay="500" data-hide-transition="right" data-hide-delay="100">
            2001년부터 22년간 컨테이너와 벌크선사, 선사 대리점, 포워더, 2.3자 물류, 창고, 항공 터미널, 컨테이너야드·운송·철송장, 벌크 운송 등의 다양한 분야의 개발 경험이 있습니다.
          </p>
          <h6 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="50%" data-width="250" 
            data-show-transition="left" data-show-delay="700" data-hide-transition="right" data-hide-delay="100">
            <!--<div class="as-text">
              VIEW DETAIL <span></span>
             </div>-->
          </h6>
        </div>
  
        <!-- Panel 5 -->
        <div class="as-panel">
          <img class="as-background" src="/Source/Client/img/accordion_two_gray.jpg" data-retina="/Source/Client/img/accordion_two_gray.jpg"/>
  
          <a href="#">
            <img class="as-background-opened" src="/Source/Client/img/accordion_two.jpg" data-retina="/Source/Client/img/accordion_two.jpg"/>
          </a>
  
          <div class="as-layer as-closed as-black as-vertical panel-counter re-none eng-font"
             data-position="topLeft" data-horizontal="70" data-vertical="0" data-show-delay="300">
             <b>Smart Travel</b> Platform
          </div>
  
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="10%" 
            data-show-transition="left" data-show-delay="300" data-hide-transition="right" data-hide-delay="100">
            여행
          </p>
          <h3 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="14%" data-width=""
            data-show-transition="left" data-show-delay="400" data-hide-transition="right" data-hide-delay="100">
            스마트 여행 플랫폼
          </h3>
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="30%" data-width="" 
            data-show-transition="left" data-show-delay="500" data-hide-transition="right" data-hide-delay="100">
            국내/외 여행 전문업체 솔루션 개발과 종합 여행플랫폼 개발 사업을 하고 있고, 2023년 지금까지 경험하지 못한 혁신적인 신규 여행플랫폼을 운영, 출시할 예정입니다.
          </p>
          <h6 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="50%" data-width="250" 
            data-show-transition="left" data-show-delay="700" data-hide-transition="left" data-hide-delay="100">
            <!--<div class="as-text">
              VIEW DETAIL <span></span>
             </div>-->
          </h6>
        </div>
  
        <!-- Panel 6 -->
        <div class="as-panel">
          <img class="as-background" src="/Source/Client/img/accordion_four_gray.jpg" data-retina="/Source/Client/img/accordion_four_gray.jpg"/>
  
          <a href="#">
            <img class="as-background-opened" src="/Source/Client/img/accordion_four.jpg" data-retina="/Source/Client/img/accordion_four.jpg"/>
          </a>
  
          <div class="as-layer as-closed as-black as-vertical panel-counter re-none eng-font"
             data-position="topLeft" data-horizontal="70" data-vertical="0" data-show-delay="300">
             <b>Smart Shopping mall</b> Platform
          </div>
  
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="10%" 
            data-show-transition="left" data-show-delay="300" data-hide-transition="right" data-hide-delay="100">
            쇼핑몰
          </p>
          <h3 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="14%" data-width=""
            data-show-transition="left" data-show-delay="400" data-hide-transition="right" data-hide-delay="100">
            스마트 쇼핑몰 플랫폼
          </h3>
          <p class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="30%" data-width="" 
            data-show-transition="left" data-show-delay="500" data-hide-transition="right" data-hide-delay="100">
            물류사업과 연계해 B2C 화주들의 영업, 구매를 온라인 비즈니스를 통해 할 수 있도록 온라인 쇼핑몰 구축과 물류(재고, 입출고 오더, 운송 오더) 등을 일체형으로 제공하는 사업입니다.
          </p>
          <h6 class="as-layer as-opened as-white as-padding eng-font" 
            data-horizontal="40" data-vertical="50%" data-width="250" 
            data-show-transition="left" data-show-delay="700" data-hide-transition="right" data-hide-delay="100">
           <!--<div class="as-text">
              VIEW DETAIL <span></span>
             </div>-->
          </h6>
        </div>
         
      </div>
    </div>
  </div>
  <div data-serialscrolling-target="support" id="support">
    <div class="sup-title eng-font">
      <h5>Community</h5>
      <h2>News&Notice</h2>
      <a href="#" class="goto-btn">바로가기</a>
    </div>
    <ul class="mslide3">
      <li>
        <img src="/Source/Client/img/accordion_one.jpg" alt="슬라이드이미지1">
        <h3>스마트 물류</h3>
        <p>[Shippinggate] 스마트물류 홈페이지 오픈</p>
        <a href="#"></a></li>
      <li>
        <img src="/Source/Client/img/accordion_two.jpg" alt="슬라이드이미지2">
        <h3>T2L</h3>
        <p>T2L 홈페이지 오픈</p>
        <a href="#"></a></li>
      <li>
        <img src="/Source/Client/img/accordion_three.jpg" alt="슬라이드이미지3">
        <h3>스마트 여행</h3>
        <p>[TOUR Solution] 스마트여행 홈페이지 오픈</p>
        <a href="#"></a></li>
      <li>
        <img src="/Source/Client/img/accordion_four.jpg" alt="슬라이드이미지4">
        <h3>스마트 물류</h3>
        <p>[Shippinggate] 스마트물류 홈페이지 오픈</p>
        <a href="#"></a></li>
      <li>
        <img src="/Source/Client/img/accordion_five.jpg" alt="슬라이드이미지5">
        <h3>T2L</h3>
        <p>T2L 홈페이지 오픈</p>
        <a href="#"></a></li>
      <li>
        <img src="/Source/Client/img/accordion_six.jpg" alt="슬라이드이미지6">
        <h3>스마트 여행</h3>
        <p>[TOUR Solution] 스마트여행 홈페이지 오픈</p>
        <a href="#"></a></li>
    </ul>
  </div>

  <div data-serialscrolling-target="information" id="information">
    <h5 class="eng-font">About US</h5>
    <h2 class="eng-font">Who we are</h2>
    <div class="info-box">
      <div class="info-con1">
        <div class="info-con1-box">
            <h3>우리의 기술로 세계로<br>우리 함께</h3>
            <p>
              IT서비스를 선도하는 프론티어<br>
              마음을 움직이는 IT서비스를 만들어가겠습니다.<br>
              
            </p>
            <a href="/Source/Client/Info/C_INFO_INFOMATION.aspx">자세히보기</a>
        </div>
      </div>
    </div>

    <div class="align eng-font">
      <!--<h5>Information</h5>-->
      <h2>Information</h2>
      <div class="info-con2">
        <div class="info-con2-box1">
          <a href="/Source/Client/Info/C_INFO_HISTORY.aspx">
            <div class="info-con2-box1-1">
              <h3>지금까지 찾아주신 분들</h3>
              <h4>2023년01월09일 09:07 기준</h4>
            </div>
            <p><span>120,123</span> 명</p>
            <div class="info-con2-box1-2">
              <p>일일 방문자<span> 1,000</span></p>
              <p>신규수주<span>SK해운</span></p>
            </div>
            <span>자세히보기</span>
          </a>
        </div>
        <div class="info-con2-box2">
          <div class="info-con2-box2-1 eng-font">
            <a href="#">
              <h3>Family Site</h3>
              <h4>모든 플랫폼을 만나보세요</h4>
              <span>자세히보기</span>
            </a>
          </div>
          <div class="info-con2-box2-2">
            <a href="/Source/Client/CS/C_CS_CONSTRACT.aspx">
              <h3>고객센터</h3>
              <h4>언제든 문의주세요</h4>
              <span>자세히보기</span>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <footer>
    <div class="align">
      <div class="footer-title">
        <h2>With our technology, <br>To the World, Together.</h2>
        <p>ⓒ2022.T2L<br>All Rights Reserved</p>
      </div>
      <div class="footer-right">
        <ul>
          <li><a href="/Source/Client/Info/C_INFO_INFOMATION.aspx">회사소개</a></li>
            <li><a href="/Source/Client/Company/C_COMPANY_WORK.aspx">사업분야</a></li>
            <li><a href="/Source/Client/CS/C_CS_NOTICE.aspx">고객센터</a></li>
            <li><a href="#">직원전용</a></li>
        </ul>
        <div class="etc eng-font">
          <p>
            서울 : 02-786-2471<br>
            부산 : 070-8821-2471
          </p>
        </div>
      </div>
    </div>
  </footer>
</div>

</body>
</html>