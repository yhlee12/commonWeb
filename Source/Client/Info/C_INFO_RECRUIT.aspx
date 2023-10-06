<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_INFO_RECRUIT.aspx.cs" Inherits="T2LHomePage.Source.Client.Info.C_INFO_RECRUIT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Recruit {
  box-sizing: border-box;
  padding: 0 3rem;
}

.Recruit_wrap_inner {
  width: 100%;
  text-align: center;
}

.Recruit_wrap_inner > img {
  width: 100%;
}

.Recruit_table_content_inner  {
  position: relative;
  box-sizing: border-box;
  padding: 6rem 0;
  border-bottom: 1px solid #cacaca;
}

.Recruit_table_content_item_title {
  position: relative;
  display: table-cell;
  width: 44rem;
}

.Recruit_table_content_item_title > .Recruit_title {
  font-size: 2.5rem;
  font-weight: 700;
  color:black;
  line-height: 4rem;
}

.Recruit_table_content_item_title > .Recruit_title > .Recruit_title_sub {
  color: red;
}

.Recruit_table_content_item {
  display: table-cell;
  width: calc(100% - 44rem);
  vertical-align: middle;
  line-height: 3rem;
}

.Recruit_table_content_item > span { 
  font-size: 1.8rem;
  line-height: 1.5;
  color: #504f4f;
}

.Recruit_table_content_bottom {
  box-sizing: border-box;
  padding: 6rem 0;
  display: flex;
}

.Recruit_table_content_item_title_bottom {
  display: flex;
  width: 49rem;
}

.title {
  position: absolute;

  top: 50%;
  left: 15%;
  transform: translate(-50%, -50%);
}

.title_img {
  width: 5rem;
  margin: auto;
  object-fit: cover;
}

.title_img > img {
  width: 100%;
}

.title_txt {
  padding: 1rem 0;
  text-align: center;
}

.title_txt > span { 
  font-size: 24px;
  font-weight: 700;
  color: #413f3f;
}

.Recruit_table_content_item_award {
  display: flex;
  align-items: center;
  padding: 2rem 0;
}

.award {
  position: relative;
  padding-right: 30px;
}

.award_txt_title {
  font-size: 2rem;
}

.award_txt_bottom > p {
  font-size: 1.2rem;
  color:#646262;
  box-sizing: border-box;
  padding-right: 30px;
}

.award_img {
  position: absolute;
  right: 0;
}

.Recruit_table_content_item_bottom {
  display: table-cell;
  width: 74rem;
}

.wrap_inner {
  display: flex;
  box-sizing: border-box;
  padding: 3rem 0;
}

.item_bottom_left {
  position: relative;
  padding-right: 3rem;
  width: 50%;
  
}

.item_bottom_right {
  position: relative;
  padding-left: 3rem;
  width: 50%;
 
}

.number {
  color: #cacaca;
  font-size: 20px;
  padding-bottom: 1rem;
  font-weight: 700;
}

.number_title {
  font-size: 24px;
  padding-bottom: 1rem;
  font-weight: 600;
}

.number_title_menu {
  color: #504f4f;
  font-size: 16px;
  line-height:30px;
}

.number_title_menu > li { 
  font-size : 16px;   
}

.item_bottom_left_img {
  position: absolute;
  width: 3rem;
  height: 3rem;
  object-fit: cover;
  top: 0;
  right: 0;
}

.item_bottom_left_img > img {
  width: 100%;
}

.item_bottom_right_img {
  position: absolute;
  width: 3rem;
  height: 3rem;
  object-fit: cover;
  top: 0;
  right: 0;
}

.item_bottom_right_img > img {
  width: 100%;
}

@media screen and (max-width:1024px) {
  br {
    display: none;
  }
  .Recruit_table_content_inner {
    padding: 2rem 0;
  }
  .Recruit_table_content_item_title {
    display: block;
    width: 100%;
    padding-bottom: 1rem;
  }
  .Recruit_table_content_item {
    display: block;
    width: 100%;
  }
  .title {
     left: 50%;
  }
 .title_img {
      display: none;
  }
}

