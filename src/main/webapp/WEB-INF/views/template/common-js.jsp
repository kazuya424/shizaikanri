<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script type="text/javascript">
$(document).ready(function(){
	CommonScript.showLoading();
	CommonScript.init();
})

regex = {
	validateNumber : function(number){
		var numberRules = /^[0-9]*$/;
		return numberRules.test(number);
	}
}
/**
 * Common Scripts
 */
CommonScript = {
	//listparameter
	listParam : {
		originalSortField : '',
		originalSortOrder : '',
		sortField : '',
		sortOrder : '',
		page : 0,
		listLength : 10,
		searchObj : [],
		listFunc : '',
		updateCallback : ''
	},
	//initializer
	init : function(){
		CommonScript.menuInit();
		$('.header').find('.menu').click();
	},
	//show loading
	showLoading : function(){
		$('#dim-layer').show();
		$('#loading').show();
	},
	//close loading
	closeLoading : function(){
		setTimeout(function(){
			$('#dim-layer').fadeOut();
			$('#loading').fadeOut();
		},500)
	},
	//menu event
	menuInit : function(){
		//left menu open event
		$('.header').find('.menu').click(function(){
			if(document.getElementsByClassName("left")[0].style.left == '0px'){
				document.getElementsByClassName("left")[0].style.left = "-300px";
				document.getElementsByClassName("container")[0].style.marginLeft = "0";
				document.getElementsByClassName("container")[0].style.width = "100%";
				document.getElementsByClassName("header")[0].style.width = "90%";
				document.getElementsByClassName("header")[0].style.margin = "10px 5% 40px";
			}else{
				document.getElementsByClassName("left")[0].style.left = "0px";
				document.getElementsByClassName("container")[0].style.marginLeft = "300px";
				document.getElementsByClassName("container")[0].style.width = "calc(100% - 300px)";
				document.getElementsByClassName("header")[0].style.width = "calc((100% - 300px) / 10 * 9)";
				document.getElementsByClassName("header")[0].style.margin = "10px calc(((100% - 300px) / 100) * 5) 40px";
			}
		})
		//left menu li click event
		$('.menu-list').find('li').click(function(){
			$(this).parent().children().each(function(){
				$(this).removeClass('selected')
			})
			$('.menu-list').children().find('.depth1').each(function(){
				$(this).find('img').each(function(){
					$(this).attr('src',$(this).attr('src').replace('-white.png','.png'));	
				})
			})
			$(this).find('img').each(function(){
				var src = $(this).attr('src');
				if(src.indexOf('-white') !== -1){
					src = src.replace('-white.png','')+'.png';
				}else{
					src = src.replace('.png','')+'-white.png';
				}
				$(this).attr('src',src);
			})
			$(this).addClass('selected');
			//is second depth
			if($(this).parent().prev().hasClass('contents-li')){
				$(this).parent().prev().find('img').each(function(){
					var src = $(this).attr('src');
					if(src.indexOf('-white') !== -1){
					}else{
						src = src.replace('.png','')+'-white.png';
					}
					$(this).attr('src',src);
				})
			}else{
				$('.depth2').slideUp();
				$('.depth1').find('span').children().css('transform','rotate(270deg)');
			}
			//has second depth
			if($(this).hasClass('contents-li')){
				$('.depth1.selected').find('span').children().css('transform','rotate(0deg)');
				$(this).next().slideToggle();
			}
			
		})
		//setting default menu
		var path = $(location).attr('pathname');
		$('.menu-list').find('li').each(function(){
			var target = $(this).attr('data-target');
			if(target == path){
				$(this).addClass('selected');
				$(this).find('img').each(function(){
					var src = $(this).attr('src');
					if(src.indexOf('-white') !== -1){
						src = src.replace('-white.png','')+'.png';
					}else{
						src = src.replace('.png','')+'-white.png';
					}
					$(this).attr('src',src);
				})
				if($(this).parent().hasClass('depth2')){
					$(this).parent().prev().click();
				}
			}
			$(this).click(function(){
				if(!$(this).hasClass('contents-li')){
					location.href = $(this).attr('data-target');
				}
			})
		})
	},
	//table filter event setting
	filterInit : function(){
		$('.accordion-conts').find('.filter').click(function(){
			$(this).parent().find('.cont-contents').slideToggle();
			if($(this).find('.cont-title-arrow').children().attr('style') == 'transform: rotate(0deg);'){
				$(this).find('.cont-title-arrow').children().css('transform','rotate(270deg)');
			}else{
				$(this).find('.cont-title-arrow').children().css('transform','rotate(0deg)');
			}
		});
	},
	//table sort event setting
	sortInit : function(){
		$('.table-area').find('thead').find('th.sortable').click(function(){
			CommonScript.listParam.sortField = $(this).attr('data-sort');
			$(this).siblings().each(function(){
				$(this).find('img').hide();
				$(this).find('img').css('transform','rotate(0deg)');
			});
			var img = $(this).find('img');
			if(img.css('display') == 'none'){
				img.show();
				img.css('transform','rotate(0deg)');
				CommonScript.listParam.sortOrder = 'DESC';
			}else if(img.attr('style').indexOf('transform: rotate(0deg);') != -1){
				img.css('transform','rotate(180deg)');
				CommonScript.listParam.sortOrder = 'ASC';
			}else if(img.attr('style').indexOf('transform: rotate(180deg);') != -1){
				img.hide();
				img.css('transform','rotate(0deg)');
				CommonScript.listParam.sortField = CommonScript.listParam.originalSortField;
				CommonScript.listParam.sortOrder = CommonScript.listParam.originalSortOrder;
			}
			CommonScript.showLoading();
			CommonScript.listParam.page = 0;
			CommonScript.listParam.listFunc();
		});
	},
	nextPage : function(){
		CommonScript.listParam.page = CommonScript.listParam.page + 10;
		CommonScript.showLoading();
		CommonScript.listParam.listFunc();
	},
	//popup close event setting
	popupInit : function(){
		$('.dimBg').click(function(){
			CommonScript.closePopup();
		})
	},
	//table edit input and textarea setting
	tableEditInit : function(){
		$('.editable').click(function(){
			var val = $(this).html();
			if(val.indexOf('<br>') != -1){
				var val2 = val.split('<br>')[0];
				var val3 = val.split('<br>')[1];
				$(this).text('');
				if(val2.indexOf('年') != -1 || val2.indexOf('月') != -1 || val2.indexOf('日') != -1){
					var index = $('editDate').length;
					$(this).append($('<input>').attr('type','text').attr('class','updateVal editDate date'+index));
					var datepicker = new JsDatePicker($('.date'+index) ,{titles : '日付',curDates:new Date(CommonScript.reverseDateFormat(val2)),isPastOk : true,changeCallback: function(){}});
					datepicker.make();
				}else if($(this).attr('data-type').split(' ')[0] == 'stocks'){
					$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal stock-options')));
					CommonScript.makeSelectBox('tbl_stock','STOCK_TYPE','STOCK_SEQ','STOCK_IS_DELETE','stock-options');
				}else if($(this).attr('data-type').split(' ')[0] == 'managers'){
					$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal manager-options')));
					CommonScript.makeSelectBox('TBL_MANAGER','CONCAT(MANAGER_NAME,"(",MANAGER_COMPANY,")")','MANAGER_SEQ','MANAGER_IS_DELETE','manager-options');
				}else{
					$(this).append($('<input>').attr('type','text').attr('class','updateVal').val(val2).focus());
				}
				if(val3.indexOf('年') != -1 || val3.indexOf('月') != -1 || val3.indexOf('日') != -1){
					var index = $('editDate').length;
					$(this).append($('<input>').attr('type','text').attr('class','updateVal editDate date'+index));
					var datepicker = new JsDatePicker($('.date'+index) ,{titles : '日付',curDates:new Date(CommonScript.reverseDateFormat(val3)),isPastOk : true,changeCallback: function(){}});
					datepicker.make();
				}else if($(this).attr('data-type').split(' ')[1] == 'managers'){
					$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal manager-options')));
					CommonScript.makeSelectBox('TBL_MANAGER','CONCAT(MANAGER_NAME,"(",MANAGER_COMPANY,")")','MANAGER_SEQ','MANAGER_IS_DELETE','manager-options');
				}else if($(this).attr('data-type').split(' ')[1] == 'stocks'){
					$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal stock-options')));
					CommonScript.makeSelectBox('tbl_stock','STOCK_TYPE','STOCK_SEQ','STOCK_IS_DELETE','stock-options');
				}else{
					$(this).append($('<input>').attr('type','text').attr('class','updateVal').val(val3).focus());
				}
				$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.cancelEdit(this);').val('取消し'));
				$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.listParam.updateCallback(this)').val('編集'));
				$(this).append($('<input>').attr('type','hidden').attr('class','originalVal').val(val));
				$(this).unbind('click');
			}else{
				$(this).text('');
				if(val.indexOf('年') != -1 || val.indexOf('月') != -1 || val.indexOf('日') != -1){
					var index = $('editDate').length;
					$(this).append($('<input>').attr('type','text').attr('class','updateVal editDate date'+index));
					var datepicker = new JsDatePicker($('.date'+index) ,{titles : '日付',curDates:new Date(CommonScript.reverseDateFormat(val)),isPastOk : true,changeCallback: function(){}});
					datepicker.make();
				}else if($(this).attr('data-type') == 'stocks'){
					$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal stock-options')));
					CommonScript.makeSelectBox('tbl_stock','STOCK_TYPE','STOCK_SEQ','STOCK_IS_DELETE','stock-options');
				}else if($(this).attr('data-type') == 'managers'){
					$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal manager-options')));
					CommonScript.makeSelectBox('TBL_MANAGER','CONCAT(MANAGER_NAME,"(",MANAGER_COMPANY,")")','MANAGER_SEQ','MANAGER_IS_DELETE','manager-options');
				}else{
					$(this).append($('<input>').attr('type','text').attr('class','updateVal').val(val).focus());
				}
				$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.cancelEdit(this);').val('取消し'));
				$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.listParam.updateCallback(this)').val('編集'));
				$(this).append($('<input>').attr('type','hidden').attr('class','originalVal').val(val));
				$(this).unbind('click');
			}
		})
		$('.editable-textarea').click(function(){
			var val = $(this).text();
			$(this).text('');
			$(this).append($('<textarea>').attr('class','updateVal').val(val).focus());
			$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.cancelEditTextarea(this);').val('取消し'));
			$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.listParam.updateCallback(this)').val('編集'));
			$(this).append($('<input>').attr('type','hidden').attr('class','originalVal').val(val));
			$(this).unbind('click');
		})
	},
	//cancel edit list row(input type text)
	cancelEdit : function(ele){
		var vals = [];
// 		$(ele).parent().find('input[type=text]').each(function(){
// 			var val = $(this).val();
// 			vals.push(val);
// 		})
		var parent = $(ele).parent();
		var html = '';
		html = $(ele).parent().find('.originalVal').val();
// 		for(var i = 0; i < vals.length; i++){
// 			html = html + vals[i];
// 			if(i != vals.length -1){
// 				html = html + '<br>'
// 			}
// 		}
		parent.html(html);
		setTimeout(function(){
			parent.click(function(){
				var val = $(this).html();
				if(val.indexOf('<br>') != -1){
					var val2 = val.split('<br>')[0];
					var val3 = val.split('<br>')[1];
					$(this).text('');
					if(val2.indexOf('年') != -1 || val2.indexOf('月') != -1 || val2.indexOf('日') != -1){
						var index = $('editDate').length;
						$(this).append($('<input>').attr('type','text').attr('class','updateVal editDate date'+index));
						var datepicker = new JsDatePicker($('.date'+index) ,{titles : '日付',curDates:new Date(CommonScript.reverseDateFormat(val2)),isPastOk : true,changeCallback: function(){}});
						datepicker.make();
					}else if($(this).attr('data-type').split(' ')[0] == 'stocks'){
						$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal stock-options')));
						CommonScript.makeSelectBox('tbl_stock','STOCK_TYPE','STOCK_SEQ','STOCK_IS_DELETE','stock-options');
					}else if($(this).attr('data-type').split(' ')[0] == 'managers'){
						$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal manager-options')));
						CommonScript.makeSelectBox('TBL_MANAGER','CONCAT(MANAGER_NAME,"(",MANAGER_COMPANY,")")','MANAGER_SEQ','MANAGER_IS_DELETE','manager-options');
					}else{
						$(this).append($('<input>').attr('type','text').attr('class','updateVal').val(val2).focus());
					}
					if(val3.indexOf('年') != -1 || val3.indexOf('月') != -1 || val3.indexOf('日') != -1){
						var index = $('editDate').length;
						$(this).append($('<input>').attr('type','text').attr('class','updateVal editDate date'+index));
						var datepicker = new JsDatePicker($('.date'+index) ,{titles : '日付',curDates:new Date(CommonScript.reverseDateFormat(val3)),isPastOk : true,changeCallback: function(){}});
						datepicker.make();
					}else if($(this).attr('data-type').split(' ')[1] == 'stocks'){
						$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal stock-options')));
						CommonScript.makeSelectBox('tbl_stock','STOCK_TYPE','STOCK_SEQ','STOCK_IS_DELETE','stock-options');
					}else if($(this).attr('data-type').split(' ')[1] == 'managers'){
						$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal manager-options')));
						CommonScript.makeSelectBox('TBL_MANAGER','CONCAT(MANAGER_NAME,"(",MANAGER_COMPANY,")")','MANAGER_SEQ','MANAGER_IS_DELETE','manager-options');
					}else{
						$(this).append($('<input>').attr('type','text').attr('class','updateVal').val(val3).focus());
					}
					$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.cancelEdit(this);').val('取消し'));
					$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.listParam.updateCallback(this)').val('編集'));
					$(this).append($('<input>').attr('type','hidden').attr('class','originalVal').val(val));
					$(this).unbind('click');
				}else{
					$(this).text('');
					if(val.indexOf('年') != -1 || val.indexOf('月') != -1 || val.indexOf('日') != -1){
						var index = $('editDate').length;
						$(this).append($('<input>').attr('type','text').attr('class','updateVal editDate date'+index));
						var datepicker = new JsDatePicker($('.date'+index) ,{titles : '日付',curDates:new Date(CommonScript.reverseDateFormat(val)),isPastOk : true,changeCallback: function(){}});
						datepicker.make();
					}else if($(this).attr('data-type') == 'stocks'){
						$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal stock-options')));
						CommonScript.makeSelectBox('tbl_stock','STOCK_TYPE','STOCK_SEQ','STOCK_IS_DELETE','stock-options');
					}else if($(this).attr('data-type') == 'managers'){
						$(this).append($('<span>').attr('class','select-area').append($('<select>').attr('class','updateVal manager-options')));
						CommonScript.makeSelectBox('TBL_MANAGER','CONCAT(MANAGER_NAME,"(",MANAGER_COMPANY,")")','MANAGER_SEQ','MANAGER_IS_DELETE','manager-options');
					}else{
						$(this).append($('<input>').attr('type','text').attr('class','updateVal').val(val).focus());
					}
					$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.cancelEdit(this);').val('取消し'));
					$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.listParam.updateCallback(this)').val('編集'));
					$(this).append($('<input>').attr('type','hidden').attr('class','originalVal').val(val));
					$(this).unbind('click');
				}
			}) 
		}, 500);
	},
	//cancel edit row (textarea)
	cancelEditTextarea : function(ele){
		var val = $(ele).prev().val();
		var parent = $(ele).parent();
		parent.children().remove();
		parent.html(val);
		setTimeout(function(){
			parent.click(function(){
				var val = $(this).html();
				$(this).html('');
				$(this).append($('<textarea>').attr('class','updateVal').val(val).focus());
				$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.cancelEditTextarea(this);').val('取消し'));
				$(this).append($('<input>').attr('type','button').attr('onclick','CommonScript.listParam.updateCallback(this);').val('編集'));
				$(this).append($('<input>').attr('type','hidden').attr('class','originalVal').val(val));
				$(this).unbind('click');
			}) 
		}, 500);
	},
	dateFormat : function(date){
		date = date.split(' ')[0];
		var date1 = date.split('-')[0]+'年';
		var date2 = date.split('-')[1]+'月';
		var date3 = date.split('-')[2]+'日';
		return date1+date2+date3;
	},
	reverseDateFormat : function(date){
		date = date.replace('年','-').replace('月','-').replace('日','')
		return date;
	},
	validDate : function(y,m,d) {
		dt=new Date(y,m-1,d);
		return(dt.getFullYear()==y && dt.getMonth()==m-1 && dt.getDate()==d);
	},
	alert : function(title,text){
		$('#popup-dim').fadeIn();
		$('.alert-popup').show();
		$('.alert-popup').find('.popup-title').text(title);
		$('.alert-popup').find('.popup-contents').text(text);
	},
	confirm : function(title,text,callback){
		$('#popup-dim').fadeIn();
		$('.confirm-popup').show();
		$('.confirm-popup').find('.popup-title').text(title);
		$('.confirm-popup').find('.popup-contents').text(text);
		$('.confirm-popup').find('.popup-confirm').unbind('click');
		$('.confirm-popup').find('.popup-confirm').click(callback);
	},
	closePopup : function(ele){
		$(ele).closest('.pop-layer').hide();
		if(!$('.pop-layer').is(':visible')){
			$('#popup-dim').fadeOut();
			$('.pop-layer').hide();
		}
	},
	makeSelectBox : function(table,column,seq,deleteCheck,elementClass,initValue){
		var param = {
			tableName : table,
			tableColumn : column,
			tableSeq : seq,
			tableDeleteCheck : deleteCheck
		};
		
		$.ajax({
			type : 'POST',
			url : '/etc/api/select',
			data : JSON.stringify(param),
			dataType : 'json',
			contentType : 'application/json; charset=UTF-8',
			error : function(xhr, status, error){
				console.log(error);
				CommonScript.closeLoading();
			},
			success : function(json){
				$('.'+elementClass).append($('<option>').text('選択してください。'));
				for(var i = 0; i < json.selectList.length; i++){
					$('.'+elementClass).append($('<option>').text(json.selectList[i].selectText).val(json.selectList[i].selectValue));
					if(initValue == json.selectList[i].selectValue){
						$('.'+elementClass).children().last().attr('selected','selected');
					}
				}
				JsTemp.initializeJsTemp();
			}
		})
	},
	makeSelectBoxAddOption : function(table,column,seq,deleteCheck, option, elementClass,initValue){
		var param = {
			tableName : table,
			tableColumn : column,
			tableSeq : seq,
			tableDeleteCheck : deleteCheck,
			tableOption : option
		};
		
		$.ajax({
			type : 'POST',
			url : '/etc/api/selectaddoption',
			data : JSON.stringify(param),
			dataType : 'json',
			contentType : 'application/json; charset=UTF-8',
			error : function(xhr, status, error){
				console.log(error);
				CommonScript.closeLoading();
			},
			success : function(json){
				$('.'+elementClass).append($('<option>').text('選択してください。'));
				for(var i = 0; i < json.selectList.length; i++){
					$('.'+elementClass).append($('<option>').text(json.selectList[i].selectText).val(json.selectList[i].selectValue));
					if(initValue == json.selectList[i].selectValue){
						$('.'+elementClass).children().last().attr('selected','selected');
					}
				}
				JsTemp.initializeJsTemp();
			}
		})
	},
	makeSelectBoxByElement : function(table,column,seq,deleteCheck,ele,init){
		var param = {
			tableName : table,
			tableColumn : column,
			tableSeq : seq,
			tableDeleteCheck : deleteCheck
		};
		
		$.ajax({
			type : 'POST',
			url : '/etc/api/select',
			data : JSON.stringify(param),
			dataType : 'json',
			contentType : 'application/json; charset=UTF-8',
			error : function(xhr, status, error){
				console.log(error);
				CommonScript.closeLoading();
			},
			success : function(json){
				$(ele).append($('<option>').text('選択してください。'));
				for(var i = 0; i < json.selectList.length; i++){
					$(ele).append($('<option>').text(json.selectList[i].selectText).val(json.selectList[i].selectValue));
					if(init==json.selectList[i].selectText){
						$(ele).children().attr('selected','selected')
					}
				}
				JsTemp.initializeJsTemp();
			}
		})
	}	
}
</script>