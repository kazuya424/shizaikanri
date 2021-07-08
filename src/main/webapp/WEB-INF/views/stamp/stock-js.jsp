<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    StampStockScript.init();
  })
  var StampStockScript = {
    init: function() {
      CommonScript.closeLoading();
      CommonScript.filterInit();
      CommonScript.sortInit();
      StampStockScript.setCommonParam();
      StampStockScript.stockAjax();
    },
    setCommonParam: function() {
      CommonScript.listParam.originalSortField = 'STOCK_SEQ';
      CommonScript.listParam.originalSortOrder = 'DESC';
      CommonScript.listParam.sortField = 'STOCK_SEQ';
      CommonScript.listParam.sortOrder = 'DESC';
      CommonScript.listParam.updateCallback = StampStockScript.updateAction;
      CommonScript.listParam.listFunc = StampStockScript.stockAjax;
    },
    stockAjax: function() {
      $.ajax({
        type: 'POST',
        url: '/stamp/stock/api/list',
        data: JSON.stringify(CommonScript.listParam),
        dataType: 'json',
        contentType: 'application/json; charset=UTF-8',
        error: function(xhr, status, error) {
          console.log(error);
          CommonScript.alert('在庫', 'リスト取得に失敗しました。');
          CommonScript.closeLoading();
        },
        success: function(json) {
          if (CommonScript.listParam.page == 0) {
            $('.list-area').children().remove();
          }
          if (json.tblStock.length == 0) {
            CommonScript.alert('在庫', '表示するリストがありません。');
            $('.paging').remove();
          } else {
            StampStockScript.makeList(json);
          }
          CommonScript.closeLoading();
        }
      })
    },
    makeList: function(json) {
      var stockList = json.tblStock;
      var list = $('.list-area');
      for (var i = 0; i < stockList.length; i++) {
        list.append($('<tr>'));
        var tr = list.children().last();
        tr.append($('<td>').append(
                $('<input type="checkbox">').attr('name', 'stockList')));
        tr.append($('<td>').attr('name', 'stockSeq')
                .text(stockList[i].stockSeq));
        tr.append($('<td>').append(
                $('<input type="text" style = width:100px>').attr('name', 'stockType').val(
                        stockList[i].stockType)));
        tr.append($('<td>').append(
                $('<input type="text" style = width:100px>').attr('name', 'stockPrice').val(
                        stockList[i].stockPrice)));
        tr.append($('<td>').text(stockList[i].stockCount))
        tr.append($('<td>').html(
                stockList[i].register.userName + '<br/>'
                        + CommonScript.dateFormat(stockList[i].stockRegDt)));
        tr.append($('<td>').html(
                stockList[i].updater.userName + '<br/>'
                        + CommonScript.dateFormat(stockList[i].stockUpdDt)));

        tr.append($('<input type="hidden">').attr('value',
                stockList[i].stockUpdDt).attr('name', 'stockUpdDt'));
      }
      $('.paging').remove();
      list.append($('<tr>').attr('class', 'paging').append(
              $('<td>').attr('onclick', 'CommonScript.nextPage();').attr(
                      'colspan', '7').text('次のページを見る')));
    },
    search: function(ele) {
      var searchArr = [];
      $(ele).parent().find('input[type=text]').each(function() {
        var key = $(this).attr('name');
        var val = $(this).val();
        var searchObj = {
          searchKey: key,
          searchValue: val
        };
        searchArr.push(searchObj);
      })
      $(ele).parent().find('select').each(function() {
        var searchObj = {
          searchKey: $(this).attr('name'),
          searchValue: $(this).val()
        };
        searchArr.push(searchObj);
      })
      CommonScript.listParam.searchObj = searchArr;
      CommonScript.listParam.page = 0;
      CommonScript.showLoading();
      CommonScript.listParam.listFunc();
    },
    registAction: function() {
      var pop = $('.stockRegist-popup');
      var type = pop.find('input[name=stockType]');
      var price = pop.find('input[name=stockPrice]');
      if (type.val() == '') {
        CommonScript.alert('在庫', '種別名を入力してください。');
        type.focus();
        return;
      } else if (type.val().length > 45) {
        CommonScript.alert('在庫', '文字数が制限を越えています。45文字以内にしてください。');
        type.focus();
        return;
      } else if (price.val() == '') {
        CommonScript.alert('在庫', '価格を入力してください。');
        price.focus();
        return;
      } else if (!regex.validateNumber(price.val())) {
        CommonScript.alert('在庫', '価格は数字で入力してください。');
        count.focus();
        return;
      } else if (price.val().length > 45) {
        CommonScript.alert('在庫', '文字数が制限を越えています。45文字以内にしてください。');
        price.focus();
        return;
      }
      var param = {
        stockType: type.val(),
        stockPrice: price.val()
      }
      CommonScript.confirm('在庫', '在庫のデータを登録しますか？', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/stamp/stock/api/insert',
          data: JSON.stringify(param),
          dataType: 'json',
          contentType: 'application/json; charset=UTF-8',
          error: function(xhr, status, error) {
            console.log(error, xhr, status);
            CommonScript.closeLoading();
          },
          success: function(json) {
            if (json.code == 'success') {
              $('.closeBtn').click();
              CommonScript.listParam.listFunc();
              CommonScript.alert('在庫', 'データを登録しました。')
            } else {
              CommonScript.alert('在庫',
                      'データを修正する時に問題が出ました。もう少し時間がたってからもう一回試してください。')
            }
            CommonScript.closeLoading();
          }
        })
      })
    },
    updateAction: function(ele) {
      var selectedRows = [];
      var param = [];
      var checkedRow = [];

      var stockSeq = '';
      var stockType = '';
      var stockPrice = '';
      var stockUpdDt = '';
      var i = 0

      try {
        checkedRow = $("input[name='stockList']:checked").parents('tr');
        if (checkedRow.length == 0) throw new Error('最低1つ以上チェックをつけてください');

        checkedRow.each(function(i) {
          selectedRows.push($(this));

          stockSeq = $(selectedRows[i]).find('td[name=stockSeq]');
          stockType = $(selectedRows[i]).find('input[name=stockType]');
          stockPrice = $(selectedRows[i]).find('input[name=stockPrice]');
          stockUpdDt = $(selectedRows[i]).find('input[name=stockUpdDt]');

          param[i] = {
            stockSeq: stockSeq.text(),
            stockType: stockType.val(),
            stockPrice: stockPrice.val(),
            stockUpdDt: stockUpdDt.val(),
          };
        })
      } catch (e) {
        CommonScript.alert('在庫リスト', e);
        return false;
      }

      if (stockType.val() == '') {
        CommonScript.alert('在庫', '種別名を入力してください。');
        stockType.focus();
        return;
      } else if (stockType.val().length > 45) {
        CommonScript.alert('在庫', '文字数が制限を越えています。45文字以内にしてください。');
        stockType.focus();
        return;
      }
      if (stockPrice.val() == '') {
        CommonScript.alert('在庫', '価格を入力してください。');
        stockPrice.focus();
        return;
      } else if (!regex.validateNumber(stockPrice.val())) {
        CommonScript.alert('在庫', '価格は数字で入力してください。');
        count.focus();
        return;
      } else if (stockPrice.val().length > 45) {
        CommonScript.alert('在庫', '文字数が制限を越えています。45文字以内にしてください。');
        stockPrice.focus();
        return;
      }
      CommonScript
              .confirm(
                      '在庫リスト',
                      'チェックしたデータを修正しますか？',
                      function() {
                        $('.confirm-popup').find('.closeBtn').click();
                        CommonScript.showLoading();
                        $
                                .ajax({
                                  type: 'POST',
                                  url: '/stamp/stock/api/update',
                                  data: JSON.stringify(param),
                                  dataType: 'json',
                                  contentType: 'application/json; charset=UTF-8',
                                  error: function(xhr, status, error) {
                                    console.log(error);
                                    CommonScript.closeLoading();
                                  },
                                  success: function(json) {
                                    if (json.code != 'failure') {
                                      $('.closeBtn').click();
                                      $('.list-area').children().remove();
                                      CommonScript.listParam.listLength = CommonScript.listParam.page + 10;
                                      CommonScript.listParam.page = 0;
                                      CommonScript.listParam.listFunc();
                                      CommonScript.listParam.page = CommonScript.listParam.listLength;
                                      CommonScript.listParam.listLength = 10;
                                      CommonScript.alert('在庫リスト', json.code
                                              + '件のデータを更新しました。');
                                    } else {
                                      CommonScript
                                              .alert('在庫リスト',
                                                      'データを修正する時に問題が出ました。もう少し時間がたってからもう一回試してください。')
                                    }
                                    CommonScript.closeLoading();
                                  }
                                })
                      })
    },
    deleteAction: function(ele) {
      var selectedRows = [];
      var param = [];
      var checkedRow = [];
      var stockSeq = '';
      var stockUpdDt = '';

      try {
        checkedRow = $(ele).parents('div').find("[name='stockList']:checked")
                .parents('tr');
        if (checkedRow.length == 0) throw new Error('最低1つ以上チェックをつけてください');

        checkedRow.each(function(i) {
          selectedRows.push($(this));

          stockSeq = $(selectedRows[i]).find('td[name=stockSeq]');
          stockUpdDt = $(selectedRows[i]).find('input[name=stockUpdDt]');

          param[i] = {
            stockSeq: stockSeq.text(),
            stockUpdDt: stockUpdDt.val()
          };
        })
      } catch (e) {
        CommonScript.alert('在庫リスト', e);
        return false;
      }

      CommonScript.confirm('在庫リスト', 'チェックしたデータを削除しますか？', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/stamp/stock/api/delete',
          data: JSON.stringify(param),
          dataType: 'json',
          contentType: 'application/json; charset=UTF-8',
          error: function(xhr, status, error) {
            console.log(error);
            CommonScript.closeLoading();
          },
          success: function(json) {
            if (json.code == 'cantDelete') {
              CommonScript.alert('在庫', '入出庫のデータが残っているので在庫を削除できませんでした。');
            } else if(json.code == 'failure'){
              CommonScript.alert('在庫リスト',
                      'データを削除する時に問題が出ました。もう少し時間がたってからもう一回試してください。')
            }
            else {
				CommonScript.listParam.searchObj = [];
				CommonScript.listParam.page = 0;
				CommonScript.listParam.listFunc();
				CommonScript.alert('在庫リスト', json.code + '件のデータを削除しました。');
       		}
            CommonScript.closeLoading();
          }
        })
      })
    },

    openPopup: function() {
      $('#popup-dim').fadeIn();
      $('#popup-dim').find('input[type=text]').val('');
      $('#popup-dim').find('textarea').val('');
      $('#popup-dim').find('.select-options').children().first().click();
      $('#popup-dim').find('.select-options').hide();
      $('.stockRegist-popup').show();
    }
  }
</script>