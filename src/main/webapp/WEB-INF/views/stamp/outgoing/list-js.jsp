<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    StampOutgoingScript.init();
  })

  var StampOutgoingScript = {
    init: function() {
      CommonScript.filterInit();
      CommonScript.sortInit();
      StampOutgoingScript.setCommonParam();
      StampOutgoingScript.listAjax();
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
      CommonScript.listParam.originalSortField = 'OUTGOING_SEQ';
      CommonScript.listParam.originalSortOrder = 'DESC';
      CommonScript.listParam.sortField = 'OUTGOING_SEQ';
      CommonScript.listParam.sortOrder = 'DESC';
      CommonScript.listParam.updateCallback = StampOutgoingScript.updateAction;
      CommonScript.listParam.listFunc = StampOutgoingScript.listAjax;
    },
    listAjax: function() {
      $.ajax({
        type: 'POST',
        url: '/stamp/outgoing/api/list',
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
            CommonScript.alert('出庫', '表示するリストがありません。');
            $('.paging').remove();
          } else {
            StampOutgoingScript.makeList(json);
            CommonScript.tableEditInit();
          }
          CommonScript.closeLoading();
        }
      })
    },
    makeList: function(json) {
      var outgoingList = json;
      var list = $('.list-area');
      for (var i = 0; i < outgoingList.length; i++) {
        list.append($('<tr>'));
        var tr = list.children().last();
        tr.append($('<td>').append(
                $('<input type="checkbox">').attr('name', 'outgoingList')));

        tr.append($('<td name = "outgoingSeq">').text(
                outgoingList[i].outgoingSeq));

        tr.append($('<td>').append(
                $('<input type="date" name="outgoingDate">').val(
                        outgoingList[i].outgoingDate)));

        tr.append($('<td>').html(
                outgoingList[i].type.stockType + "("
                        + outgoingList[i].type.stockPrice + "円)"));

        tr.append($('<td class="select-area">').append(
                $('<select class = "user-option" name="outgoingHandler">')));

        tr.append($('<td class="select-area">').append(
                $('<select class = "user-option1" name="outgoingInputUser">')));

        tr.append($('<td class="select-area">').append(
                $('<select class = "manager-option" name="managerCompany">')));

        tr.append($('<td>').append(
                $('<input type="number" style = width:80px>').val(
                        outgoingList[i].outgoingCount).attr('name',
                        'outgoingCount')));

        tr.append($('<td>').append(
                $('<input type = "text" style = width:100px>').val(
                        outgoingList[i].outgoingDestination).attr('name',
                        'outgoingDestination')));

        tr.append($('<td>').append(
                $('<input type = "text" style = width:100px>').val(
                        outgoingList[i].outgoingManager).attr('name',
                        'outgoingManager')));

        tr.append($('<td>').append(
                $('<textarea>').text(outgoingList[i].outgoingContent).attr(
                        'name', 'outgoingContent')));

        tr.append($('<td>').append(
                $('<textarea>').text(outgoingList[i].outgoingComment).attr(
                        'name', 'outgoingComment')));

        tr.append($('<td>').html(
                outgoingList[i].register.userName
                        + '<br/>'
                        + CommonScript
                                .dateFormat(outgoingList[i].outgoingRegDt)));

        tr.append($('<td>').html(
                outgoingList[i].updater.userName
                        + '<br/>'
                        + CommonScript
                                .dateFormat(outgoingList[i].outgoingUpdDt)));

        tr.append($('<input Type="hidden" name = "outgoingUpdDt">').val(
                (outgoingList[i].outgoingUpdDt)));

        tr.append($('<input Type="hidden"  name = "outgoingType">').val(
                outgoingList[i].outgoingType));

        var userName = outgoingList[i].handler.userName;
        var inputUser = outgoingList[i].inputUser.userName;
        var stockType = outgoingList[i].outgoingType;
        var stockPrice = outgoingList[i].type.stockPrice;
        var managerCompany = outgoingList[i].manager.managerCompany;
        var managerName = outgoingList[i].manager.managerName;
        var manager = managerCompany;

        CommonScript
                .makeSelectBoxByElement('TBL_USER', 'USER_NAME', 'USER_SEQ',
                        'USER_IS_DELETE', tr.find('.user-option'), userName);

        CommonScript.makeSelectBoxByElement('TBL_USER', 'USER_NAME',
                'USER_SEQ', 'USER_IS_DELETE', tr.find('.user-option1'),
                inputUser);

        CommonScript.makeSelectBoxByElement('TBL_MANAGER', 'MANAGER_COMPANY',
                'MANAGER_SEQ', '(MANAGER_NAME = "") AND MANAGER_IS_DELETE', tr
                        .find('.manager-option'), manager);
      }
      $('.paging').remove();
      list.append($('<tr>').attr('class', 'paging').append(
              $('<td>').attr('onclick', 'CommonScript.nextPage();').attr(
                      'colspan', '16').text('次のページを見る')));
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

      var outgoingColumn = $(ele).parent().attr('class').replace('editable ',
              '').replace('editable-textarea ', '').split(' ');
      var selectedRows = [];
      var param = [];
      var checkedRow = [];
      var outgoingSeq = '';
      var outgoingHandler = '';
      var outgoingInputUser = '';
      var outgoingType = '';
      var outgoingCount = '';
      var outgoingComment = '';
      var outgoingContent = '';
      var outgoingCompany = '';
      var outgoingRegDt = '';
      var outgoingRegId = '';
      var outgoingUpdDt = '';
      var outgoingUpdId = '';
      var outgoingInput = '';
      var outgoingDestination = '';
      var outgoingManager = '';
      var outgoingDate = '';
      var i = 0

      try {
        checkedRow = $(ele).parents('div')
                .find("[name='outgoingList']:checked").parents('tr');
        if (checkedRow.length == 0) { throw new Error('最低1つ以上チェックをつけてください'); }

        checkedRow
                .each(function(i) {
                  selectedRows.push($(this));

                  outgoingSeq = $(selectedRows[i]).find('td[name=outgoingSeq]');
                  outgoingHandler = $(selectedRows[i]).find(
                          'select[name=outgoingHandler]');
                  outgoingInputUser = $(selectedRows[i]).find(
                          'select[name=outgoingInputUser]');
                  outgoingUpdDt = $(selectedRows[i]).find(
                          'input[name=outgoingUpdDt]');
                  outgoingInput = $(selectedRows[i]).find(
                          'input[name=outgoingInput]');
                  outgoingDate = $(selectedRows[i]).find(
                          'input[name=outgoingDate]');
                  outgoingType = $(selectedRows[i]).find(
                          'input[name=outgoingType]');
                  outgoingCount = $(selectedRows[i]).find(
                          'input[name=outgoingCount]');
                  outgoingContent = $(selectedRows[i]).find(
                          'textarea[name=outgoingContent]');
                  outgoingUpdId = $(selectedRows[i]).find(
                          'textarea[name=outgoingUpdId]');
                  outgoingComment = $(selectedRows[i]).find(
                          'textarea[name=outgoingComment]');
                  outgoingDestination = $(selectedRows[i]).find(
                          'input[name=outgoingDestination]');
                  outgoingManager = $(selectedRows[i]).find(
                          'input[name=outgoingManager]');
                  outgoingCompany = $(selectedRows[i]).find(
                          'select[name=managerCompany]');

                  param[i] = {
                    outgoingSeq: outgoingSeq.text(),
                    outgoingDate: outgoingDate.val(),
                    outgoingHandler: outgoingHandler.val(),
                    outgoingInputUser: outgoingInputUser.val(),
                    outgoingType: outgoingType.val(),
                    outgoingCount: outgoingCount.val(),
                    outgoingComment: outgoingComment.val(),
                    outgoingContent: outgoingContent.val(),
                    outgoingCompany: outgoingCompany.val(),
                    outgoingRegId: outgoingUpdId.val(),
                    outgoingRegDt: outgoingUpdDt.val(),
                    outgoingUpdId: outgoingUpdId.val(),
                    outgoingUpdDt: outgoingUpdDt.val(),
                    outgoingDestination: outgoingDestination.val(),
                    outgoingManager: outgoingManager.val(),
                  };
                  if(param[i].outgoingCount < 0){
                    throw new Error('枚数に正しい値を入力してください。');
                  }
                  else if (param[i].outgoingHandler == '選択してください。'){
                    throw new Error('入力者を選択してください。');
                  }
                  else if (param[i].outgoingInputUser == '選択してください。'){
                    throw new Error('取扱者を選択してください。');
                  }
                  else if (param[i].outgoingCompany == '選択してください。'){
                    throw new Error('払出会社を選択してください。');
                  }
                  else if (param[i].outgoingContent == ''){
                    throw new Error('内容を選択してください。');
                  }
                })
      } catch (e) {
        CommonScript.alert('出庫リスト', e);
        return false;
      }
      CommonScript
      .confirm(
              '出庫リスト',
              'チェックしたデータを修正しますか？',
              function() {
                $('.confirm-popup').find('.closeBtn').click();
                CommonScript.showLoading();
                $
                        .ajax({
                type: 'POST',
                url: '/stamp/outgoing/api/update',
                data: JSON.stringify(param),
                dataType: 'json',
                contentType: 'application/json; charset=UTF-8',
                error: function(xhr, status, error) {
                  console.log(error);
                  CommonScript.closeLoading();
                },
                success: function(json) {
                  if (json.code == 'failure') {
                    CommonScript.alert('出庫', 'データの更新に失敗しました。')

                  } else if (json.code == 'outOfStock') {
                    CommonScript.alert('出庫', '在庫が0を下回っています。データの更新に失敗しました。')
                  } else if (json.code == 'updDtError') {
                    CommonScript.alert('出庫', '更新日時が不正です。データの更新に失敗しました。')
                  } else if (json.code == 'regDtError') {
                    CommonScript.alert('出庫', '最新の更新があります。画面を再読み込み後、お試しください。')
                  } else {
                    $('.list-area').children().remove();
                    CommonScript.listParam.listLength = CommonScript.listParam.page + 10;
                    CommonScript.listParam.page = 0;
                    CommonScript.listParam.listFunc();
                    CommonScript.listParam.page = CommonScript.listParam.listLength;
                    CommonScript.listParam.listLength = 10;
                    CommonScript.alert('出庫', json.code + '件のデータの変更が完了しました。')
                  }
                  CommonScript.closeLoading();
                }
              })
            })
    },

    deleteAction: function(ele) {

      var outgoingColumn = $(ele).parent().attr('class').replace('editable ',
              '').replace('editable-textarea ', '').split(' ');
      var selectedRows = [];
      var param = [];
      var checkedRow = [];
      var outgoingSeq = '';
      var outgoingUpdDt = '';
      var i = 0

      try {
        checkedRow = $(ele).parents('div')
                .find("[name='outgoingList']:checked").parents('tr');
        if (checkedRow.length == 0) { throw new Error('最低1つ以上チェックをつけてください'); }

        checkedRow.each(function(i) {
          selectedRows.push($(this));

          outgoingSeq = $(selectedRows[i]).find('td[name=outgoingSeq]');
          outgoingType = $(selectedRows[i]).find('input[name=outgoingType]');
          outgoingUpdDt = $(selectedRows[i]).find('input[name=outgoingUpdDt]');
          outgoingCount = $(selectedRows[i]).find('input[name=outgoingCount]');
          param[i] = {
            outgoingSeq: outgoingSeq.text(),
            outgoingType: outgoingType.val(),
            outgoingUpdDt: outgoingUpdDt.val(),
            outgoingCount: outgoingCount.val()
          };
        })
      } catch (e) {
        CommonScript.alert('出庫リスト', e);
        return false;
      }

      CommonScript.confirm('出庫', '出庫のデータを削除しますか？', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/stamp/outgoing/api/delete',
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
              CommonScript.alert('出庫', json.code + '件のデータの削除が完了しました。')
            } else {
              CommonScript.alert('出庫',
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
      $('.outgoingRegist-popup').show();
    }
  }
</script>