@media screen and (max-width: 768px) {
  .sub_layout {
      padding: 0;
  }
  .Recruit_table_content_item_title {
    padding-bottom: 1rem;
  }
  .Recruit_table_content_item_title > .Recruit_title {
    font-size: 2rem;
  }
  .Recruit_table_content_item > span {
    font-size: 1.2rem;
  }
  .Recruit_table_content_item_award {
    padding: 0.8rem 0;
  }
 

}

@media screen and (max-width:425px) {
  .sub_layout {
    padding: 0 1rem;
  }
  .Recruit {
    padding: 0;
  }
  .award_txt_title {
      font-size: 1.5rem;
  }

  .Recruit_table_content_inner {
      padding: 2rem 0;
  }
  .award_txt_bottom > p {
      font-size:1rem;
  }
  .Recruit_table_content_item {
      line-height: 2rem;
  }
  .Recruit_table_content_item_title > .Recruit_title {
      font-size: 1.3rem;
  }
  .Recruit_table_content_item > span {
      line-height: 0;
  }
  .Recruit_table_content_item_award {
    padding: 1.5rem 0 1rem 0;
  }
  .award_img {
    width: 3rem;
  }
  .item_bottom_left {
    padding-right: 2rem;
  }
  .item_bottom_right {
    padding-left: 2rem;
  }
  .number_title {
    font-size: 1.2rem;
  }
  .number_title_menu {
    font-size: 1.2rem;
  }
  .title_img {
    width: 4rem;
    height: 4rem;
  }
  .item_bottom_left_img  {
      width: 3rem;
      height:3rem;
  }
  .item_bottom_right_img {
      width: 3rem;
      height:3rem;
  }
  .wrap_inner {
      padding: 2rem 0; 
  }
}

@media screen and (max-width: 390px) {
    .number_title {
        font-size: 1rem;
    }
    .Recruit_table_content_item_title {
        padding-bottom: 0;
    }
    .Recruit_table_content_item_title > .Recruit_title {
        font-size: 1.2rem;
    }
    .Recruit_table_content_item > span {
        font-size: 1rem;
    }
    .title_txt > span {
        font-size: 20px;
    }
}

@media screen and (max-width:375px) {
  .Recruit_table_content_item_award {
    padding: 2rem 0 1rem 0;
  }
}

