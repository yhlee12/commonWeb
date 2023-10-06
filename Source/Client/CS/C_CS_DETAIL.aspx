<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_CS_DETAIL.aspx.cs" Inherits="T2LHomePage.Source.Client.CS.C_CS_DETAIL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .detail_top {
            display: flex;
        }

        .detail_top_content {
            display: flex;
            width: 50%;
        }

        .user {
            text-align: center;
            width: 20%;
            padding: 10px;
            border: 1px solid #cacaca;
        }

        .user_content {
            width: 80%;
            padding: 10px;
            border: 1px solid #cacaca;
        }

        .detail_title_box {
            border-right: 1px solid #cacaca;
            border-left: 1px solid #cacaca;
            border-bottom: 1px solid #cacaca;
        }

        .cer {
            text-align: center;
            padding: 10px;
        }

        .content_wrap {
            display: flex;
            padding: 3rem;
            border-bottom: 1px solid #cacaca;
            border-right: 1px solid #cacaca;
            border-left: 1px solid #cacaca;
        }

        .detail_btn {
          display: flex;
          float: right;
        }

        .correction,.delete {
          width: 10rem;
          text-align: center;
          box-sizing: border-box;
          padding: 15px;
          border: 1px solid #cacaca;
          margin-top: 1rem;
          font-size: 1.2rem;
        }
    </style>

    <script>

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sub_content">
        <div class="sub_layout">
            <div id="content">

                <%if (resultDT.Rows.Count > 0)
                  {%>
                    <div class="detail">

                        <div class="detail_top">
                            <div class="detail_top_content">
                                <div class="user">
                                    <span>작성자</span>
                                </div>
                                <div class="user_content"><%= resultDT.Rows[0]["POST_USER_ID"].ToString()%></div>
                            </div>
            
                            <div class="detail_top_content">
                                <div class="user">
                                    <span>등록일</span>
                                </div>
                                <div class="user_content"><%= resultDT.Rows[0]["POST_TIME"].ToString()%></div>
                            </div>  
                        </div>

                        <div class="detail_title_box">
                            <div class="cer">
                                <span>공지 제목 : <%= resultDT.Rows[0]["BOARD_TITLE"].ToString()%></span>
                            </div>
                        </div>

                        <div class="detail_content">
                            <div class="content_wrap">
                                <div class="detail_title">
                                    <span><%= resultDT.Rows[0]["BOARD_MESSAGE"].ToString()%></span>
                                </div>
                            </div>
                        </div>   
                    </div>

                    <div class="detail_btn">
                        <div class="correction" onclick="correctionClick()">
                            <span>수정</span>
                        </div>
                        <div class="delete" onclick="deleteClick()">
                            <span>삭제</span>
                        </div>
                    </div>
                
                <%}else{%> 
                  <div>데이터가 없습니다.</div>
            <%}%>
            </div>
        </div>
    </div>
</asp:Content>
