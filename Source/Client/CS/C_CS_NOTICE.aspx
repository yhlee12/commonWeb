<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_CS_NOTICE.aspx.cs" Inherits="T2LHomePage.Source.Client.CS.C_CS_NOTICE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        img {
            width: 100%;
        }

        .notice {
          border-top: 2px solid #555;
        }

        .notice_wrap {
          position: relative;
          clear: both;
          display: block;
          overflow: hidden;
          content: "";
          border-bottom: 1px solid #cacaca;
        }

        .question {
          display: block;
          position: relative;
        }

        .question > .a {
          display: block;
          padding: 2rem 15rem;
        }


        .question_front {
            background: red;
            display: block;
            border-radius: 50%;
            width: 3rem;
            height: 3rem;
            text-align: center;
            padding-top: 0;
            position: absolute;
            left: 3.6rem;
            top: 3.4rem;
            color: #fff;
            line-height: 3rem;
            top: 50%;
            right: 0;
            transform: translate(-50%, -50%);
            font-size: 1.2rem;

        }

        .notice_title {
            font-size: 1.2rem;
            font-weight: 500;
            color: #000;
        }

        .Detail {
            padding: 3rem 15rem;
            display : none;
        }
        
        .active {
            display:block;
            height: 100px;
        }

        .detail_front {
           
        }

        .notice_wrap > Detail{
          position: absolute;
          transition: 1s;      
        }
        @media screen and (max-width: 1024px) {
            .question_front {
                width: 4rem;
                height: 4rem;
                line-height: 4rem;
            }

            .question > .a {
                padding: 3rem 15rem;
            }
        }

        @media screen and (max-width:768px) {
            .question_front {
                width:3rem;
                height: 3rem;
                line-height: 3rem;
            }
            .question > .a {
                padding: 2rem 7rem;
            }

            .notice_title {
                font-size: 1.2rem;
            }
        }

        @media screen and (max-width: 425px) {
            .question_front {
                left: 2rem;
            }
            .question > .a {
                padding: 2rem 1rem 2rem 4.3rem;
            }
            .notice_title {
                font-size: 0.9rem;
            }
        }

        @media screen and (max-width: 390px) {
            .notice_title {
                font-size: 0.80rem;
            }
        }

    </style>
      <script>
          //$(document).ready(function () {
          //    $(".notice_wrap").click(function () {
          //       $(".Detail").toggle();
          //    });
          //});
          $(function () {
              $(".question").click(function () {
                  //console.log($(this).attr('id'));
                  var BOARD_SID = $(this).attr('id');
                  //location.href = "/Source/Client/C_CS_DETAIL.aspx?BOARD_SID=" + id_check;
                  location.href = "/Source/Client/CS/C_CS_DETAIL.aspx?BOARD_SID=" + BOARD_SID;

              });
          })         
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="sub_content">
        <div class="sub_layout">
          <div id="content">

              <div class="notice">
                  
                  <div class="notice_list">
                      
                     <% for (int j = 0; j < resultDT.Rows.Count; j++){ %>
                      
                          <div class="notice_wrap board_table">
                              <div class="question" id="<%=resultDT.Rows[j]["BOARD_SID"] %>">
                                  <div class="a">
                                      <span class="question_front">Q</span>
                                      <span class="notice_title"><%=  resultDT.Rows[j]["BOARD_TITLE"].ToString()%></span>
                                  </div>
                              </div>
                          </div>

                        <%} %>   
                    </div>                                
               </div>
            </div>
        </div>
    </div>
</asp:Content>
