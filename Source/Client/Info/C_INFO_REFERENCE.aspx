<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_INFO_REFERENCE.aspx.cs" Inherits="T2LHomePage.Source.Client.Info.C_INFO_REFERENCE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       .reference_title {
          width: 25rem;
          margin: 0 auto;
        }

        .reference_title_txt {
          box-sizing: border-box;
          padding: 2rem 4rem;
          border-radius: 20px;
          border: 1px solid #cacaca;
          text-align: center;
        }

        .reference_title_txt > span {
          font-size: 24px;
        }

        .img_wrap {
          display: flex;
        }

        .img_wrap_inner {
          display: flex;
          width: 50%;
        }

        .img_wrap_img {
          display: flex;
          align-items: center;
          justify-content: center;
          box-sizing: border-box;
          padding: 2rem 4rem;
          width: 50%;
        }

        @media screen and (max-width:786px) {
          .img_wrap {
            display: block;
          }
          .img_wrap_inner {
            width: 100%;
          }
        }

        @media screen and (max-width: 425px) {
          .img_wrap_img {
            padding: 1rem 2rem;
          }
          .reference_title {
            width: 19rem;
          }
          .reference_title_txt {
            padding: 1rem 2rem;
            margin-bottom: 2rem;
          }
          .reference_title_txt > span {
            font-size: 20px;;
          }
        }

        @media screen and (max-width: 375px) {
          .img_wrap_img {
            padding: 1rem 1rem;
          }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sub_content">
        <div class="sub_layout">
            <div id="content">

               <div class="reference">
                  <div class="reference_wrap">

                    <div class="reference_title">
                      <div class="reference_title_txt">
                        <span>물류 Reference</span>
                      </div>
                    </div>
            
                    <div class="reference_wrap_inner">
              
                      <div class="img_wrap">

                        <div class="img_wrap_inner">
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_1.jpg" alt="">
                          </div>
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_2.png" alt="">
                          </div>
                        </div>

                        <div class="img_wrap_inner">
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_3.png" alt="">
                          </div>
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_4.png" alt="">
                          </div>
                        </div>

                      </div>

                      <div class="img_wrap">

                        <div class="img_wrap_inner">
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_5.png" alt="">
                          </div>
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_6.png" alt="">
                          </div>
                        </div>

                        <div class="img_wrap_inner">
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_7.png" alt="">
                          </div>
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_8.png" alt="">
                          </div>
                        </div>

                      </div>

                      <div class="img_wrap">

                        <div class="img_wrap_inner">
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_9.png" alt="">
                          </div>
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_10.png" alt="">
                          </div>
                        </div>

                        <div class="img_wrap_inner">
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_11.jpg" alt="">
                          </div>
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_12.jpg" alt="">
                          </div>
                        </div>

                      </div>

                      <div class="img_wrap">

                        <div class="img_wrap_inner">
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_13.png" alt="">
                          </div>
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_14.png" alt="">
                          </div>
                        </div>

                        <div class="img_wrap_inner">
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_15.png" alt="">
                          </div>
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_16.png" alt="">
                          </div>
                        </div>

                      </div>

                      <div class="img_wrap">

                        <div class="img_wrap_inner">
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_17.png" alt="">
                          </div>
                          <div class="img_wrap_img">
                            <img src="/Source/Client/img/LO_18.png" alt="">
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
