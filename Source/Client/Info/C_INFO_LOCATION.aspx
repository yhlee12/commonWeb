<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_INFO_LOCATION.aspx.cs" Inherits="T2LHomePage.Source.Client.Info.C_INFO_LOCATION" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--스크립트와 스타일은 항상 이쪽 head에 반드시 입력  -->
    <!-- 스크립트 지연이 필요할경우 defer와 $(function)을 사용하자. main.aspx참조.  -->
    <style>
         /*
        table-contents안에 부터 시작함! 
        table-contents는 padding-top 걸려 있음 
        */

        .map_layout {
              box-sizing: border-box;
              padding: 0 3rem;
            }

            .map_address {
              display: flex;
              box-sizing: border-box;
              padding: 2rem 6rem;
              border-bottom: 1px solid #b5adad;
            }

            .address_title {
              display: flex;
              align-items: center;
              width: 43rem;
            }

            .address_title_img {
              width: 4rem;
            }

            .address_title_img > img {
              width: 100%;
            }

            .desc {
              box-sizing: border-box;
              padding-left: 20px;
            }

            .desc > span {
              font-size: 18px;
            }

            .address_title_txt > .info > p {
              line-height: 2;
              font-size: 18px;
            }

            @media screen and (max-width: 1024px) {
              .map_layout {
                padding: 0;
              }
              iframe {
                height: 400px;
              }
              .map_address {
                padding: 2rem 0;
              }
              .address_title {
                width: 46rem;
              }
              .address_title_txt {
                width: 100%;
              }
              .address_title_txt > .info > p {
                line-height: 1.7;
              }
              br {
                  display: block;
              }
            }

            @media screen and (max-width: 786px) {
              .map_address {
                padding: 2rem 0;
              }
              .address_title {
                width: 36rem;
              }
              .address_title_txt > .info > p {
                font-size: 16px;
              }
            }

            @media screen and (max-width: 425px) {
              .map_address {
                display: block;
              }
              .address_title {
                width: 100%;
              }
              iframe {
                height: 250px;
              }
              .info {
                padding-top: 10px;
              }
            }

            @media screen and (max-width: 375px) {
              .address_title_txt > .info > p {
                font-size: 14px;
              }
            }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sub_content">
        <div class="sub_layout">
            <div id="content">

                <!--서울-->
                <div class="map_layout">
                  <div class="map_content">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3160.7735737502303!2d126.88678809473932!3d37.607487649661714!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c99c07a8866e3%3A0x9b7c727608edecdf!2z6rK96riw64-EIOqzoOyWkeyLnCDrjZXslpHqtawg7Zal64-Z64-ZIDM5NA!5e0!3m2!1sko!2skr!4v1695702093484!5m2!1sko!2skr" width="100%" height="500px" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                  </div>

                  <div class="map_address">
                    <div class="address_title">
                      <div class="address_title_img">
                        <img src="/Source/Client/img/intro4.svg" alt="">
                      </div>
                      <div class="desc">
                        <span>서울 본사</span>
                      </div>
                    </div>

                    <div class="address_title_txt">
                      <div class="info">
                        <p>
                          주소 : 고양시 덕양구 향동동 394, 지엘메트로시티향동 제13층 B동 1314호<br/>
                          연락처 : 02 - 786 - 2471 <br/>
                          E-MAIL : tpls@T2L.co.kr
                        </p>
                      </div>
                    </div>
                  </div>
                </div>

                <!--부산-->
                <div class="map_layout">
                  <div class="map_content">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1584.1988257626258!2d129.12353023187475!3d35.17560105943483!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568931ec370acfb%3A0xffdd07ec62664d63!2z67K97IKwZS3shLzthYDtgbTrnpjsiqTsm5AgMeywqCDruYzrlKk!5e0!3m2!1sko!2skr!4v1675237211805!5m2!1sko!2skr" width="100%" height="500px" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                  </div>

                  <div class="map_address">
                    <div class="address_title">
                      <div class="address_title_img">
                        <img src="/Source/Client/img/intro4.svg" alt="">
                      </div>
                      <div class="desc">
                        <span>부산 지사</span>
                      </div>
                    </div>

                    <div class="address_title_txt">
                      <div class="info">
                        <p>
                          주소 : 부산 해운대구 센텀동로 99 벽산e-센텀클래스원 618-1호(48059) <br/>
                          연락처 : 070 - 8821 - 2471 <br/>
                          E-MAIL : help@T2L.co.kr
                        </p>
                      </div>
                    </div>
                  </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