@media screen and (max-width:320px) {
   .Recruit_table_content_item_title > .Recruit_title {
       line-height: 2rem;
   } 
  .item_bottom_right_img {
    width: 2rem;
  }
  .item_bottom_left_img {
    width: 2rem;
  }
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sub_content">
        <div class="sub_layout">
            <div id="content">

                  <div class="Recruit">
                      <div class="Recruit_wrap">
                        <div class="Recruit_wrap_inner">
                          <img src="/Source/Client/img/recruit.jpg" alt="">
                        </div>

                        <div class="Recruit_table_content">
                          <div class="Recruit_table_content_inner">
                            <div class="Recruit_table_content_item_title">
                              <span class="Recruit_title">
                                회사 문화를<br>
                                함께 만들어갈<br>
                                인재를 찾습니다
                                <span class="Recruit_title_sub">.</span>
                              </span>
                            </div>

                            <div class="Recruit_table_content_item">
                              <span>
                                T2l은 행복한 구성원이 우리의 솔루션과 서비스로 고객을 행복하게 하고 그들이 더 좋은 세상을 만들어 나가는 것을 추구합니다.<br>
                                개방, 공유, 개선 업무문화를 꾸준한 혁신을 거듭하여 고객에게 최대의 편리함을 제공하는 회사 문화를 함께 만들어갈 인재를 찾습니다.
                              </span>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="Recruit_table_content">
                        <div class="Recruit_table_content_inner">

                          <div class="Recruit_table_content_item_title">
                            <div class="title">
                              <div class="title_img">
                                <img src="/Source/Client/img/recruit1.svg" alt="">
                              </div>   
                              <div class="title_txt">
                                <span>We want!</span>
                              </div>             
                            </div>
                          </div>

                          <div class="Recruit_table_content_item">
                            <div class="Recruit_table_content_item_award">
                              <div class="award">
                                <div class="award_txt">
                                  <span class="award_txt_title">
                                    성취인
                                  </span>
                                </div>
                                <div class="award_txt_bottom">
                                  <p>인간적이며 올바른 가치관에 중심을 두되, 유연한 사고, 도전정신과 열정을 가진 인재</p>
                                </div>                   
                              </div>

                              <div class="award_img">
                                <img src="/Source/Client/img/recruit1-1.svg" alt="">
                              </div>
                            </div>
              
                            <div class="Recruit_table_content_item_award">

                              <div class="award">
                                <div class="award_txt">
                                  <span class="award_txt_title">
                                    협력인
                                  </span>
                                </div>
                                <div class="award_txt_bottom">
                                  <p>상호존중, 깨끗한 매너로 신용을 지키고 다하는 예의 바른 인재</p>
                                </div>                   
                              </div>

                              <div class="award_img">
                                <img src="/Source/Client/img/recruit1-2.svg" alt="">
                              </div>
                  
                            </div>

                            <div class="Recruit_table_content_item_award">

                              <div class="award">
                                <div class="award_txt">
                                  <span class="award_txt_title">
                                    창조인
                                  </span>
                                </div>
                                <div class="award_txt_bottom">
                                  <p>현상과 문제를 장기적이고 새로운 관점에서 바라보고 분석하여 새로운 가치, 아이디어를 창출해낼 수 있는 창의적 인재</p>
                                </div>                   
                              </div>

                              <div class="award_img">
                                <img src="/Source/Client/img/recruit1-3.svg" alt="">
                              </div>
                  
                            </div>
                            <div class="Recruit_table_content_item_award">

                              <div class="award">
                                <div class="award_txt">
                                  <span class="award_txt_title">
                                    전문인
                                  </span>
                                </div>
                                <div class="award_txt_bottom">
                                  <p>기본에 충실하되, 폭넓은 교양과 자기개발로 노력하며 변화를 리드하는 전무가를 지향하는 인재</p>
                                </div>                   
                              </div>

                              <div class="award_img">
                                <img src="/Source/Client/img/recruit1-4.svg" alt="">
                              </div>
                  
                            </div>
                            <div class="Recruit_table_content_item_award">

                              <div class="award">
                                <div class="award_txt">
                                  <span class="award_txt_title">
                                    세계인
                                  </span>
                                </div>
                                <div class="award_txt_bottom">
                                  <p>문화의 다양성을 이해하고 수용하는 국제적 사고와 국제화 시대에 걸맞은 기본소양과 의사소통능력을 겸비한 글로벌 인재</p>
                                </div>                   
                              </div>

                              <div class="award_img">
                                <img src="/Source/Client/img/recruit1-5.svg" alt="">
                              </div>
                  
                            </div>
                          </div>
                        </div>
                      </div>

                      <!--하단 contnet-->
                      <div class="Recruit_table_content">
                        <div class="Recruit_table_content_inner">

                          <div class="Recruit_table_content_item_title">
                            <div class="title">
                              <div class="title_img">
                                <img src="/Source/Client/img/recruit2.svg" alt="">
                              </div>   
                              <div class="title_txt">
                                <span>복지 제도</span>
                              </div>             
                            </div>
                          </div>

    
                          <div class="Recruit_table_content_item_bottom">
                            <div class="wrap_inner">
                              <div class="item_bottom_left">                
                                <div class="number">
                                  <span>
                                    01
                                  </span>
                                </div>
                                <div class="number_title">
                                  <span>
                                    건강지원금/보험
                                  </span>
                                </div>
                                <ul class="number_title_menu">
                                  <li>- 단체상해보험</li>
                                </ul>

                                <div class="item_bottom_left_img">
                                  <img src="/Source/Client/img/recruit2-1.svg" alt="">
                                </div>
                              </div>     
  
                              <div class="item_bottom_right">                
                                <div class="number">
                                  <span>
                                    02
                                  </span>
                                </div>
                                <div class="number_title">
                                  <span>
                                    급여제도
                                  </span>
                                </div>
                                <ul class="number_title_menu">
                                  <li>- 퇴직연금</li>
                                 <%-- <li>- 장기근속자 포상(5년마다 장기근속 100만원)</li>--%>
                                  <li>- 4대보험</li>
                                  <%--<li>- 직책수당</li>
                                  <li>- 경조비</li>--%>
                                  <li>- 상여금</li>
                                </ul>

                                <div class="item_bottom_right_img">
                                  <img src="/Source/Client/img/recruit2-2.svg" alt="">
                                </div>
                              </div>     
                            </div>     
                
                            <div class="wrap_inner">
                              <div class="item_bottom_left">                
                                <div class="number">
                                  <span>
                                    03
                                  </span>
                                </div>
                                <div class="number_title">
                                  <span>
                                    선물
                                  </span>
                                </div>
                                <ul class="number_title_menu">
                                  <li>- 명절선물</li>
                                  <%--<li>- 승진 축하선물</li>
                                  <li>- 경조휴가</li>
                                  <li>- 결혼축하금 100만원</li>--%>
                                  <li>- 대학졸업 축하금 10만원</li>
                                  <%--<li>- 정보처리기사 취득 축하금 30만원</li>--%>
                                </ul>

                                <div class="item_bottom_left_img">
                                  <img src="/Source/Client/img/recruit2-3.svg" alt="">
                                </div>
                              </div>     
  
                              <div class="item_bottom_right">                
                                <div class="number">
                                  <span>
                                    04
                                  </span>
                                </div>
                                <div class="number_title">
                                  <span>
                                    교육/생활
                                  </span>
                                </div>
                                <ul class="number_title_menu">
                                  <li>- 석식지원비</li>
                                  <li>- 연간 교육 훈련비 지원</li>
                                  <li>- 분기별 팀 회식비 지원</li>
                                </ul>

                                <div class="item_bottom_right_img">
                                  <img src="/Source/Client/img/recruit2-4.svg" alt="">
                                </div>
                              </div>     
                            </div>               
                
                            <%--<div class="wrap_inner">
                              <div class="item_bottom_left">                
                                <div class="number">
                                  <span>
                                    05
                                  </span>
                                </div>
                                <div class="number_title">
                                  <span>
                                    출퇴근
                                  </span>
                                </div>
                                <ul class="number_title_menu">
                                  <li>- 자율출퇴근 (오전 7시~10시 사이 자유롭게 출퇴근)</li>
                                  <li>- 외출제도(1시간 단위 외출 가능)</li>
                                </ul>

                                <div class="item_bottom_left_img">
                                  <img src="/Source/Client/img/recruit2-5.svg" alt="">
                                </div>
                              </div>     
  
                              <div class="item_bottom_right">                
                                <div class="number">
                                  <span>
                                    06
                                  </span>
                                </div>
                                <div class="number_title">
                                  <span>
                                    근무환경
                                  </span>
                                </div>
                                <ul class="number_title_menu">
                                  <li>- 카페테리아 운영(커피머신)</li>
                                </ul>

                                <div class="item_bottom_right_img">
                                  <img src="/Source/Client/img/recruit2-6.svg" alt="">
                                </div>
                              </div>  

                            </div>--%>
                                             
                          </div>              
                        </div>
                      </div>

                      <%--경조사--%>
                      <div class="Recruit_table_content">
                          <div class="Recruit_table_content_inner">
                              <div class="Recruit_table_content_item_title">
                                  <div class="title">
                                      <div class="title_img">
                                          <img src="/Source/Client/img/recruit2.svg" alt="Alternate Text" />
                                      </div>
                                      <div class="title_txt">
                                          <span>경조휴가 규정</span>
                                      </div>
                                  </div>
                              </div>
                              <div class="Recruit_table_content_item_bottom">
                                  <div class="wrap_inner">
                                      <img src="/Source/Client/img/recruit_new_img.png" alt="Alternate Text" />
                                  </div>
                              </div>
                          </div>
                      </div>

                </div>            
            </div>
        </div>  
    </div>

</asp:Content>
