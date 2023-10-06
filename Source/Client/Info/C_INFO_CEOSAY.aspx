
<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_INFO_CEOSAY.aspx.cs" Inherits="T2LHomePage.Source.Client.Info.C_INFO_CEOSAY" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--스크립트와 스타일은 항상 이쪽 head에 반드시 입력  -->
    <!-- 스크립트 지연이 필요할경우 defer와 $(function)을 사용하자. main.aspx참조.  -->
    <style>
        /*
        table-contents안에 부터 시작함! 
        table-contents는 padding-top 걸려 있음 
        */

        .info_contents > div {
            width: 100%;
            box-sizing: border-box;
            padding: 0 10rem;
        }

        .info_content > .info_content_img > .info_content_box {
            box-sizing: border-box;
            width:20%;
        }

        .info_content > .info_content_img > .info_content_box > img {
            width: 100%;
        }

        .info_text {
            width: 100%;
        }

        .info_title {
            padding-bottom: 2.5rem;
            letter-spacing:3px;
        }

        .info_sub_title {
            color: red;
            font-weight: 600;
        }

        .info_txt {
            padding-bottom: 3.6rem;
            color: #555;
            line-height:30px;
        }

        .info_bottom_txt > span {
           
        }

        @media screen and (max-width: 1024px) {
            .info_contents > div {
            padding: 0px 5rem ;
            }
        }

        @media screen and (max-width: 770px) {
            .info_contents > div {
            padding: 0;
            }
        }

        @media screen and (max-width: 425px) {
            .info_title {
                font-size:20px;
            }

            .info_txt {
            
                padding-bottom: 2rem;
            }
            .info_content > .info_content_img > .info_content_box {
                width: 50%;
            }
          
        }

        @media screen and (max-width: 375px) {
            .info_contents > div {
            padding: 0;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sub_content">
    <div class="sub_layout">
      <div id="content">
        <div class="info">
          <div class="info_contents">
            <!--대표이사 인사말 content-->
            <div class="info_text">
              <div class="info_txt_content">
                <p class="info_title header-common-font">
                  홈페이지를 찾아주신 여러분들 진심으로 감사합니다.
                </p>
                <p class="info_txt common-font">
                  새로운 세기의 정보 사회 주역이라는 인터넷 세상에서 이렇게 만나게 되어 반갑습니다.
                  현 세기는 정보사회로 발전되어가고 있으며, 이를 위한 정보기술 또한 급속도로 확산 되어가고 있습니다.
                  이는 정보화 기술을 이용한 정보의 습득과 습득한 정보를 지식화하고 생활에 어떻게 활용하느냐에 따라서 국가, 사회, 기업 및 개인의 경쟁력과 가치를 창출한다는 것입니다.
                  따라서 모든 기업과 기관은 과거 어느 때보다도 더욱더 차별화된 정보화 전략을 통한 새로운 정보시스템의 구축이 요구되며, 이를 기반으로 한 경쟁력을 유지하고 새로운 비즈니스 창출에
                  게을리 하지지 않아야 될 것입니다.
                </p>
                <p class="info_txt common-font">
                  티투엘은 국내외에서 쌓아온 다양한 정보화 경험 및 지식을 바탕으로 사회환경이 요구하는 새로운 정보 기술을 통하여 국가, 사회, 기업이 필요로 하는 정보화 사회의 건설자로써 일익을
                  다하고자 합니다.
                </p>

                <p class="info_txt common-font">
                  우리는 지금 세상을 더 살기 좋은 세상으로 만들기 위해 소통, 협업과 신뢰를 이야기하고 있습니다. 우리가 해오던 기술을 계속 발전 시켜서 이러한 세상의 흐름에 맞춰 고객의 편리함을 최대화 하는 탁월한 솔루션과 서비스를 제공한다면 조금이라도 더 나은 세상을 만드는데 기여할 수 있을 것이라 믿고 있습니다.
                </p>

                <p class="info_txt common-font">
                  감사합니다.
                </p>

                <p class="header-font brush-font">
                  T2L(주) 대표 
                  <span class="head">
                    김재희
                  </span>
                </p>
              </div>
            </div>

            <div class="info_content">
              <div class="info_content_img">
                <div class="info_content_box">
                  <img src="/Source/Client/img/CEO_IMG.jpg" alt="info_main_img"/>
                </div>
              </div>
            </div>
            

          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
