<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	MainScript.init();
	CommonScript.closeLoading();
})

var MainScript = {
	init : function(){
		$('.dashboard-cont').hover(function(){
			var original = $(this).children().find('img').attr('src');
			var white = original.replace('.png','-white.png');
			$(this).children().find('img').attr('src',white);
		}, function(){
			var original = $(this).children().find('img').attr('src');
			var white = original.replace('-white.png','.png');
			$(this).children().find('img').attr('src',white);
		})

		$('.dashboard-menu').each(function(){
			$(this).click(function(){
				location.href = $(this).attr('data-target');
			})
		})
	}
}
</script>