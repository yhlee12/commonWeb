/// <reference path="jquery-2.2.4.min.js" />
/// <reference path="jquery.ui.datepicker-ko.js" />
var Common = (function () {

    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }
    return {
        comma: comma,
        uncomma:uncomma
    }
}());

//dateinput Setup
$('.dateinput').each(function (index, item) {
    $(item).attr('readonly', 'readonly');
    $(item).datepicker({
        dateFormat: 'yy-mm-dd'
    ,   showOtherMonths: true
    ,   showMonthAfterYear: true
    ,   changeYear: true
    ,   changeMonth: true
    ,   yearSuffix: "년"
    ,   monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
    ,   monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
    ,   dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
    ,   dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']
    });
})