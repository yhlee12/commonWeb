<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_INFO_HISTORY.aspx.cs" Inherits="T2LHomePage.Source.Client.Info.C_INFO_HISTORY" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <!--스크립트와 스타일은 항상 이쪽 head에 반드시 입력  -->
    <!-- 스크립트 지연이 필요할경우 defer와 $(function)을 사용하자. main.aspx참조.  -->
    <style>
         /*
        table-contents안에 부터 시작함! 
        table-contents는 padding-top 걸려 있음 
        */
         .history_btn {
            position: relative;
            margin: 4rem 0;
         }

        .history_btn::before {
            display: block;
            content: "";
            width: 73.5%;
            height: 2px;
            background: #CCC;
            position: absolute;
            top: 1.1rem;
            left: 13%;
        }

        .history_btn ul {
            position: relative;
            display: table;
            width: 100%;
            table-layout: fixed;
        }

        .history_btn ul li {
            display: table-cell;
            text-align: center;
            vertical-align: top;
            text-align: center;
            padding: 0 1rem;
        }

        .history_btn ul li a {
            display: block;
            position: relative;
            padding-top: 2.6rem;
            color: #A5A5A5;
        }

        .history_btn ul li a span {
            display: block;
            box-sizing: border-box;
            padding-top: 10px;
        }

        .history_btn ul li a::before {
            width: 1.7rem;
            height: 1.7rem;
            border-radius: 50%;
            border: 0.5rem solid #A5A5A5;
        }

        .history_btn ul li a::before, .history_btn ul li a::after {
            display: block;
            content: "";
            background: #fff;
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
        }

        .history_list {
            position: relative;
            overflow: hidden;
        }

        .history_list::before {
            content: "";
            display: block;
            position: absolute;
            z-index: -1;
            left: calc(50% - 1px);
            height: 100%;
            top: 0;
            width: 2px;
            background: #C7C7C7;
            transition: .5s;
        }

        .main_title, .main_sub_title {
            text-align: center;
            position: relative;
            z-index: 3;
            background: #fff;
        }


        .main_title {
            padding-bottom: 1rem;
        }

        .main_title > span {
            color: red;
            font-weight: 700;
        }

        .history_list .history_list_line {
            display: block;
            position: absolute;
            z-index: 1;
            left: calc(50% - 1px);
            height: 0;
            top: 0;
            width: 2px;
            background: #e32a2a;
            transition: .5s;
        }

        .history_list > ul {
            position: relative;
        }

        .history_list > ul > li {
            padding: 0;
            position: relative;
            z-index: 3;
        }

        .history_list .title {
            display: block;
            color:#e32a2a;
            font-weight: 700;
            text-align: center;
            position: relative;
            padding: 2.5rem 0 4.4rem;
            background: #fff;
        }

        .history_list > ul > li.active .title::after {
            border: 0.3rem solid #e32a2a;
            animation: 500ms ease 0ms forwards 1 pulse;
        }

        .history-list .title::after {
            display: block;
            content: "";
            width: 1.2rem;
            height: 1.2rem;
            background: #fff;
            position: absolute;
            bottom: 1.2rem;
            left: 50%;
            transform: translateX(-50%);
            border: 0.3rem solid #A5A5A5;
            border-radius: 50%;
        }

        .history_list > ul > li > div {
            display: flex;
            position: relative;
            margin: 0 -6.5rem;
            padding-top: 2rem;
        }

        .history_list > ul > li:nth-of-type(odd).active .img {
            animation: cd-bounce-2 .6s;
        }

        .history_list > ul > li.active .img {
            opacity: 1;
        }

        .history_list .img {
            width: 50%;
            padding: 0 6.5rem;
            position: relative;
            float: left;
        }

        .history_list .img {
            transition: .5s .1s;
        }

        .history_list .img > span {
            display: block;
            width: 100%;
            height: auto;
        }

        .history-list .img img {
            width: 100%;
        }

        .history_list .txt {
            width: 50%;
            padding: 0 6.5rem;
            position: relative;
            float: left;
        }

        .history_list .txt .year {
            display: block;
            font-size: 24px;
            font-weight: 700;
            position: relative;
            color: #000;
            margin-bottom: 2rem;
        }

        .bullet {
            margin-top: 1rem;
        }

        .bullet > li {
            position: relative;
            padding-left: 1.2rem;
            line-height: 2.5rem;
            font-weight: 400;
            font-size: 18px;
            color: #4e4d4d;
        }

        .history_list .txt .bullet > li:last-of-type {
            margin-bottom: 0;
        }

        .bullet > li::before {
            display: block;
            content: "";
            width: 0.6rem;
            height: 2px;
            background: #555;
            position: absolute;
            top: 1.05rem;
            left: 0;
        }

        .bullet > li > span{
            font-size: 18px;
        }

        .history_list > ul > li.active .txt > div {
            opacity: 1;
            top: 0;
            padding-bottom: 10px;
        }

        /*
        pulse 효과 구현 클래서 추가해서 사용 할 것
        .pulse {
            animation: pulse-animation 2s infinite;
        }

        @keyframes pulse-animation {
            0% {
            box-shadow: 0 0 0 0px rgba(0, 0, 0, 0.2);
            }
            100% {
            box-shadow: 0 0 0 20px rgba(0, 0, 0, 0);
            }
        }
        */

        @media screen and (max-width:1024px) {
            .history_list > ul > li > div {
                padding: 0;
            }
        }

        @media screen and (max-width:768px) {
            .header-common-font {
                font-size: 24px;
            }

            .header-font {
                font-size:18px;
            }

            .history_list > ul > li > div {
                display: block;
                box-sizing: border-box;
                padding: 0 6.8rem;
            }

            .history_list .img {
                float: none;
                width: 100%;
                padding: 0;
            }
            .history_list .txt {
                float: none;
                width: 100%;
                padding: 0;
                box-sizing: border-box;
                padding: 0 1rem;
                background: #fff;
                border: 1px solid #cacaca;
                margin-top: 3rem;
            }

            .history_list > ul > li.active .txt > div {
                padding: 1rem 0;
            }

            .history_list .txt .year {
                margin-bottom: 1rem;
            }

            .history_btn {
                margin: 0;
            }

            .fixed {
                position: fixed;
                bottom: 0;
                right: 0;
                z-index: 10;
                height: 120px;
                display: flex;
                align-items: center;
                justify-content: center;
                background: #201e1e;
            }

            .history_btn::before {
                top: 2.8rem;
            }
        }
        @media screen and (max-width:425px) {
             .history_btn::before {
                top: 2.2rem;
            }
        }
         @media screen and (max-width:320px) {
             .history_btn::before {
                top: 1.7rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="sub_content">
    <div class="sub_layout">
        <div id="content">

            <div class="main_title">
                <span class=" header-common-font">T2L Co., Ltd. has been a Software Solution Provider for more than 20 years <br>and has successfully carried out numerous projects.</span><br>
            </div>

            <div class="main_sub_title">
          
                <span class="header-font">20여년간 Software Solution Provider 로서 수 많은 프로젝트를 성공적으로 수행 하여 왔습니다.</span>
            </div>

            <div class="history">
                <div class="history_btn fixed">
                <ul>
                    <li>
                    <a href="#history_first">
                        <span class="big-font">2020 - 현재</span>
                    </a>
                    </li>
                    <li>
                    <a href="#history_second">
                        <span class="big-font">2016 - 2019</span>
                    </a>
                    </li>
                    <li>
                    <a href="#history_third">
                        <span class="big-font">2011 - 2015</span>
                    </a>
                    </li>
                    <li>
                    <a href="#history_four">
                        <span class="big-font">2006 - 2010</span>
                    </a>
                    </li>
                    <li>
                    <a href="#history_last">
                        <span class="big-font">2000 - 2005</span>
                    </a>
                    </li>
                </ul>
                </div>
            </div>

            <div class="history_list">
                <span class="history_list_line" style="height: 100%;"></span>

                <ul><li id="history_first" class="active">
                        <span class="title header-common-font">
                        2020 - 현재
                        </span>

                        <div>
                            <div class="img">
                                <span>
                                <img src="/Source/Client/img/history_one.jpg" alt="">
                                </span>
                            </div>

                            <div class="txt">
                  
                                <div>
                                    <span class="year">
                                        2022
                                    </span>
                                    <ul class="bullet">
                                        <li>
                                        5월 포스코플로우 Smart 통합물류플랫폼 구축 계약
                                        </li>
                                        <li>
                                        한국관광공사 2022년 바우처사업 서비스제공기업 재선정 4개업체 수주
                                        </li>
                                        <li>
                                        한국관광공사 2022년 여행업계 디지털 전환 지원사업 서비스제공기업 재선정 8개 업체 수주
                                        </li>
                                        <li>
                                        한국여행업협동조합 발주  스마트여행서비스 모바일 앱 구축 완료 
                                        </li>
                                        <li>
                                       한국관광공사 2022년 여행업계 디지털 전환 지원사업 활용사례업체로 당사 수주  2개업체 선정  
                                        </li>
                                    </ul>
                                    <p>
                                        <br>  
                                    </p>
                                </div>

                                <div>
                                    <span class="year">
                                        2021
                                    </span>
                                    <ul class="bullet">
                                        <li>
                                        2월 현대글로비스 선사운영시스템 재구축 
                                        </li>
                                        <li>
                                        한국관광공사 2021년바우처사업 서비스제공기업 재선정 9개업체 수주
                                        </li>
                                        <li>
                                        한국관광공사 2021년 여행업계 디지털 전환 지원사업 서비스제공기업선정 5개업체 수주 
                                        </li>
                                        <li>
                                        여행시스템 ERP CRM 시스템 고도화 완료
                                        </li>
                                    </ul>
                                    <p>
                                        <br>  
                                    </p>
                                </div>

                                <div>
                                    <span class="year">
                                        2020
                                    </span>
                                    <ul class="bullet">
                                        <li>
                                        3월 롯데글로벌로지스 통합포워딩시스템 구축 참여
                                        </li>
                                        <li>
                                        6월 롯데로지스틱스 BPO 플랫폼 구축 계약
                                        </li>
                                        <li>
                                        8월 여행시스템사업부 론칭
                                        </li>
                                        <li>
                                        8월 여행시스템사업부 신설
                                        </li>
                                        <li>
                                        9월 한국관광공사2020년 관광기업혁신바우처사업 서비스제공기업선정
                                        </li>
                                        <li>
                                        11월 관광기업혁신바우처 사업 3개업체 수주
                                        </li>
                                        <li>
                                        여행시스템 신버전 출시
                                        </li>
                                        <li>
                                        롯데글로벌로지스 통합 포워딩 시스템 구축 계약
                                        </li>
                                       
                                    </ul>
                                    <p>
                                        <br>  
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>



                    <li id="history_second" class="active">
                        <span class="title header-common-font">
                        2016 - 2019
                        </span>

                        <div>
                            <div class="img">
                                <span>
                                <img src="/Source/Client/img/history_two.jpg" alt="">
                                </span>
                            </div>

                            <div class="txt">
                               
                                <div>
                                    <span class="year">
                                        2019
                                    </span>
                                    <ul class="bullet">
                                        <li>
                                        SK해운주식회사 정보시스템 유지보수
                                        </li>
                                        <li>
                                        FSK KEROL Platform'19' 상반기 운영 계약
                                        </li>
                                    </ul>
                                    <p>
                                        <br>  
                                    </p>
                                </div>

                                <div>
                                    <span class="year">
                                        2018
                                    </span>
                                    <ul class="bullet">
                                        <li>
                                        유진초저온 물류시스템 개발 계약
                                        </li>
                                        <li>
                                        에스엘네트웍스 스마트 물류플랫폼구축 계약
                                        </li>
                                        <li>
                                        현대글로비스 글로벌 통합 포워딩 PI컨설팅
                                        </li>
                                    </ul>
                                    <p>
                                        <br>  
                                    </p>
                                </div>

                                <div>
                                    <span class="year">
                                        2017
                                    </span>
                                    <ul class="bullet">
                                        <li>
                                        범주해운 고객지원 서비스(e-Service) 시스템 구축 계약
                                        </li>
                                        <li>
                                        해양수산부 컨테이너터미널 혼잡도 측정 연구과제 계약
                                        </li>
                                        <li>
                                        부산시 투자 양해각서 체결
                                        </li>
                                        <li>
                                        CJ International Asia Pte Ltd. 벌크 운항관리 시스템 고도화
                                        </li>
                                        <li>
                                        한화 S&C 종합물류정보 시스템(물류플랫폼) 구축 계약
                                        </li>
                                    </ul>
                                    <p>
                                        <br>  
                                    </p>
                                </div>

                                <div>
                                    <span class="year">
                                        2016
                                    </span>
                                    <ul class="bullet">
                                        <li>
                                        GLOVIS 통합계약시스템 고도화
                                        </li>
                                        <li>
                                        한국선주협회 전자문서/회원 관리시스템 구축 계약
                                        </li>
                                        <li>
                                        동명대학교 물류학과 인력양성 프로그램
                                        </li>
                                        <li>
                                        우성해운 WISEPLATFORM 물류플랫폼 사업 계약
                                        </li>
                                    </ul>
                                    <p>
                                        <br>  
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li id="history_third" class="active">
                        <span class="title header-common-font">
                        2011 - 2015
                        </span>

                        <div>
                        <div class="img">
                            <span>
                            <img src="/Source/Client/img/history_three.jpg" alt="">
                            </span>
                        </div>

                        <div class="txt">
                            <div>
                                <span class="year">
                                    2015
                                </span>
                                <ul class="bullet">
                                    <li>
                                    <span>
                                        CJ International Asia Pte Ltd. 벌크 운항관리시스템 구축 계약
                                    </span>
                                    </li>
                                    <li>
                                    <span>
                                        한국선주상호보험조합 추정손익 및 보험계약 증서 고도화
                                    </span>
                                    </li>
                                </ul>
                                <p>
                                    <br>  
                                </p>
                            </div>
                  
                            <div>
                                <span class="year">
                                    2014
                                </span>
                                <ul class="bullet">
                                    <li>
                                    GLOVIS 선사 2014년 고도화 계약
                                    </li>
                                    <li>
                                    GLOVIS 통합계약시스템 확대 적용 계약
                                    </li>
                                </ul>
                                <p>
                                    <br>  
                                </p>
                            </div>

                            <div>
                                <span class="year">
                                    2013
                                </span>
                                <ul class="bullet">
                                    <li>
                                    Sharp AACT 공항 터미널 시스템 개발 계약
                                    </li>
                                    <li>
                                    KLINE WBSI 시스템 계약
                                    </li>
                                    <li>
                                    GLOVIS 선사 고도화 시스템 개발 계약
                                    </li>
                                    <li>
                                    GLOVIS 통합계약시스템 전사 확대 개발 계약(내륙운송, 3PL)
                                    </li>
                                </ul>
                                <p>
                                    <br>  
                                </p>
                            </div>

                            <div>
                                <span class="year">
                                    2012
                                </span>
                                <ul class="bullet">
                                    <li>
                                    마리아나익스프레스라인즈코리아 해운대리점 시스템 구축
                                    </li>
                                    <li>
                                    장금상선 Wise Tariff System 구축
                                    </li>
                                    <li>
                                    한국선주상호보험 KPIS 고도화 (전자문서 관리)
                                    </li>
                                    <li>
                                    APL Korea Sub Site 개발
                                    </li>
                                </ul>
                                <p>
                                    <br>  
                                </p>
                            </div>

                            <div>
                                <span class="year">
                                    2011
                                </span>
                                <ul class="bullet">
                                    <li>
                                    DK에스앤드 선사 시스템 개발 계약
                                    </li>
                                    <li>
                                    현대 GLOVIS 통합 선사 시스템 개발 계약
                                    </li>
                                    <li>
                                    현대 상선 미주 TMS 모듈 개발 계약
                                    </li>
                                </ul>
                                <p>
                                    <br>  
                                </p>
                            </div>
                        </div>
                            </div>
                    </li>

                <li id="history_four" class="active">
                    <span class="title header-common-font">
                    2006 - 2010
                    </span>

                    <div>
                    <div class="img">
                        <span>
                        <img src="/Source/Client/img/history_four.jpg" alt="">
                        </span>
                    </div>

                    <div class="txt">
                        <div>
                        <span class="year">
                            2010
                        </span>
                        <ul class="bullet">
                            <li>
                            <span>
                                KPNI Line EDI 개발 계약
                            </span>
                            </li>
                            <li>
                            <span>
                                Dongbang Ferry Shipping System 개발 수주
                            </span>
                            </li>
                            <li>
                            <span>
                                SK Shipping System 개발 계약
                            </span>
                            </li>
                        </ul>
                        <p>
                            <br>  
                        </p>
                        </div>
                  
                        <div>
                        <span class="year">
                            2009
                        </span>
                        <ul class="bullet">
                            <li>
                            다이에이쉬핑 시스템 판매 및 유지보수 계약
                            </li>
                            <li>
                            SK 케미컬과 여드름치료제 사스티드 홈페이지 구축 계약
                            </li>
                            <li>
                            하나 캐피탈 렌탈 시스템 및 홈페이지 구축 계약
                            </li>
                            <li>
                            오릭스 렌탈 시스템 계약
                            </li>
                            <li>
                            MSC 코리아 홈페이지 구축 계약
                            </li>
                            <li>
                            양정분산부인과 홈페이지 리뉴얼 및 유지보수 계약
                            </li>
                        </ul>
                        <p>
                            <br>  
                        </p>
                        </div>

                        <div>
                        <span class="year">
                            2008
                        </span>
                        <ul class="bullet">
                            <li>
                            홍콩 C.C.C.S 통합 정보 시스템 개발 계약
                            </li>
                            <li>
                            대한통운과 우정사업본부 국제우편물항공운송용역사업 제안서 공동작성(540억 규모 계약 수주 성공)
                            </li>
                            <li>
                            SKC와 아토피관련 화장품 몰인 아토파인몰 온라인 판매대행 독점 계약
                            </li>
                        </ul>
                        <p>
                            <br>  
                        </p>
                        </div>

                        <div>
                        <span class="year">
                            2007
                        </span>
                        <ul class="bullet">
                            <li>
                            TY 물류 항공 창고 관리 시스템 개발 계약
                            </li>
                            <li>
                            한큐 코리아 창고관리 통합 정보 시스템 개발 계약
                            </li>
                        </ul>
                        <p>
                            <br>  
                        </p>
                        </div>

                        <div>
                        <span class="year">
                            2006
                        </span>
                        <ul class="bullet">
                            <li>
                            중국 상해 한통물류 글로벌 물류 시스템 개발 계약
                            </li>
                            <li>
                            한국선주상호보험 조합 시스템 개발 계약
                            </li>
                            <li>
                            UNION STAR 종합물류 시스템 홈페이지 개발 계약
                            </li>
                            <li>
                            코오롱 국제삼자물류 시스템 개발 계약
                            </li>
                            <li>
                            일본 대한통운 도쿄지사 복합운송 시스템 개발 계약
                            </li>
                            <li>
                            포워더 타임지와 eBook 사업 협약
                            </li>
                        </ul>
                        <p>
                            <br>  
                        </p>
                        </div>
                    </div>
                    </div>
                </li>

                    <li id="history_last" class="active">
                        <span class="title header-common-font">
                        2000 - 2005
                        </span>

                        <div>
                        <div class="img">
                            <span>
                            <img src="/Source/Client/img/history_five.jpg" alt="">
                            </span>
                        </div>

                        <div class="txt">
                            <div>
                                <span class="year">
                                    2005
                                </span>
                                <ul class="bullet">
                                    <li>
                                    <span>
                                        태영상선 통합 물류 시스템 개발 계약
                                    </span>
                                    </li>
                                    <li>
                                    <span>
                                        대한통운 EMS 시스템 개발 계약
                                    </span>
                                    </li>
                                    <li>
                                    <span>
                                        썬트란스, 카리스 해운 관리 시스템 개발 계약
                                    </span>
                                    </li>
                                    <li>
                                    <span>
                                        특송 관련업무 시스템 개발 계약(non stop exp. Mgl 물류)
                                    </span>
                                    </li>
                                    <li>
                                    <span>
                                        대한통운 육군 복지단 3자물류개발 계약
                                    </span>
                                    </li>
                                </ul>
                                <p>
                                    <br>  
                                </p>
                            </div>
                  
                            <div>
                                <span class="year">
                                    2004
                                </span>
                                <ul class="bullet">
                                    <li>
                                    STX PEN OCEAN 통합컨테이너 정보시스템 개발 계약
                                    </li>
                                    <li>
                                    대인훼리 전산 시스템 아웃소싱 계약
                                    </li>
                                    <li>
                                    KL-NET PLISM 사업 계약
                                    </li>
                                    <li>
                                    SP-IDC(해양 수산부 IDC) 사업 참여
                                    </li>
                                    <li>
                                    국가 물류 BPR 사업 참여
                                    </li>
                                    <li>
                                    MSC Korea EDI 시스템 개발 계약
                                    </li>
                                    <li>
                                    MCL 개발 계약
                                    </li>
                                    <li>
                                    우성해운 WEB ORDER 및 Door Order 개발 계약
                                    </li>
                                    <li>
                                    한로해운 시스템 개발 계약
                                    </li>
                                </ul>
                                <p>
                                    <br>  
                                </p>
                            </div>

                            <div>
                                <span class="year">
                                    2003
                                </span>
                                <ul class="bullet">
                                    <li>
                                    KLINE KOREA EDI 시스템 개발 계약
                                    </li>
                                    <li>
                                    KT&G 무역관리 시스템 개발 계약
                                    </li>
                                    <li>
                                    우성해운 통합 물류시스템 아웃소싱 계약
                                    </li>
                                    <li>
                                    동북아 허브 항만 ISP 사업 참여
                                    </li>
                                </ul>
                                <p>
                                    <br>  
                                </p>
                            </div>

                            <div>
                                <span class="year">
                                    2002
                                </span>
                                <ul class="bullet">
                                    <li>
                                    해양상선 대리점 시스템 개발 계약 및 아웃소싱 계약(SITC)
                                    </li>
                                    <li>
                                    비전해운 포워더 시스템 개발 계약 및 아웃소싱 계약(포워더)
                                    </li>
                                    <li>
                                    MCL Shipping 대리점 시스템 개발 및 아웃소싱 계약(MCL)
                                    </li>
                                    <li>
                                    B2B Doucument 활성화 사업 서비스 개시<br>
                                    (P&O NEDLOYD, 우성해운, KLINE, NYK, 장금상선, APL 등 22개 선사 가입)
                                    </li>
                                    <li>
                                    동보상선 아웃소싱 계약
                                    </li>
                                    <li>
                                    CJ-GLS 전자문서 관리 시스템 납품 계약
                                    </li>
                                    <li>
                                    우진글로벌 아웃소싱 계
                                    </li>
                                    <li>
                                    부산 감천 공영 수산물 도매시장 업무 컨설팅
                                    </li>
                                </ul>
                                <p>
                                    <br>  
                                </p>
                            </div>

                            <div>
                                <span class="year">
                                    2001
                                </span>
                                <ul class="bullet">
                                    <li>
                                    아이오아이 급여시스템 사업수주<br>
                                    (Columbus, SASCO, ISCONT, COSCO, 포워더)
                                    </li>
                                    <li>
                                    디지탈데스크라인 총판 계약 체결
                                    </li>
                                    <li>
                                    나우텍과 총판 계약 체결
                                    </li>
                                    <li>
                                    양재아이티 총판 계약 체결
                                    </li>
                                    <li>
                                    한국비즈넷 총판 계약 체결
                                    </li>
                                    <li>
                                    아이탱크 총판 계약 체결
                                    </li>
                                    <li>
                                    이다큐매니아스(eDOCUMANIAs)출시
                                    </li>
                                    <li>
                                    한솔CNS ISP 수주(한솔CSN ERP 도입을 위한 정보전략계획 구축에 대한 건)
                                    </li>
                                </ul>
                                <p>
                                    <br>  
                                </p>
                            </div>

                            <div>
                                <span class="year">
                                    2000
                                </span>
                                <ul class="bullet">
                                    <li>
                                    삼성HTH 택배 시스템 개발 계약
                                    </li>
                                    <li>
                                    우진글로벌로지스틱스 포워더 정보시스템 사업수주
                                    </li>
                                    <li>
                                    T2L 설립
                                    </li>
                                </ul>
                                <p>
                                    <br>  
                                </p>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    </div>
</div>
</asp:Content>
