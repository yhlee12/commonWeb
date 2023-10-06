<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_COMPANY_THINK.aspx.cs" Inherits="T2LHomePage.Source.Client.Company.C_COMPANY_THINK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <style>
        img {
            width: 100%;
        }
        #sub_content{
            padding: 0rem 0 15rem;
        }
        .sub_layout1{
            width:100%;            
            box-sizing: border-box;
            padding: 7rem 0 7rem 0;
        }

        .sub_layout2{
            width:100%;   
            box-sizing:border-box;
            padding: 5rem 0;background-color:#e3e0e0;
            
        }
        .sub_layout3{
            width:100%;
            box-sizing: border-box;
            padding: 10rem 0 0 0;
                      
        }
        .section1{
            width: 57vw;
            text-align:left;
            margin: 0 auto;
        }
        .section2{
            width: 57vw;
            text-align:left;
            margin: 0 auto;
        }
        .section3{
            display: flex;
            flex-wrap: nowrap;
            width: 57vw;
            padding: 0 0 50px 0;
            margin: 0 auto;      
            justify-content: space-between;      
        }
        .section4{
            display: flex;
            flex-wrap: nowrap;
            justify-content: flex-end;

            width: 57vw;
            padding: 16vw 0 5vw 0;            
            margin: 0 auto;

            background-image:url("/Source/Client/img/history_first_img.jpg");
            background-size: 100%;
            background-repeat:no-repeat;
            box-sizing:border-box;
        }
        .think_text1{
            font-weight:bold;
        }
        .think_text2{
            font-weight:700;
            padding-top:20px;
            line-height: 1.8rem;
        }
        .boxbox{
            width: 15vw;
            margin: 0 0 0 0;
        }
        .boxinner1{
           
            
        }
        .boxinner2{
            font-size:22px;
            padding: 1rem 0;
            font-weight: 700;

        }
        .boxinner3{
            font-size:18px;
            padding: 0.5rem 0;
        }
        .boxinner4{
            font-size:14px;
            line-height:1.6rem;
        }
        .imginner_box{
            /*문구 만들어지면 none제거 할 것*/
            display:none;
            background-color:white;
            width:50vw;
            padding: 2vw;
        }
        .material-symbols-outlined {
            

        }
        .material-font {
            font-size:80px;
        }
        @media screen and (max-width:768px){
            .section4{
                width:100%;
            }
            .imginner_box{
                width: 75vw;
            }
            .sub_layout3{
                padding: 7rem 0 0 0;
            }
        }
        @media screen and (max-width:426px){
            .section3{
                flex-direction: column;
                width: 76vw;
            }
            .section4{
                background-size: cover;
                background-position: center center;
                background-repeat: no-repeat;
            }
            .boxbox{
                display: flex;
                width: 100%;
                padding: 5vw 0;
                align-items: center;
                justify-content: center;
            }
            .innertxt{
                padding: 0 0 0 3vw;
            }
            .sub_layout3 {
                padding: 3rem 0 0 0;

            }
            
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sub_content">
        <div class="sub_layout1">          
              <div class="section1">
                  <div class="think_text1 header-common-font">경영이념</div>
                  <div class="think_text2 common-font">We share the future together.</div>
              </div>
            
        </div>
        <div class="sub_layout2">                        
            <div class="section2">                                
                <div class="think_text1 header-common-font">티투엘의 도전은 무한합니다.</div>                               
                <div class="think_text2 common-font">
                    새로운 미래를 위한 끝없는 도전과 창의적 사고로 IT프론티어의 꿈을 실현합니다.<br /> 종합 솔루션 기업으로서의 성장을 위하여 전문인력 육성 및 글로벌 네트워크 구축으로 고객의 가치를 높이겠습니다.
                </div>
            </div>
        </div>
        <div class="sub_layout3">

            <div class="section3">
                <div class="boxbox">                    
                    <div class="boxinner1">
                        <span class="material-symbols-outlined material-font">groups</span>
                    </div>
                    <div class="innertxt">
                        <div class="boxinner2">Sincerity</div>  
                                         
                        <div class="boxinner4">고객만족 실현기업 구성원들이 지니고 있는 역량과 자원을 집중해 고품질의 서비스를 제공함으로써, 고객만족을 실현하며 신뢰받는 기업이 되도록 노력할 것입니다.</div>
                    </div>

                </div>
                <div class="boxbox">                    
                    <div class="boxinner1">
                        <span class="material-symbols-outlined material-font">paid</span>
                    </div>
                    <div class="innertxt">
                        <div class="boxinner2">Creation</div>  
                                        
                        <div class="boxinner4">창조하는 기업안으로는 기업을 위해 밖으로는 몸담고 있는 시장과 국가를 위해 새로운 지식과 기술을 습득하고 적용하여 창조하는 일에 더욱 매진할 것입니다.</div>
                    </div>
                </div>
                <div class="boxbox">                    
                    <div class="boxinner1">
                        <span class="material-symbols-outlined material-font">add_business</span>
                    </div>
                    <div class="innertxt">
                        <div class="boxinner2">Confidence</div>  
                
                        <div class="boxinner4">신뢰할수 있는 기업고객과 기업의 유기적 관계는 상호 신뢰에 의해 유지되는 것임을 믿고, 그 신뢰를 더욱 공고히 할 것입니다.</div>
                    </div>

                </div>

            </div> 
            <div class="section4">
                    <div class="imginner_box">
                        <div class="think_text1 header-common-font">큰 글입니다.</div>
                        <div class="think_text2 common-font">작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.작은 글입니다.</div>
                    </div>

            
            </div>

        </div>
            
        </div>
</asp:Content>
