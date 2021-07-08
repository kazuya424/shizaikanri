$(document).ready(function(){
	JsTemp.initializeJsTemp();
})

$(function() {
  'use strict';
  $("#scrollbar, #scrollbox").on('scroll', function() {
    if ( $(this).attr('id') === 'scrollbar' ) {
      $('#scrollbox').scrollLeft($(this).scrollLeft());
    } else {
      $("#scrollbar").scrollLeft($(this).scrollLeft());
    }
  });
});

$(function() {
  'use strict';
  $("#scrollbarlist, #scrollboxlist").on('scroll', function() {
    if ( $(this).attr('id') === 'scrollbarlist' ) {
      $('#scrollboxlist').scrollLeft($(this).scrollLeft());
    } else {
      $("#scrollbarlist").scrollLeft($(this).scrollLeft());
    }
  });
});
var JsTemp = {
	//initialize
	initializeJsTemp : function(){
		//make selectbox
		$('.select-area').each(function(){
			JsTemp.makeSelectBox(this);
		})
		//make radiobox
		$('.radio-button').each(function(){
			JsTemp.makeRadioButton(this);
		})
		$('.files').each(function(){
			JsTemp.makeFileInput(this);
		})
		$('.file').each(function(){
			JsTemp.makeFileInput(this);
		})
	},
	makeSelectBox : function(ele){
		var selects = $(ele).find('select');
		var options = [];
		var optionsText = [];
		var value = selects.val();
		var initValue = '';
		$(ele).find('.select-box').remove();
		$(ele).find('.select-options').remove();
		selects.children().each(function(){
			options.push($(this).val());
			optionsText.push($(this).text());
			if(selects.val() == $(this).val()){
             initValue = $(this).text();
           }
		})
		selects.hide();
		$(ele).append($('<div>').attr('class','select-box').text(initValue).append($('<img>').attr('src','/resources/images/left-arrow.png')));
		$('.pu .select-box:contains("待機")').css('background-color', '	#90EE90');
        $('.pu .select-box:contains("稼働中")').css('background-color', '#FF4F50');
        $('.pu .select-box:contains("故障")').css('background-color', '#DDA0DD');

		$(ele).append($('<div>').attr('class','select-options'))
		$('.pu .select-options').addClass('operation-op');
		for(var i = 0; i < options.length; i++){
			$(ele).find('.select-options').append($('<span>').text(optionsText[i]).append($('<input>').attr('type','hidden').val(options[i])));
			if(value == options[i]){
				$(ele).find('.select-options').children().last().addClass('selected');
			}
		}
		$(ele).find('.select-box').click(function(e){
			e.stopPropagation();
			var _this = $(this).next();
			$('.select-options').each(function(){
				if(_this.attr('class') != $(this).attr('class')){
					if($(this).hasClass('active')){
						if($(this).prev().find('img').attr('style') == 'transform: rotate(180deg);'){
							$(this).prev().find('img').css('transform','rotate(0deg)')
						}else{
							$(this).prev().find('img').css('transform','rotate(180deg)');
						}
					}
					$(this).removeClass('active');
				}
			});
			$('.select-options').each(function(){
				if(!$(this).hasClass('active')){
					$(this).slideUp();
				}
			})
			if(!_this.hasClass('active')){
				$(this).next().addClass('active');
			}else{
				$(this).next().removeClass('active');
			}
			if($(this).find('img').attr('style') == 'transform: rotate(180deg);'){
				$(this).find('img').css('transform','rotate(0deg)')
			}else{
				$(this).find('img').css('transform','rotate(180deg)');
			}
			$(this).next().slideToggle();
		});
		window.onclick = function(event) {
			if(!$(event.target).hasClass('select-box')){
				$('.select-options').each(function(){
					if($(this).hasClass('active')){
						if($(this).prev().find('img').attr('style') == 'transform: rotate(180deg);'){
							$(this).prev().find('img').css('transform','rotate(0deg)')
						}else{
							$(this).prev().find('img').css('transform','rotate(180deg)');
							$('.pu .select-box:contains("待機")').css('background-color', '	#90EE90');
					        $('.pu .select-box:contains("稼働中")').css('background-color', '#FF4F50');
					        $('.pu .select-box:contains("故障")').css('background-color', '#DDA0DD');
						}
						$(this).removeClass('active')
						$(this).slideUp();
					}
				})
			}
		}
		$('.pu').find('.operation-op').children().each(function(){
			if($('.pu').find('.operation-op').children('span:contains("待機")')){
				$('.pu').find('.operation-op').children('span:contains("待機")').addClass('op0');
			}
			if($('.pu').find('.operation-op').children('span:contains("稼働中")')){
				$('.pu').find('.operation-op').children('span:contains("稼働中")').addClass('op1');
			}
			if($('.pu').find('.operation-op').children('span:contains("故障")')){
				$('.pu').find('.operation-op').children('span:contains("故障")').addClass('op2');
			}
		})

		$(ele).find('.select-options').children().each(function(){
			$(this).click(function(){
				$(this).parent().children().removeClass('selected');
				$(this).addClass('selected');
				$(this).parent().slideToggle();
				$(ele).find('.select-box').text($(this).text()).append($('<img>').attr('src','/resources/images/left-arrow.png'));
				$(ele).find('select').val($(this).find('input[type=hidden]').val());
				setTimeout(function(){
					$(ele).find('.select-box').find('img').css('transform','rotate(0deg)');
				},0)
			})
		})
	},
	makeRadioButton : function(ele){
		var datas = $(ele).attr('radio-data').split('|');
		for(var i = 0; i < datas.length; i++){
			 $(ele).parent().append(
			 	$('<div>').attr('class','radio-set').attr('data-radio',datas[i]).append(
			 		$('<div>').attr('class','radio-box')).append(
			 		$('<div>').attr('class','radio-text').text(datas[i])
			 	)
			 );
		}
		$(ele).parent().find('.radio-set').each(function(){
			$(this).click(function(){
				$(ele).parent().find('.radio-set').find('.radio-box').removeClass('selected');
				$(ele).parent().find('.radio-set').find('.radio-text').removeClass('selected');
				var value = $(this).attr('data-radio');
				$(ele).val(value);
				$(this).find('.radio-box').addClass('selected');
				$(this).find('.radio-text').addClass('selected');
			})
		})
	},
	makeFileInput : function(ele){
		var file = $(ele);
		if(file.hasClass('files')){
			file.after($('<input>').attr('type','text').attr('class','fileInput').val('ファイルを選択してください。').attr('readonly','readonly'));
			file.next().click(function(){
				file.click();
			})
			file.change(function(){
				var filename = $(this)[0].files[0].name;
				file.removeClass('files')
				file.next().remove();
				file.after($('<a>').attr('href','#none').attr('class','download-link').text(filename).append(
					$('<a>').attr('class','delete-file').append(
						$('<img>').attr('src','/resources/images/delete.png'))));
				file.parent().after($('<div>').append(
					$('<input>').attr('type','file').attr('class','files')))
				JsTemp.makeFileInput(document.getElementsByClassName('files'));
			})
			$('.delete-file').click(function(){
				$(this).parent().remove();
			})
		}else if(file.hasClass('file')){
			file.after($('<input>').attr('type','text').attr('class','fileInput').val('ファイルを選択してください。').attr('readonly','readonly'));
			file.next().click(function(){
				file.click();
			})
			file.change(function(){
				var filename = $(this)[0].files[0].name;
				file.removeClass('file')
				file.next().remove();
				file.after($('<a>').attr('href','#none').attr('class','download-link').text(filename).append(
					$('<a>').attr('class','delete-file').append(
						$('<img>').attr('src','/resources/images/delete.png'))));
				$('.delete-file').click(function(){
					$(this).parent().remove();
					file.parent().after($('<div>').append(
						$('<input>').attr('type','file').attr('class','file')))
					JsTemp.makeFileInput(document.getElementsByClassName('file'));
				})
			})
		}

	}
}