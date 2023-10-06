<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="start.aspx.cs" Inherits="T2LHomePage.Source.Admin.start" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="preload" as="style" href="/Source/common/common.css?ver=<%=DateTime.Now.ToString("yyyyMMddHHmmss") %>"/>
    <link rel="preload" as="style" href="/Source/common/font.css"/>
    <link rel="stylesheet" href="/Source/common/common.css?ver=<%=DateTime.Now.ToString("yyyyMMddHHmmss") %>"/>
    <link rel="stylesheet" href="/Source/common/font.css"/>
    <link href="/Source/Admin/css/start.css?ver=2"rel="stylesheet"/>
    <script type="text/javascript" src="/js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="/js/jquery.ui.datepicker-ko.js"></script>
    <script type="text/javascript" src="/js/Logout.js"></script>
    <script defer="defer" type="text/javascript" src="/js/menu.js?ver=3" ></script>
    <title>T2L::직원전용 홈페이지</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="hidden-panel">
        <input type="text" name="flag" id="flag" value="" />
    </div>
    <div id="wrap" class="type-parent">
        <div id="content" class="type-parent">
             <div id="content-header" class="type-parent">
                <div id="blockofText" class="type-parent">
                    <span class="type-child-center header-big-font bold brush-font">T2L</span>
                </div>
                <div id="logout" class="clears">
                    <a href="#" id="logoutClick" runat="server" onserverclick="logoutClick_ServerClick">로그아웃</a>
                </div>
            </div>
            <div id="left-side">
                <div id="user-info-field">
                    <span class="lower-font"><%=baseUser.USER_NAME %> 님</span>
                    <span class="lower-font">반갑습니다.</span>
                </div>
                <div id="left-menu">
                    <%foreach(var item in MenuList){ %>
                    <div class="big-menu middle-font" data-sub-key="<%=item.Value.key %>" data-key="<%=item.Value.key %>" data-sub-menu="<%=(item.Value.subMenu != null && item.Value.subMenu.Count > 0) ? "Y":"N" %>" data-path="/Source/Admin/<%=item.Value.path %>">
                        <%=item.Value.title %>
                    </div>
                        <%if(item.Value.subMenu != null && item.Value.subMenu.Count > 0){ %>
                        <div class="sub-menu-wraper" data-sub-key="<%=item.Value.key %>">
                            <%foreach(var subitem in item.Value.subMenu){ %>
                                <div class="sub-menu lower-font <%=subitem.showFlag == false ? "hideSub" : "" %>" data-path="/Source/Admin/<%=subitem.path %>" data-key="<%=subitem.key %>">
                                    <%=subitem.title %>
                                </div>
                            <%} %>
                        </div>
                        <%} %>
                    <%} %>
                </div>
            </div>
            <div id="inner-content" class="type-parent">
                <div id="tab-box">
                    <ul id="tab-ul" class="clears"></ul>
                </div>
                <div id="inner-contents">
                    <div class="inner-iframe-div"></div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
