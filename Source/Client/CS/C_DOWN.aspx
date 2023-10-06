<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_DOWN.aspx.cs" Inherits="T2LHomePage.Source.Client.CS.C_DOWN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
    .down_wrap {
        text-align: center;
    }
    .download-list dt {
        margin-top:20px;
        font-size:18px;
        font-weight:bold;
        color: #0074a3;
    }
    .download-list dd {
        padding:8px 8px 14px 8px;
        border-bottom:1px solid #e0e0e0;
    }
    .download-list dd p {
        line-height:180%;
    }
    .download-list .description {
        font-size:14px;
        color: #333333;
    }
    .download-list .version {
        font-size:12px;
        font-weight:normal;
        color: #a1a19d;
    }
    .download-list .download {
        font-size:14px;
        font-weight:normal;
        color: #0074a3;
    }
    .download-list .download a {
        font-size:14px;
        color:#0074a3;
        text-decoration:none;
    }
     /*정현*/

    .download_title_txt  {
        font-weight: bold;
        text-align: center;
        padding:10px;
        user-select: none;
    }
    .download_sub_txt {
        text-align: center;
        margin-bottom: 50px;
        user-select: none;
    }
    .download_area {
        width:100%;
        min-width:320px;
        box-sizing: border-box;
        text-align: center;

        display: grid;
        grid-template-columns: repeat(5, 1fr);
        gap: 40px 40px;

    }
    .download_content {
        width:100%;
        min-width:200px;
        padding:20px;
        border: 1px solid #DDD;
        word-break: keep-all;

    }
    .download_icon {
         font-size: 60px;
         height: 75px;
         cursor:pointer;

    }
    .download_content_info {
        cursor:default;
        padding: 15px 0px;
        font-weight: 600;
    }
    .download_content_sub_info {
        cursor:default;
        padding:2px;
    }

      .download_icon:hover {
        font-size: 70px;
        transition: font-size 0.3s;
    }
        .download_icon:hover ~ .download_content{
             box-shadow: 0px 0px 8px rgba(0,0,0,0.5);
        transition: box-shadow 0.3s ease-in-out;
        }



      /* 반응형*/
    @media screen and (max-width: 1190px) {
        .download_area {
           grid-template-columns: repeat(4, 1fr);
        }
   
    }
     @media screen and (max-width: 915px) {
        .download_area {
           grid-template-columns: repeat(3, 1fr);
        }
   
    }
      @media screen and (max-width: 685px) {
        .download_area {
           grid-template-columns: repeat(2, 1fr);
        }
   
    }
       @media screen and (max-width: 500px) {
        .download_area {
           grid-template-columns: repeat(1, 1fr);
        }
        .download_content,.download_area {
            min-width:256px;
        }
   
    }


