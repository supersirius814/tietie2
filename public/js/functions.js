// JavaScript Document
$(function () {

	$(document).on('click', '#js-hamburger', function () {
		$(".header-inner").toggleClass('nav-open');
	});
	
	
	$(document).on('click', 'tr[data-href]', function (e) {
		if (!$(e.target).is('a')) {
			var href = $(e.target).closest('tr').data('href');
			if (href) {
				window.location = href;
			}
		}
	});

	//activate hover state on smartphone
	var userAgent = navigator.userAgent;

	if (userAgent.indexOf("iPhone") >= 0 || userAgent.indexOf("iPad") >= 0 || userAgent.indexOf("Android") >= 0) {
		console.log("sp");
		$(document).on("touchstart", 'a, input[type="button"], input[type="submit"], button, .touch-hover',function () {
			$(this).addClass("hover");
		});
		$(document).on("touchend", 'a, input[type="button"], input[type="submit"], button, .touch-hover',function () {
			$(this).removeClass("hover");
		});
	} else {
		console.log("pc");
		$(document).on("mouseenter", 'a, input[type="button"], input[type="submit"], button, .touch-hover',function () {
			$(this).addClass("hover");
		});
		$(document).on("mouseleave", 'a, input[type="button"], input[type="submit"], button, .touch-hover',function () {
			$(this).removeClass("hover");
		});
	}

});

// ローディング解除
$(window).on("load",function () {
    $('#loading').delay(250).fadeOut();
});

// テキスト省略
function ellipsis(str, limit) {
	if ( limit < str.length ) {
		str = str.substr(0, limit) + '･･･';
		return str;
	}
	return str;
}

// ajaxリクエスト
function ajaxRequest(url,param = [],cache = true) {
	console.log("call "+url);
	return new Promise((resolve, reject) => {
		$.ajax({
			url: url,
			type: 'POST',
			cache: cache,
			dataType: 'json',
			data: param,
		}).done( function(response) {
			// console.log(response);
			resolve(response);
		}).fail( function(xhr) {
			reject(null);
		}).always( function() {

		});
	});
}

// クエリーストリングバース
function getUrlQueries() {
	var queryStr = window.location.search.slice(1);  // 文頭?を除外
		queries = {};

	// クエリがない場合は空のオブジェクトを返す
	if (!queryStr) {
		return queries;
	}

	// クエリ文字列を & で分割して処理
	queryStr.split('&').forEach(function(queryStr) {
		// = で分割してkey,valueをオブジェクトに格納
		var queryArr = queryStr.split('=');
		queries[queryArr[0]] = queryArr[1];
	});

	return queries;
}