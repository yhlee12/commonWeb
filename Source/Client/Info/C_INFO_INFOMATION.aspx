<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_INFO_INFOMATION.aspx.cs" Inherits="T2LHomePage.Source.Client.Info.C_INFO_INFOMATION" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--스크립트와 스타일은 항상 이쪽 head에 반드시 입력  -->
    <!-- 스크립트 지연이 필요할경우 defer와 $(function)을 사용하자. main.aspx참조.  -->
    <style>
        /*
        table-contents안에 부터 시작함! 
        table-contents는 padding-top 걸려 있음 
        */
        .intro .table-contents .import {
          padding: 0;
          border-bottom: 1px solid #cacaca;
        }

        .table-contents .import {
          padding: 7.3rem 0;
        }

        .table-contents > div {
          display: table;
          width: 100%;
          table-layout: fixed;
          border-bottom: 1px solid #cacaca; 

          padding: 6rem 0;
        }

        .table-contents .import > div {
          vertical-align: top;
        }

        .table-contents .title {
          position: relative;
          width: 49rem;
        }

        .title > .item {
          display: flex;
          position: absolute;
          align-items: center;
        }

        .title > .item > img { 
          margin-right: 1.8rem;
        }

        .table-contents > div > div {
          display: table-cell;
        }

        .table-contents .title span {
          display: block;
          color: #000;
          line-height: 1.5;
          font-weight: 600;
        }

        .table-contents .info {
          width: calc(100% - 49rem);
        }

        .table-contents .info .item {
          color: #555;
          line-height: 1.5;
        }

        .table-contents .import .info .desc {
          font-weight: 500;
        }

        .table-contents .info p {

          color: #555;
          line-height: 1.7;
          margin-bottom: 3rem;
        }

        .table-contents .title .eng img {
          margin-left: 3rem;
          width: 4.7rem;
          vertical-align: top;
        }

        .table-contents .title img {
          display: block;
        }

        img {
          border: none;
          font-size: 0;
          max-width: 100%;
        }

        .table-contents .title.eng img + span {
          text-transform: uppercase;
          font-weight: 700;
          vertical-align: top;
          line-height: 1.75;
        }

        @media screen and (max-width: 1600px) {
          /*서브 메인 이미지 안*/
          .layout {
            box-sizing: border-box;
            padding: 3rem;
          }


          /*서브 컨텐츠*/
          .sub_layout {
            box-sizing: border-box;
            padding: 3rem;
          }
        }

        @media screen and (max-width: 1440px) {
          .sub_bg_txt {
            text-align: center;
            
          }
          br {
              display: block;
          }
        }

        @media screen and (max-width: 1024px) {
         
          #sub_bg {
            padding: 18rem 0px 19rem;
          }
          #sub_content {
            padding: 1rem 0 2rem;
          }
          .table-contents > div {
            display: block;
          }
          .table-contents > div > div {
            display: block;
          }
          .title > .item {
            display: block;
            position: inherit;
            padding-bottom: 10px;
          }
          .table-contents .title {
            width: 100%;
          }
         
          .table-contents .title span {
            font-size: 28px;
          }
          .table-contents .info {
            width: 100%;
          }
          .table-contents .import .info .desc {
           
          }

          .table-contents > div {
              padding:2rem 0;
            
          }

          .table-contents .title.eng img + span {
            font-size: 28px;
          }

          .table-contents .info p {
           
          }
        }

        @media screen and (max-width: 768px) {

        }

        @media screen and (max-width: 425px) {
          #sub_bg {
            padding: 5rem 0px 5rem;
          }
          .sub_bg_txt span {
            
          }
          .sub_bg_txt p {
             font-size: 1.7rem;
           
          }
          .sub_layout {
            padding: 2rem;
          }
          .table-contents .title span {
           
          }
          .table-contents .import .info .desc {
           
          }
          .table-contents .title.eng img + span {
           
          }
          .table-contents .info p {
          
          }
        }

        @media screen and (max-width:375px) {
          .sub_bg_txt span {
              font-size: 2.5rem;
            
          }
          .sub_bg_txt p {
             font-size: 1.6rem;
           
          }
        }

        @media screen and (max-width:320px) {
          .sub_bg_txt span {
              font-size: 2rem;
            
          }
          .sub_bg_txt p {
             font-size: 1.2rem;
             line-height: 2rem;
           
          }
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="sub_content">
    <div class="sub_layout">
      <div id="content">
        <div class="intro">
          <div class="table-contents">
            <div class="import">
              <div class="title">
                <div class="item">
                  <span class="header-common-font">
                    
                    소프트웨어 개발,<br>
                    플랫폼 개발<br>
                    전문기업입니다.

                  </span>
                </div>
              </div>
              <div class="info">
                <div class="item">
                  <p class="desc common-font">
                    "2000년에 설립된 T2L은 여행, 물류, 쇼핑몰 플랫폼 시스템을 위한 소프트웨어 개발 서비스를 제공합니다.
                    <br>
                    고객 만족과 고객 성장을 위한 최상의 소프트웨어를 제작하는 것이 T2L의 미션입니다.
                    <br>
                    T2L 구호는 '우리의 기술로 세계로, 우리 함께'입니다. 
                    <br>
                    T2L의 약어는 'Trade To Logistics'입니다."
                  </p>
                  <!--영어-->
                   <p class="desc common-font">
                        “Established in 2000, the company provides software development services for tour, logistics, and shopping mall platform systems.
                    <br>
                        The company's mission is to create the best software to help customers achieve satisfaction and growth. 
                    <br>
                        The company motto is "With our technology, to the world, together."
                    <br>
                        The abbreviation for T2L is "Trade To Logistics."
                  </p>
                    <!--중국어-->
                    <p class="desc common-font">
                        "该公司成立于2000年，为旅游、物流和购物中心平台系统提供软件开发服务。
                    <br>
                        公司的使命是创造最佳软件，以帮助客户获得满意和成长。
                    <br>
                        公司的口号是“凭借我们的技术，走向世界，共同前进”。
                    <br>
                        T2L的缩写是“Trade To Logistics”。
                  </p>
                    <!--일본어-->
                    <p class="desc common-font">
                        ”2000年に設立された会社は、旅行、物流、ショッピングモール・プラットフォームシステム用のソフトウェア開発サービスを提供しています。
                    <br>
                        顧客満足と顧客の成長のための最高のソフトウェアを作成することが会社のミッションです。
                    <br>
                        会社のモットーは「私たちの技術で世界に、私たち一緒に」です。
                    <br>
                        T2Lの略語は「Trade To Logistics」です。"
                    </p>
                    <!--베트남어-->
                    <p class="desc common-font">
                        “Công ty được thành lập vào năm 2000, cung cấp dịch vụ phát triển phần mềm cho hệ thống nền tảng du lịch, vận tải và trung tâm mua sắm. 
                    <br>
                        Sứ mệnh của công ty là tạo ra phần mềm tốt nhất để giúp khách hàng đạt được sự hài lòng và phát triển.
                    <br>
                        Phương châm của công ty là "Với công nghệ của chúng tôi, đến với thế giới, cùng nhau".
                    <br>
                        Từ viết tắt cho T2L là "Trade To Logistics".
                  </p>

                </div>
              </div>
            </div>

            <!--두번째 내용-->
            <div>
              <div class="title eng">
                <div class="item">
                  <img src="/Source/Client/img/intro1.svg" alt="">
                  <span class="header-common-font">mission</span>
                </div>
              </div>
              <div class="info">
                <div class="item">
                  <p class="desc common-font">
                    스마트물류플랫폼 : 물류 업계의 디지탈 트랜스포메이션을 지원 하는 플랫폼 제공 <br>
                    스마트여행플랫폼 : 자유여행에 필요한 플랫폼 제공<br>
                    스마트쇼핑몰플랫폼 : 판매/구매/물류를 지원 하는 플랫폼 제공<br>
                    스마트플랫폼 연구실/디자인실: 스마트 플랫폼에 필요한 기반기술 요소를 연구/개발  <br>
                  </p>

                    <p class="desc common-font">
                    Smart Logistics Platform: Platform providing support for digital transformation in the logistics industry. <br>
                    Smart Travel Platform: Platform providing necessary services for free travel.<br>
                    Smart Shopping Mall Platform: Platform providing support for sales/purchase/logistics.<br>
                    Smart Platform Research & Design Lab: Research and development of technical elements required for smart platforms.<br>
                  </p>

                    <p class="desc common-font">
                    スマート物流プラットフォーム：物流業界のデジタルトランスフォーメーションを支援するプラットフォームの提供<br>
                    スマート旅行プラットフォーム：自由な旅行に必要なプラットフォームの提供<br>
                    スマートショッピングモールプラットフォーム：販売/購入/物流を支援するプラットフォームの提供<br>
                    スマートプラットフォーム研究室/デザイン室：スマートプラットフォームに必要な技術要素の研究・開発.<br>
                  </p>

                    <p class="desc common-font">
                    智能物流平台：支持物流业数字化转型的平台<br>
                    智能旅游平台：提供自由旅游所需的平台<br>
                    智能购物商场平台：提供销售/购买/物流支持的平台<br>
                    智能平台研究室/设计室：研究和开发智能平台所需的技术要素<br>
                  </p>
                </div>
              </div>
            </div>

            <!--
            <div>
              <div class="title eng">
                <div class="item">
                  <img src="/Source/Client/img/intro2.svg" alt="">
                  <span class="header-common-font">VISION</span>
                </div>
              </div>
              <div class="info">
                <div class="item">
                  <p class="desc common-font">
                    소프트웨어를 활용한 비즈니스 솔루션으로 가치를 창출하고, 내부적으로는 구성원의 행복을 최우선으로 하며, 외부적으로는 고객의 가치를 극대화하여 사회 및 인류발전에 기여한다.
                  </p>
                </div>
              </div>
            </div>

            <div>
              <div class="title eng">
                <div class="item">
                  <img src="/Source/Client/img/intro3.svg" alt="">
                  <span class="header-common-font">VALUE</span>
                </div>
              </div>
              <div class="info">
                <div class="item">
                  <p class="desc common-font">
                    소프트웨어를 활용한 비즈니스 솔루션으로 가치를 창출하고, 내부적으로는 구성원의 행복을 최우선으로 하며, 외부적으로는 고객의 가치를 극대화하여 사회 및 인류발전에 기여한다.
                  </p>
                </div>
              </div>
            </div>-->
          </div>
        </div>
      </div>
    </div> 
  </div>
    
</asp:Content>