</style>
    <script>
        function f_howto_excel_upload() {
            document.getElementById('if_how_to_excel_upload').src = "/content/downloads/howtoexcelupload_freightadvisor.pdf";

            if (if_how_to_excel_upload.style.display == '') {
                if_how_to_excel_upload.style.display = 'none';
            }
            else {
                if_how_to_excel_upload.style.display = '';
            }
        }
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id ="sub_content">
    <div class="sub_layout">
         <div id="content">
             <div class="download_title_txt main_tltle_font">다운로드 안내</div>
             <div class="download_sub_txt middle_font"> 
                 <span>컨텐츠는 </span>
                 <span style="color: #25b0e0; font-weight: 600;">&#39;다운로드 아이콘 클릭&#39;</span>
                 <span>을 통해 다운로드 및 다운로드 링크로 이동이 가능합니다.</span>

             </div>

             <div class="download_area">

                 <div class="download_content">
                     <a href="http://211.43.207.38:8888/deploy/deploy.html" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
        
                     <div class="download_content_info common_font">WISEPLATFORM_M</div>
                     <div class="download_content_sub_info small_font">WISEPLATFORM C/S Version</div>
                 </div>

                 <div class="download_content">
                     <a href="http://211.43.207.68:8889/deploy/deploy.html" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">WISEPLATFORM_Maria</div>
                     <div class="download_content_sub_info small_font">(Release Version:2.0)</div>
                 </div>

                 <div class="download_content">
                     <a href="http://211.43.207.68:8889/deploy/devexpress15.2/setup_devexpress15_2.exe" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">Devexpress 15.2 Setup</div>
                     <div class="download_content_sub_info small_font">WISE PLATFORM 및 Shipping Gate의 Basement UI Components</div>
                 </div>

                 <div class="download_content">
                     <div class="download_content_wrap"> <%--여기만 테스트로 download_content_wrap 존재--%>
                        <a href="http://www.ittplatform.com" target="_new"><span  class="download_icon material-icons-outlined">download</span></a>
                        <div class="download_content_info common_font">ITT Platform</div>
                        <div class="download_content_sub_info small_font">ITT Platform Web</div>
                    </div>
                 </div>

       
                 <div class="download_content">
                     <a href="http://deploy.kline.co.kr/deploy/setup.exe" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     
                     <div  class="download_content_info common_font">KOCOA-LINER SYSTEM</div>
                    <div class="download_content_sub_info small_font">(Release Version:2.0)</div>

                 </div>

                 <div class="download_content">
                     <a href="http://wiseoffer.t2l.co.kr/deploy/setup.exe" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>

                     <div class="download_content_info common_font">WISE OFFER SYSTEM</div>
                     <div class="download_content_sub_info small_font">(Release Version: 2.0)</div>
                 </div>

                 <div class="download_content">
                    <a href="http://wiseoffice.t2l.co.kr/" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     
                     <div class="download_content_info common_font">WISE OFFICE</div>
                     <div class="download_content_sub_info small_font">(Release Version: )</div>
                 </div>

                 <div class="download_content"> 
                     <a href="http://211.174.239.151:7877" target="_new"> <%--웹사이트 이동관련 아이콘 고려해볼것--%>
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     
                     <div class="download_content_info common_font">SMART RFx SYSTEM</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>





                  <div class="download_content"> 
                    <a href="/content/downloads/tplsSetup.exe" runat="server" onserverclick="download_tplsSetup">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">BULK SYSTEMU</div>
                     <div class="download_content_sub_info small_font">BULK SYSTEMU PROGRAM</div>
                 </div>


                 <div class="download_content"> 
                    <a href="/content/downloads/BOMS_Manual_v1.01.pptx" runat="server" onserverclick="download_tpls_MANUAL">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">BULK SYSTEMU MANUAL</div>
                     <div class="download_content_sub_info small_font">BULK SYSTEMU MANUAL PPT</div>
                 </div>






                  <div class="download_content"> 
                     <a href="http://115.68.17.28:7787/deploy/setup.exe" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">Honeymoon SYSTEM</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                 <div class="download_content"> 
                    <a href="http://211.174.239.151:8888/deploy/setup.exe" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">DaDa WISEPLATFORM</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                 <div class="download_content"> 
                    <a href="http://cargo.yslogistics.co.kr" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">WISE W</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                 <div class="download_content"> 
                    <a href="http://www.ratehowmuch.com" runat="server" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">RATEHOWMUCH</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                 
                 
                 <div class="download_content">
                     <a href="/content/downloads/app-release.apk" runat="server">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">WISEPLATFORM_M Dongbang</div>
                     <div class="download_content_sub_info small_font">쉬핑데일리 - Android App<br/>Google Play "쉬핑데일리" 검색하여 설치가능</div>
                 </div>
                 
                 <div class="download_content">
                     <a href="http://211.174.239.151:8888" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">TPLS Maintenance Board</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                 <div class="download_content">
                     <a href="http://210.222.64.12/pan/pageLink.pcl?link=index" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">범주해운 홈페이지</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                 <div class="download_content">
                     <a href="http://211.174.239.225/" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">범주해운 모바일</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                  <div class="download_content">
                    <a href="../../SetupFile/Wiseplatform_WMS_Mobile.zip" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">Wiseplatform_WMS_Mobile</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                 <div class="download_content">
                    <a href="http://www.shippinggate.com:8081" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">New Shippinggate</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                  <div class="download_content">
                    <a href="http://211.174.239.151:9191/qr.asp" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">WiseOffice-QR(기수)</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                 <div class="download_content">
                    <a href="http://deploy2.shippinggate.com:8889/TUAC_BOMS/tplsSetup.exe" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">TUAC_HALLA(동명대) TPLS Setup</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                 <div class="download_content">
                    <a href="http://deploy2.shippinggate.com:8889/tuac_t2l/deploy.html" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">WisePlatForm_TUAC/T2L</div>
                     <div class="download_content_sub_info small_font"></div>
                 </div>
                 <div class="download_content">
                    <a href="http://211.43.207.14:8889/deploy/AccessDatabaseEngine.exe" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">Oracle Excel 32</div>
                     <div class="download_content_sub_info small_font">AccessDatabaseEngine_X32</div>
                 </div>

                 <div class="download_content">
                    <a href="http://211.43.207.14:8889/deploy/AccessDatabaseEngine_X64.exe" target="_new">
                         <span class="download_icon material-icons-outlined">download</span>
                     </a>
                     <div class="download_content_info common_font">Oracle Excel 64</div>
                     <div class="download_content_sub_info small_font">AccessDatabaseEngine_X64</div>
                 </div>


             </div>


        </div>
    </div>
