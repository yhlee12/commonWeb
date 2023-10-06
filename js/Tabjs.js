//Tab & menu js
function leftmenuClick(URL, PARAM, MENU_NAME, MENU_SID, MENU_CODE, FLAG) {
    var tabCount = 0;
    tabCount = $("#tab-ul").children('li').length;
    
    if (tabCount > 10) {
        alert("10개이상의 tab을 추가하실수 없습니다.");
        return;
    }
    else {
        var boolTab = true;
        var openSrc = URL + PARAM;
        //기존에 열려있는가 확인
        $(".iframe-tab").each(function (index, item) {
            var TAB_MENU_SID = $(item).attr('id') + "";
            if (TAB_MENU_SID == (MENU_SID + "")) {
                boolTab = false;
            }
        });
        //열려있는게 없을때
        if (boolTab == true) {
            //tab setting
            $("#tab-ul").children('li').removeClass('tab-li-on');
            var tabHtml = "";
            tabHtml += '<li id="' + MENU_SID + '_TAB" class="lower-font type-parent tab-li-on">';
            tabHtml += '    <div class="tab-li-inner-text" onclick="ShowTab(this,\'' + MENU_SID + '\')">' + MENU_NAME + '</div>';
            tabHtml += '    <div class="tab-li-xbtn" onclick="closeData(this,\'' + MENU_SID + '\');"><img src="/Source/image/blackX.png"/></div>';
            tabHtml += '    <div class="tab-li-xbtnSub" onclick="closeDataSub(this,\'' + MENU_SID + '\');"><img src="/Source/image/blackX.png"/></div>';
            tabHtml += '    <input type="hidden" class="menu-hdinput" id="'+MENU_CODE+'" value="' + MENU_CODE + '" >';
            tabHtml += '</li>';
            $("#tab-ul").append(tabHtml);
            //iframe Setting
            $(".iframe-tab").hide();
            var iframeHtml = "";
            iframeHtml += '<iframe id="' + MENU_SID + '" src="' + openSrc + '"  class="iframe-tab"></iframe>';
            $(".inner-iframe-div").append(iframeHtml);
        }
        else//열려있는것이 있을때
        {
            //새로고침을 할 경우
            if (FLAG == "Y") {
                $("#" + MENU_SID).attr('src', openSrc);
            }
            $("#tab-ul").children('li').removeClass('tab-li-on');
            $("#" + MENU_SID + "_TAB").addClass('tab-li-on');
            $(".iframe-tab").hide();
            $("#" + MENU_SID).show();
        }
    }
}
//중메뉴가 있는 경우 중메뉴 OPEN
function showData(obj, sid) {
    if (($("#" + sid + "_SUB").css('display') + "") == "none") {
        $(obj).parent().addClass('top-menu-on');
        $("#" + sid + "_SUB").slideDown();
        $("#" + sid + "_ARROW").html("<img src='/Source/image/menu_up_arrow.png'/>");
    }
    else {
        $(obj).parent().removeClass('top-menu-on');
        $("#" + sid + "_SUB").slideUp();
        $("#" + sid + "_ARROW").html("<img src='/Source/image/menu_down_arrow.png'/>");
    }
}

function closeData(obj, sid) {
    var thisIndex = 0;
    $(".iframe-tab").each(function (index, item) {
        if (($(item).attr('id') + "") == sid) {
            thisIndex = index;
        }
    });

    var nextindex = thisIndex - 1;
    if ($(".iframe-tab").eq(nextindex).length > 0) {
        $("#tab-ul").children('li').removeClass('tab-li-on');
        $("#" + $(".iframe-tab").eq(nextindex).attr('id') + "_TAB").addClass('tab-li-on');
        $(".iframe-tab").eq(nextindex).show();
    }
    $(obj).parent().remove();
    $("#" + sid).remove();
}

function closeDataSub(obj, sid) {
    var thisIndex = 0;
    $(".iframe-tab").each(function (index, item) {
        if (($(item).attr('id') + "") == sid) {
            thisIndex = index;
        }
    });

    $(obj).parent().remove();
    $("#" + sid).remove();
}

function ShowTab(obj, sid) {
    $("#tab-ul").children('li').removeClass('tab-li-on');
    $(obj).parent().addClass('tab-li-on');
    $(".iframe-tab").hide();
    $("#" + sid).show();
}

function closeSelf(sid) {
    //var thisIndex = 0;
    //$(".iframe-tab").each(function (index, item) {
    //    if (($(item).attr('id') + "") == sid) {
    //        thisIndex = index;
    //    }
    //});

    //var previndex = previndex - 1;
    //if ($(".iframe-tab").eq(previndex).length > 0) {
    //    $("#tab-ul").children('li').removeClass('tab-li-on');
    //    $("#" + $(".iframe-tab").eq(previndex).attr('id') + "_TAB").addClass('tab-li-on');
    //    $(".iframe-tab").eq(previndex).show();
    //}

    $("#" + sid + "_TAB").remove();
    $("#" + sid).remove();
}

function findMENUCODEClick(MENU_CODE, FLAG, PARAM)
{
    URL = $("#" + MENU_CODE + "_URL").val();
    MENU_SID = $("#" + MENU_CODE + "_SID").val();
    MENU_NAME = $("#" + MENU_CODE + "_NAME").val();
    console.log(URL + "/" + MENU_SID + "/" + MENU_NAME);
    leftmenuClick(URL, PARAM, MENU_NAME, MENU_SID, MENU_CODE, FLAG);
}
