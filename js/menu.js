/// <reference path="jquery-2.2.4.min.js" />
//Tabjs.js 이전것 참고용. 개편처리 완료 2022 9 26 KSM
//Menu Toggle Click
$('.big-menu').on('click', function (e) {
    let subMenuFlag = $(this).data('subMenu');
    let subKey = $(this).data('subKey');
    let key = $(this).data('key');
    if (subMenuFlag == "Y") {
        let subKey = $(this).data('subKey');
        $(this).toggleClass('big-menu-active');
        $('.sub-menu-wraper').each(function (index, item) {
            if ($(item).data('subKey') == subKey) {
                $(item).slideToggle();
            }
        });
    } else {
        let path = $(this).data('path');
        let title = $.trim($(this).text());
        addTabAndShowIf(path, title, key);
    }
});

$('.sub-menu').on('click', function (e) {
    let path = $(this).data('path');
    let title = $.trim($(this).text());
    let key = $(this).data('key');
    addTabAndShowIf(path, title, key);
});
//Show Tab
function addTabAndShowIf(path, title, key, param, refresh) {
    var realPath;
    if (param != null && param != undefined && param != '') {
        realPath = path+".aspx" + param;
    } else {
        realPath = path+".aspx";
    }

    if ($("#tab-ul").children('li').length >= 10) {
        alert('10개이상 페이지를 열수 없습니다.');
        return;
    }
    //기존 Tab Open
    if ($('[data-path-key="' + key + '"]').length > 0) {
        $('.tab-li-on').removeClass('tab-li-on');
        $('[data-path-key="' + key + '"]').addClass('tab-li-on');
        $('.iframe-tab').each(function (index, item) {
            $(item).hide();
        });
        //기존 Tab Open Refresh
        if (refresh != null && refresh != undefined && refresh != '') {
            $('#IF' + key).attr('src', realPath);
        }
        $('#IF' + key).show();
        return;
    }
    //새롭게 생성
    var template = $('<li class="lower-font type-parent tab-li-on" data-path-key="' + key + '"><div class="tab-li-inner-text"></div><div class="tab-li-xbtn"><span class="material-icons lower-font">close</span></div><div class="tab-li-xbtnSub"><span class="material-icons lower-font">close</span></div></li>');
    template.children('.tab-li-inner-text').text(title);
    template.children('.tab-li-inner-text').on('click', function () {
        openAndShowTab(key, this);
    });
    template.children('.tab-li-xbtn').on('click', function () {
        closeNowTab(key, this);
    });
    template.children('.tab-li-xbtnSub').on('click', function () {
        closeNowTab(key, this);
    });
    $('.tab-li-on').removeClass('tab-li-on');
    $("#tab-ul").append(template);

    var iframe = $('<iframe class="iframe-tab"></iframe>');
    iframe.attr('src', realPath);
    iframe.attr('id', 'IF' + key);
    $('.iframe-tab').each(function (index, item) {
        $(item).hide();
    });
    $(".inner-iframe-div").append(iframe);
}
//Close Tab 항상 꺼진것 왼쪽꺼를 보여줌
//가장 앞일경우 오른쪽
function closeNowTab(title, obj) {
    let keyPath = $(obj).parent().data('pathKey');
    let nowIndex = 0;
    $('.tab-li-on').removeClass('tab-li-on');
    $("#tab-ul").children('li').each(function (index, item) {
        if ($(item).data('pathKey') + "" == keyPath + "") {
            nowIndex = index;
        }
    });
    if (nowIndex == 0 && $("#tab-ul").children('li').length > 1) {
        $("#tab-ul").children('li').eq(nowIndex + 1).addClass('tab-li-on');
        $('.iframe-tab').each(function (index, item) {
            $(item).hide();
        });
        $("#IF" + $("#tab-ul").children('li').eq(nowIndex + 1).data('pathKey')).show();
    } else if (nowIndex < $("#tab-ul").children('li').length) {
        $("#tab-ul").children('li').eq(nowIndex - 1).addClass('tab-li-on');
        $('.iframe-tab').each(function (index, item) {
            $(item).hide();
        });
        $("#IF" + $("#tab-ul").children('li').eq(nowIndex - 1).data('pathKey')).show();
    }
    $(obj).parent().remove();
    $("#IF" + keyPath).remove();
}
//열려있는 탭 선택
function openAndShowTab(key, obj) {
    $('.iframe-tab').each(function (index, item) {
        $(item).hide();
    });
    $('.tab-li-on').removeClass('tab-li-on');
    $('[data-path-key="' + key + '"]').addClass('tab-li-on');
    $("#IF" + key).show();
}

function closeSeltTab(key) {
    $("[data-path-key='" + key + "']").remove();
    $("#IF" + key).remove();
}

//iframe 안에서 open 호출
function ifAddTabAndShowIf(path, title, key, param, refresh) {
    parent.addTabAndShowIf(path, title, key, param, refresh);
}

//iframe 안에서 close 호출
function ifCloseTabAndShowIf(key) {
    parent.closeSeltTab(key);
}