</div>

<%--    <div class="down_wrap">
    <dl class="download-list">
        <dt>ITT Platformp</dt>
        <dd>
            <p class="description">ITT Platform</p>         
            <p class="download"><a href="http://www.ittplatform.com" target="_new">바로가기</a></p>
        </dd>
        <dt>KOCOA-LINER SYSTEM</dt>
        <dd>
            <p class="version">(Release Version:2.0)</p>
            <p class="download"><a href="http://deploy.kline.co.kr/deploy/setup.exe" target="_new">download</a></p>
        </dd>
        <dt>WISE OFFER SYSTEM</dt>
        <dd>
            <p class="version">(Release Version: 2.0)</p>
            <p class="download"><a href="http://wiseoffer.t2l.co.kr/deploy/setup.exe" target="_new">download</a></p>
        </dd>
        <dt>WISE OFFICE</dt>
        <dd>
            <p class="version">(Release Version: )</p>
            <p class="download"><a href="http://wiseoffice.t2l.co.kr/" target="_new">download</a></p>
        </dd>
        <dt>SMART RFx SYSTEM </dt>
        <dd>
            <p class="download" onclick="f_howto_excel_upload();"><a href="http://211.174.239.151:7877" >How to excel upload</a></p>
            <iframe id="if_how_to_excel_upload" style="display:none; " width="100%" height="500" frameborder="0" border="0" src=""></iframe>
        </dd>
        <dt>BULK SYSTEMU</dt>
        <dd>
            <p class="version">(Release Version: )</p>
            <p class="download"><a href="../../SetupFile/tplsSetup.exe" target="_new">download</a></p>
        </dd>
        <dt>Honeymoon SYSTEM</dt>
        <dd>
            <p class="version">(Release Version: )</p>
            <p class="download"><a href="http://115.68.17.28:7787/deploy/setup.exe" target="_new">download</a></p>
        </dd>
        <dt>DaDa WISEPLATFORM</dt>
        <dd>
            <p class="version">(Release Version: )</p>
            <p class="download"><a href="http://211.174.239.151:8888/deploy/setup.exe" target="_new">Go to Site</a></p>
        </dd>
        <dt>WISE W</dt>
        <dd>
            <p class="version">(Release Version: )</p>        
            <p class="download"><a href="http://cargo.yslogistics.co.kr" target="_new">Go to Site</a></p>
        </dd>
        <dt>RATEHOWMUCH</dt>
        <dd>
            <p class="version">(Release Version: )</p>
            <p class="download"><a href="http://www.ratehowmuch.com" runat="server">download</a></p>
        </dd>
        <dt> WISEPLATFORM_M</dt>
        <dd>
            <p class="version">(Release Version: )</p>
            <p class="download"><a href="http://211.43.207.38:8888/deploy/deploy.html" target="_new">Go to Site</a></p>
        </dd>
        <dt> WISEPLATFORM_Maria</dt>
        <dd>
            <p class="version">(Release Version: 1.0)</p>
            <p class="download"><a href="http://211.43.207.68:8889/deploy/deploy.html" target="_new">Go to Site</a></p>
        </dd>
        <dt> WISEPLATFORM_M Dongbang</dt>
        <dd>
            <p class="description">쉬핑데일리 - Android App</p>
            <p class="description">Google Play "쉬핑데일리" 검색하여 설치가능</p>
            <p class="download"><a href="/content/downloads/app-release.apk" runat="server">설치하기</a></p>

        </dd>

        <dt>Devexpress 15.2 Setup</dt>
        <dd>
            <p class="description">Devexpress UI Components</p>
            <p class="description">WISE PLATFORM 및 Shipping Gate의 Basement UI Components</p>
            <p class="download"><a href="http://211.43.207.68:8889/deploy/devexpress15.2/setup_devexpress15_2.exe" target="_new">설치하기</a></p>
        </dd>

        <dt>TPLS Maintenance Board</dt>
        <dd>
            <p class="description">Devexpress UI Components</p>
            <p class="download"><a href="http://211.174.239.151:8888" target="_new">설치하기</a></p>
        </dd>

        <dt> 범주해운 홈페이지</dt>
        <dd>
            <p class="description">Devexpress UI Components</p>
            <p class="download"><a href="http://210.222.64.12/pan/pageLink.pcl?link=index" target="_new">방문하기</a></p>
        </dd>

        <dt> 범주해운 모바일</dt>
        <dd>
            <p class="description">Devexpress UI Components</p>
            <p class="download"><a href="http://211.174.239.225/" target="_new">방문하기</a></p>
        </dd>

        <dt> Wiseplatform_WMS_Mobile</dt>
        <dd>
            <p class="description">Devexpress UI Components</p>
            <p class="download"><a href="../../SetupFile/Wiseplatform_WMS_Mobile.zip" target="_new">방문하기</a></p>
        </dd>

        <dt> New Shippinggate</dt>
        <dd>
            <p class="description">Devexpress UI Components</p>
            <p class="download"><a href="http://www.shippinggate.com:8081" target="_new">방문하기</a></p>
        </dd>

        <dt>WiseOffice-QR(기수)</dt>
        <dd>
            <p class="description">Devexpress UI Components</p>
            <p class="download"><a href="http://211.174.239.151:9191/qr.asp" target="_new">설치하기</a></p>
        </dd>

        <dt>TUAC_HALLA(동명대) tplsSetup</dt>
        <dd>
            <p class="description">Devexpress UI Components</p>
            <p class="download"><a href="http://deploy2.shippinggate.com:8889/TUAC_BOMS/tplsSetup.exe" target="_new">설치하기</a></p>
        </dd>

        <dt>WisePlatForm_TUAC/T2L</dt>
        <dd>
            <p class="description">Devexpress UI Components</p>
            <p class="download"><a href="http://deploy2.shippinggate.com:8889/tuac_t2l/deploy.html" target="_new">설치하기</a></p>
        </dd>

        <dt>Oracle Excel 32</dt>
        <dd>
            <p class="description">Devexpress UI Components</p>
            <p class="download"><a href="http://211.43.207.14:8889/deploy/AccessDatabaseEngine.exe" target="_new">설치하기</a></p>
        </dd>

        <dt>Oracle Excel 64</dt>
        <dd>
            <p class="description">Devexpress UI Components</p>
            <p class="download"><a href="http://211.43.207.14:8889/deploy/AccessDatabaseEngine_X64.exe" target="_new">설치하기</a></p>
        </dd>
    </dl>
</div>--%>
</asp:Content>
