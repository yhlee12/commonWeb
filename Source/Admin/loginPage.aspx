<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="T2LHomePage.Source.Admin.loginPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="preload" as="style" href="/Source/common/common.css?ver=<%=DateTime.Now.ToString("yyyyMMddHHmmss") %>"/>
    <link rel="preload" as="style" href="/Source/common/font.css"/>
    <link rel="stylesheet" href="/Source/common/common.css?ver=<%=DateTime.Now.ToString("yyyyMMddHHmmss") %>"/>
    <link rel="stylesheet" href="/Source/common/font.css"/>
    <link href="/Source/Admin/css/loginPage.css"rel="stylesheet"/>
    <script type="text/javascript" src="/js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="/js/jquery.ui.datepicker-ko.js"></script>
    <title>T2L::직원전용 홈페이지</title>
    <script>
        let $result_status = '<%=result_status%>';
        let $result_message = '<%=result_message%>';
        let $flag = '<%=flag%>';

        //사용하는 VS STUDIO가 2013이기에 람다식이 에러로 표시하므로 람다식은 우선 쓰지않음...
        //경고 문
        if ($result_status == 'Y') {
            alert($result_message);
        }
        //document add event..
        $(function () {
            //login btn click
            $('.login-btn').on('click', function (e) {
                if (validationChecker()) {
                    $('#flag').val('login');
                    $("#form1").submit();
                }
            });

            $('input[name="USER_PASSWORD"]').on('keyup', function (key) {
                if (key.keyCode == 13) {
                    if (validationChecker()) {
                        $('#flag').val('login');
                        $("#form1").submit();
                    }
                }
            });

            $('input[name="USER_ID"]').on('keyup', function (key) {
                if (key.keyCode == 13) {
                    if (validationChecker()) {
                        $('#flag').val('login');
                        $("#form1").submit();
                    }
                }
            });

            $('.list-go-btn').children('span').on('click', function () {
                document.location.href = '/Source/Client/Main.aspx';
            });
        });

        function validationChecker() {
            if ($('input[name="USER_ID"]').val() + "" == "") {
                alert('아이디를 입력해주세요.');
                return false;
            }
            if ($('input[name="USER_PASSWORD"]').val() + "" == "") {
                alert('비밀번호를 입력해주세요.');
                return false;
            }
            return true;
        }
    </script>
    <style>
        .list-go-btn{
            width:100%;
            padding:12px 0 4px 0;
            text-align:center;
            color:#808080;
        }
        .list-go-btn > span{
            text-decoration:underline;
            cursor:pointer;
        }
        .id-password-info{
            font-size:32px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="hidden-panel">
        <input type="text" name="flag" id="flag" value="" />
    </div>
    <div id="wrap" class="type-parent">
        <div class="id-password-wrap">
            <div class="id-password-image">
                <img src="/image/t2l_logo1.png"/>
            </div>
            <div class="id-password-info big-font bold brush-font">
                직원 관리자 페이지
            </div>
            <div class="id-password-content">
                <div class="id-password-content-title bold">
                    <span class="middle-font">로그인</span>
                </div>
                <div class="id-password-input-wrap">
                    <span class="material-icons idPassword-icon">face</span>
                    <input type="text" name="USER_ID" class="id-password-input lower-font" value="" maxlength="20" placeholder="아이디"/>
                </div>
                <div class="id-password-input-wrap">
                    <span class="material-icons idPassword-icon">lock_open</span>
                    <input type="password" name="USER_PASSWORD" class="id-password-input lower-font" value="" maxlength="50" placeholder="패스워드"/>
                </div>
            </div>
            <div class="id-password-btn">
                <div class="login-btn middle-font">로그인</div>
            </div>
            <div class="list-go-btn">
                <span class="lowerst-font">T2L로 돌아가기</span>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
