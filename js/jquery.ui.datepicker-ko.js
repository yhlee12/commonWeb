/* Korean initialisation for the jQuery calendar extension. */jQuery(function($){
    $.datepicker.regional['en'] = {
        closeText: 'Close',
        prevText: 'Prev Month',
        nextText: 'Next Month',
        currentText: 'Today',
        monthNames: ['Jan', '2월', '3월', '4월', '5월', '6월',
		'7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월',
		'7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        weekHeader: 'Wk',
        dateFormat: 'M d, yy',
        firstDay: 0,
        //isRTL: false,
        //showMonthAfterYear: true,
        changeMonth: true,
        changeYear: true
        //yearSuffix: '년'
    };
    $.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',        
		firstDay: 0,
		//isRTL: false,
		//showMonthAfterYear: true,
        changeMonth: true,
        changeYear: true
		//yearSuffix: '년'
    };
	$.datepicker.setDefaults($.datepicker.regional['ko']);
});
/* Written by DaeKwon Kang (ncrash.dk@gmail.com), Edited by Genie. */
