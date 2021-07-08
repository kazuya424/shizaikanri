var JsDatePicker = (function(){
	function JsDatePicker(ele, options){
		if(ele.length != 1){
			console.error('element cannot be more than one')
		}
		this.ele = ele
		this.options = {
			titles : 'titles',
			curDates : new Date(),
			leftArrow : '<',
			rightArrow : '>',
			isPastOk : true,
			form : 'yy-mm-dd',
			initial : true,
			changeCallback : function(){console.log('value change!')},
			template : 'button'
		}
		$.extend(this.options, options);
		this.template = '';
		this.current = new Date(this.options.curDates.getTime());
		this.value = this.options.form.replace('yy',this.options.curDates.getFullYear()).replace('mm',this.options.curDates.getMonth()+1).replace('dd',this.options.curDates.getDate());
	};
	JsDatePicker.prototype.setCurrent = function(dates){
		this.current = dates;
	}
	JsDatePicker.prototype.getCurrent = function(){
		return this.current;
	}
	JsDatePicker.prototype.make = function(){
		this.template 
		= '<div class="js-datepicker-temp">'
		/*+ '<div class="js-datepicker-titleArea">'+this.options.titles+'</div>'*/
		+ this.getMonthTemp(this.options.template)
		+ '<div class="js-datepicker-numberArea">'
		+ this.getnumbTemp(this.options.curDates)
		+ '</div>'
		+ '</div>';
		this.ele.after(this.template);
		// var offsetLeft = this.ele[0].offsetLeft-(this.ele.next()[0].offsetWidth-this.ele[0].offsetWidth)/2;
		// this.ele.next().css('left',offsetLeft+'px')
		this.makeAction();
		this.setCurrentDates();
		var year = this.current.getFullYear();
		var month = this.current.getMonth()+1;
		var date = this.current.getDate();
		var fullDate = this.options.form.replace('yy',year).replace('mm',month).replace('dd',date);
		this.value = fullDate;
		this.ele.val(fullDate);
		this.ele.next().hide();
	}
	JsDatePicker.prototype.getMonthTemp = function(temp){
		var template = '';
		var year = this.options.curDates.getFullYear()+'年';
		var month = this.options.curDates.getMonth()+1+'月';
		if(temp == 'button'){
			template = '<div class="js-datepicker-monthArea">'
			+ '<a class="js-datepicker-leftArr">'+this.options.leftArrow+'</a>'
			+ '<span class="js-datepicker-monthes">'+year+month+'</span>'
			+ '<a class="js-datepicker-rightArr">'+this.options.rightArrow+'</a>'
			+ '</div>'
		}else if(temp == 'select'){
			template = '<div class="js-datepicker-monthArea">'
			+ '<ul class="js-datepicker-select year" >';
			var today = new Date();
			var yearT = today.getFullYear();
			template = template + '<li class="js-datepicker-selected">'+yearT+'年 ▼</li>';
			for(var i = 0;i < 100; i++){
				if(i == 0){
					template = template + '<li class="selected" value="' + (yearT-i) + '">' + (yearT-i) + '年</li>'
				}else{
					template = template + '<li value="' + (yearT-i) + '">' + (yearT-i) + '年</li>'
				}
			}
			template = template + '</ul>'
			+ '<ul class="js-datepicker-select month"><li class="js-datepicker-selected">'+month+' ▼</li>';
			for(var i = 1;i < 13; i++){
				if(month.replace('月','') == i){
					template = template + '<li class="selected" value="' + i + '">' + i + '月</li>'
				}else{
					template = template + '<li value="' + i + '">' + i + '月</li>'
				}
			}
			template = template + '</ul></div>'
		}
		return template;
	}
	JsDatePicker.prototype.getnumbTemp = function(dates){
		var startDate = new Date(dates.getFullYear(), dates.getMonth(), 1).getDate();
		var lastDate = new Date(dates.getFullYear(), dates.getMonth()+1, 0).getDate();
		var startDay = new Date(dates.getFullYear(), dates.getMonth(), 1).getDay();
		var lastDay = new Date(dates.getFullYear(), dates.getMonth()+1, 0).getDay();
		var lastMonthLastDate = new Date(dates.getFullYear(), dates.getMonth(), 0).getDate();
		var nextMonthFirstDate = new Date(dates.getFullYear(), dates.getMonth()+1, 1).getDate();
		var numberTemp = '';
		var numbs = 1;
		for(var i = 0; i < 35; i++){
			if(i > startDay - 1 && numbs < lastDate + 1){
				if(new Date(this.current.getFullYear(), this.current.getMonth(), this.current.getDate()) < new Date(this.options.curDates.getFullYear(), this.options.curDates.getMonth(), this.options.curDates.getDate())){
					if(this.options.isPastOk){
						var numbers = '<a class="js-datepicker-numbers">'+numbs+'</a>';
						if(i % 7 == 0){
							numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-red">'+numbs+'</a>';
						}
					}else{
						var numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-dims">'+numbs+'</a>';
						if(i % 7 == 0){
							numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-red js-datepicker-numbers-dims">'+numbs+'</a>';
						}
					}
				}else if(new Date(this.current.getFullYear(), this.current.getMonth(), this.current.getDate()) > new Date(this.options.curDates.getFullYear(), this.options.curDates.getMonth(), this.options.curDates.getDate())){
					var numbers = '<a class="js-datepicker-numbers">'+numbs+'</a>';
					if(i % 7 == 0){
						numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-red">'+numbs+'</a>';
					}
				}else{
					if(this.options.isPastOk){
						var numbers = '<a class="js-datepicker-numbers">'+numbs+'</a>';
						if(i % 7 == 0){
							numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-red">'+numbs+'</a>';
						}
					}else{
						if(i-(startDay-1) < dates.getDate()){
							var numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-dims">'+numbs+'</a>';
							if(i % 7 == 0){
								numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-red js-datepicker-numbers-dims">'+numbs+'</a>';
							}
						}else{
							var numbers = '<a class="js-datepicker-numbers">'+numbs+'</a>';
							if(i % 7 == 0){
								numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-red">'+numbs+'</a>';
							}
						}
					}
				}
				numbs = numbs + 1;
			}else if(i < startDay){
				var lastNumbs = lastMonthLastDate - (startDay-1 - i)
				var numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-dims">'+lastNumbs+'</a>';
				if(i % 7 == 0){
					numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-red js-datepicker-numbers-dims">'+lastNumbs+'</a>';
				}
			}else if(i+1 > lastDate){
				var numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-dims">'+nextMonthFirstDate+'</a>';
				if(i % 7 == 0){
					numbers = '<a class="js-datepicker-numbers js-datepicker-numbers-red js-datepicker-numbers-dims">'+nextMonthFirstDate+'</a>';
				}
				nextMonthFirstDate = nextMonthFirstDate+1
			}
			numberTemp = numberTemp + numbers;
		}
		return numberTemp;
	};
	JsDatePicker.prototype.setCurrentDates = function(){
		var _this = this;
		this.ele.next().find('.js-datepicker-numbers').removeClass('js-datepicker-numbers-val');
		this.ele.next().find('.js-datepicker-numbers').each(function(){
			if(_this.value == _this.options.form.replace('yy',_this.getCurrent().getFullYear()).replace('mm',_this.getCurrent().getMonth()+1).replace('dd',$(this).text())){
				$(this).addClass('js-datepicker-numbers-val');
			}
		})
	}
	JsDatePicker.prototype.makeAction = function(){
		var datepicker = this.ele.next();
		var element = this.ele;
		var options = this.options
		var _this = this;
		element.mouseup(function(e){
			$('.js-datepicker-temp').hide();
			if(options.initial){
				_this.setCurrent(new Date(options.curDates.getFullYear(), options.curDates.getMonth(), options.curDates.getDate()));
				var year = _this.getCurrent().getFullYear()+'年';
				var month = _this.getCurrent().getMonth()+1+'月';
				if(options.template == 'select'){
					datepicker.find('.js-datepicker-select.year').children().first().text(year+' ▼');
					datepicker.find('.js-datepicker-select.month').children().first().text(month+' ▼');
					$('.js-datepicker-select').each(function(){
						$(this).children().hide();
						$(this).children().first().show();
					})
				}else if(options.template == 'button'){
					datepicker.find('.js-datepicker-monthes').text(year+' '+month)
				}
				datepicker.find('.js-datepicker-numberArea').children().remove();
				datepicker.find('.js-datepicker-numberArea').append(_this.getnumbTemp(_this.getCurrent()));
				datepicker.find('.js-datepicker-numbers:not(.js-datepicker-numbers-dims)').click(function(e){
					_this.setValue(e.target, element);
				})
			}
			$('.js-datepicker-select').each(function(){
				$(this).children().hide();
				$(this).children().first().show();
			})
			_this.setCurrentDates();
			datepicker.show();
			return false;
		})
		$(document).mouseup(function (e){
			if(datepicker.has(e.target).length === 0){
				datepicker.hide();
			}
		});
		datepicker.find('.js-datepicker-leftArr').click(function(e){
			_this.setMonth(datepicker, 0);
		});
		datepicker.find('.js-datepicker-rightArr').click(function(e){
			_this.setMonth(datepicker, 1)
		});
		datepicker.find('.js-datepicker-numbers:not(.js-datepicker-numbers-dims)').click(function(e){
			_this.setValue(this, element);
		})
		if(options.template = 'select'){
			datepicker.find('.js-datepicker-select').on('click',function(){
				$('.js-datepicker-select').each(function(){
					$(this).children().hide();
					$(this).children().first().show();
				})
				$(this).children().show();
				$(this).children().first().hide();
			})
			datepicker.find('.js-datepicker-select').find('li:not(.js-datepicker-selected)').on('click',function(e){
				e.stopPropagation();
				$(this).parent().children().hide();
				$(this).parent().children().first().show();
				$(this).parent().children().removeClass('selected')
				$(this).addClass('selected')
				var text = $(this).text();
				$(this).parent().children().first().text(text+' ▼');
				var year = $('.js-datepicker-select.year').children().first().text().replace('年 ▼','');
				var month = $('.js-datepicker-select.month').children().first().text().replace('月 ▼','');
				var dates = new Date(year, month-1);
				_this.setCurrent(dates);
				datepicker.find('.js-datepicker-numberArea').children().remove();
				datepicker.find('.js-datepicker-numberArea').append(_this.getnumbTemp(dates));
				_this.setCurrentDates();
				datepicker.find('.js-datepicker-numbers:not(.js-datepicker-numbers-dims)').click(function(e){
					_this.setValue(e.target, datepicker.prev());
				})
			})
		}
	};
	JsDatePicker.prototype.setValue = function(ele,box){
		var year = this.current.getFullYear();
		var month = this.current.getMonth()+1;
		if(month < 10){
			month = '0' + month;
		}
		var date = $(ele).text();
		if(date < 10){
			date = '0' + date;
		}
		var fullDate = this.options.form.replace('yy',year).replace('mm',month).replace('dd',date);
		this.value = fullDate;
		this.ele.val(fullDate);
		this.options.changeCallback();
		this.ele.next().hide();
	}
	JsDatePicker.prototype.setMonth = function(ele, flag){
		if(flag == 0){
			this.current = new Date(this.current.getFullYear(), this.current.getMonth()-1, this.current.getDate());
			var year = this.current.getFullYear()+'年 ';
			var month = this.current.getMonth()+1+'月';
			ele.find('.js-datepicker-monthes').text(year+month)
			ele.find('.js-datepicker-numberArea').children().remove();
			ele.find('.js-datepicker-numberArea').append(this.getnumbTemp(this.current));
			this.setCurrentDates();
		}else{
			this.current = new Date(this.current.getFullYear(), this.current.getMonth()+1, this.current.getDate());
			var year = this.current.getFullYear()+'年 ';
			var month = this.current.getMonth()+1+'月';
			ele.find('.js-datepicker-monthes').text(year+month);
			ele.find('.js-datepicker-numberArea').children().remove();
			ele.find('.js-datepicker-numberArea').append(this.getnumbTemp(this.current));
			this.setCurrentDates();
		}
		var _this = this;
		ele.find('.js-datepicker-numbers:not(.js-datepicker-numbers-dims)').click(function(e){
			_this.setValue(e.target, ele.prev());
		})
	}
	JsDatePicker.prototype.changeOptions = function(options){
		$.extend(this.options, options);
		this.ele.val('');
		this.ele.next().remove();
		this.template = '';
		this.current = new Date(this.options.curDates.getTime());
		this.make();
		this.ele.next().hide();
		this.makeAction();
	};
	return JsDatePicker
})();
