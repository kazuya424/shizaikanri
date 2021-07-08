<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    StampInstockScript.init();
  })

  var StampInstockScript = {
    init: function() {
      CommonScript.filterInit();
      CommonScript.sortInit();
      StampInstockScript.setCommonParam();
      StampInstockScript.listAjax();
      var datepicker1 = new JsDatePicker($('.datepicker1'), {
        titles: '日付',
        curDates: new Date(),
        isPastOk: true,
        changeCallback: function() {
        }
      });
      datepicker1.make();
      $('.datepicker1').val('');
    },
    setCommonParam: function() {
      CommonScript.listParam.originalSortField = 'INSTOCK_SEQ';
      CommonScript.listParam.originalSortOrder = 'DESC';
      CommonScript.listParam.sortField = 'INSTOCK_SEQ';
      CommonScript.listParam.sortOrder = 'DESC';
      CommonScript.listParam.updateCallback = StampInstockScript.updateAction;
      CommonScript.listParam.listFunc = StampInstockScript.listAjax;
    },
    listAjax: function() {
      $.ajax({
        type: 'POST',
        url: '/stamp/instock/api/list',
        data: JSON.stringify(CommonScript.listParam),
        dataType: 'json',
        contentType: 'application/json; charset=UTF-8',
        error: function(xhr, status, error) {
          console.log(error);
          CommonScript.closeLoading();
        },
        success: function(json) {
          if (CommonScript.listParam.page == 0) {
            $('.list-area').children().remove();
          }
          if (json.length == 0) {
            CommonScript.alert('入庫', '表示するリストがありません。');
            $('.paging').remove();
          } else {
            StampInstockScript.makeList(json);
            CommonScript.tableEditInit();
          }
          CommonScript.closeLoading();
        }
      })
    },
    makeList: function(json) {
      var instockList = json;
      var list = $('.list-area');
      for (var i = 0; i < instockList.length; i++) {
        list.append($('<tr>'));
        var tr = list.children().last();
        tr.append($('<td>').append(
                $('<input type="checkbox">').attr('name', 'instockList')));
        tr
                .append($('<td name = "instockSeq">').text(
                        instockList[i].instockSeq));

        tr.append($('<td>').append(
                $('<input type="date" name="instockDate">').val(
                        instockList[i].instockDate)));

        tr.append($('<td class="select-area">').append(
                $('<select class = "user-option" name="instockHandler">')));

        tr.append($('<td class="select-area">').append(
                $('<select class = "user-option1" name="instockInputUser">')));

        tr.append($('<td>').html(
                instockList[i].type.stockType + "("
                        + instockList[i].type.stockPrice + "円)"));

        tr.append($('<td>').append(
                $('<input type="number" style = width:80px>').val(
                        instockList[i].instockCount).attr('name',
                        'instockCount')));

        tr.append($('<td>').append(
                $('<textarea>').text(instockList[i].instockComment).attr(
                        'name', 'instockComment')));

        tr.append($('<input Type="hidden"  name = "instockType">').val(
                instockList[i].instockType));

        tr.append($('<input Type="hidden"  name = "instockUpdDt">').val(
                instockList[i].instockUpdDt));

        var userName = instockList[i].handler.userName;
        var inputUser = instockList[i].inputUser.userName;
        var stockType = instockList[i].instockType;
        var stockPrice = instockList[i].type.stockPrice;
        var managerCompany = instockList[i].manager;
        var managerName = instockList[i].manager;
        var manager = managerName + "(" + managerCompany + ")";

        CommonScript
                .makeSelectBoxByElement('TBL_USER', 'USER_NAME', 'USER_SEQ',
                        'USER_IS_DELETE', tr.find('.user-option'), userName);

        CommonScript.makeSelectBoxByElement('TBL_USER', 'USER_NAME',
                'USER_SEQ', 'USER_IS_DELETE', tr.find('.user-option1'),
                inputUser);
      }
      $('.paging').remove();
      list.append($('<tr>').attr('class', 'paging').append(
              $('<td>').attr('onclick', 'CommonScript.nextPage();').attr(
                      'colspan', '10').text('次のページを見る')));
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

    updateAction: function(ele) {

      var instockColumn = $(ele).parent().attr('class')
              .replace('editable ', '').replace('editable-textarea ', '')
              .split(' ');
      var selectedRows = [];
      var param = [];
      var checkedRow = [];
      var instockSeq = '';
      var instockHandler = '';
      var instockInputUser = '';
      var instockType = '';
      var instockCount = '';
      var instockComment = '';
      var instockUpdDt = '';
      var instockUpdId = '';
      var instockDate = '';
      var i = 0

      try {
        checkedRow = $(ele).parents('div').find("[name='instockList']:checked")
                .parents('tr');
        if (checkedRow.length == 0) { throw new Error('最低1つ以上チェックをつけてください'); }

        checkedRow
                .each(function(i) {
                  selectedRows.push($(this));

                  instockSeq = $(selectedRows[i]).find('td[name=instockSeq]');
                  instockHandler = $(selectedRows[i]).find(
                          'select[name=instockHandler]');
                  instockInputUser = $(selectedRows[i]).find(
                          'select[name=instockInputUser]');
                  instockUpdDt = $(selectedRows[i]).find(
                          'input[name=instockUpdDt]');
                  instockDate = $(selectedRows[i]).find(
                          'input[name=instockDate]');
                  instockType = $(selectedRows[i]).find(
                          'input[name=instockType]');
                  instockCount = $(selectedRows[i]).find(
                          'input[name=instockCount]');
                  instockUpdId = $(selectedRows[i]).find(
                          'textarea[name=instockUpdId]');
                  instockComment = $(selectedRows[i]).find(
                          'textarea[name=instockComment]');
                  if (instockHandler == '選択してください。') { throw new Error('入力者が未選択です'); }

                  param[i] = {
                    instockSeq: instockSeq.text(),
                    instockDate: instockDate.val(),
                    instockType: instockType.val(),
                    instockCount: instockCount.val(),
                    instockComment: instockComment.val(),
                    instockUpdId: instockUpdId.val(),
                    instockUpdDt: instockUpdDt.val(),
                    instockHandler: instockHandler.val(),
                    instockInputUser: instockInputUser.val(),

                  };
                  if(param[i].instockCount < 0){
                    throw new Error('枚数に正しい値を入力してください。');
                  }
                  else if (param[i].instockHandler == '選択してください。'){
                    throw new Error('入力者を選択してください。');
                  }
                  else if (param[i].instockInputUser == '選択してください。'){
                    throw new Error('取扱者を選択してください。');
                  }

                })
      } catch (e) {
        CommonScript.alert('入庫リスト', e);
        return false;
      }
      CommonScript
      .confirm(
              '入庫リスト',
              'チェックしたデータを修正しますか？',
              function() {
                $('.confirm-popup').find('.closeBtn').click();
                CommonScript.showLoading();
                $
                        .ajax({
                type: 'POST',
                url: '/stamp/instock/api/update',
                data: JSON.stringify(param),
                dataType: 'json',
                contentType: 'application/json; charset=UTF-8',
                error: function(xhr, status, error) {
                  console.log(error);
                  CommonScript.closeLoading();
                },
                success: function(json) {
                  if (json.code == 'failure') {
                    CommonScript.alert('入庫', 'データの更新に失敗しました。')
                  } else if (json.code == 'outOfStock') {
                    CommonScript.alert('入庫', '在庫が0を下回っています。データの更新に失敗しました。')
                  } else if (json.code == 'updDtError') {
                    CommonScript.alert('入庫', '更新日時が不正です。データの更新に失敗しました。')
                  } else if (json.code == 'regDtError') {
                    CommonScript.alert('入庫', '最新の更新があります。画面を再読み込み後、お試しください。')
                  } else {
                    $('.list-area').children().remove();
                    CommonScript.listParam.listLength = CommonScript.listParam.page + 10;
                    CommonScript.listParam.page = 0;
                    CommonScript.listParam.listFunc();
                    CommonScript.listParam.page = CommonScript.listParam.listLength;
                    CommonScript.listParam.listLength = 10;
                    CommonScript.alert('入庫', json.code + '件のデータの変更が完了しました。')
                  }
                  CommonScript.closeLoading();
                }
              })
             })
    },

    deleteAction: function(ele) {

      var instockColumn = $(ele).parent().attr('class')
              .replace('editable ', '').replace('editable-textarea ', '')
              .split(' ');
      var selectedRows = [];
      var param = [];
      var checkedRow = [];
      var instockSeq = '';
      var instockUpdDt = '';
      var i = 0

      try {
        checkedRow = $(ele).parents('div').find("[name='instockList']:checked")
                .parents('tr');
        if (checkedRow.length == 0) { throw new Error('最低1つ以上チェックをつけてください'); }

        checkedRow.each(function(i) {
          selectedRows.push($(this));

          instockSeq = $(selectedRows[i]).find('td[name=instockSeq]');
          instockType = $(selectedRows[i]).find('input[name=instockType]');
          instockUpdDt = $(selectedRows[i]).find('input[name=instockUpdDt]');
          instockCount = $(selectedRows[i]).find('input[name=instockCount]');
          param[i] = {
            instockSeq: instockSeq.text(),
            instockType: instockType.val(),
            instockUpdDt: instockUpdDt.val(),
            instockCount: instockCount.val()
          };
        })
      } catch (e) {
        CommonScript.alert('入庫リスト', e);
        return false;
      }

      CommonScript.confirm('入庫', '入庫のデータを削除しますか？', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/stamp/instock/api/delete',
          data: JSON.stringify(param),
          dataType: 'json',
          contentType: 'application/json; charset=UTF-8',
          error: function(xhr, status, error) {
            console.log(error);
            CommonScript.closeLoading();
          },

          success: function(json) {
            if (json.code != 'failure') {
              CommonScript.listParam.searchObj = [];
              CommonScript.listParam.page = 0;
              CommonScript.listParam.listFunc();
              CommonScript.alert('入庫', json.code + '件のデータの削除が完了しました。')
            } else {
              CommonScript.alert('入庫',
                      'データを削除する時に問題が出ました。もう少し時間がたってからもう一回試してください。')
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
      $('.instockRegist-popup').show();
    }
  }
</script>
