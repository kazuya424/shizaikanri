<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    StampListScript.init();
  })
  var StampListScript = {
    init: function() {
      CommonScript.filterInit();
      CommonScript.sortInit();
      StampListScript.setCommonParam();
      StampListScript.listAjax();
      var datepicker = new JsDatePicker($('.datepicker'), {
        titles: '日付',
        curDates: new Date(),
        isPastOk: true,
        changeCallback: function() {
        }
      });
      datepicker.make();
      $('.datepicker').val('');
      StampListScript.setSelectBox();
    },
    setSelectBox: function() {
      CommonScript.makeSelectBox('TBL_MANAGER',
              'MANAGER_COMPANY', 'MANAGER_SEQ',
              '(MANAGER_NAME = "" OR ISNULL(MANAGER_NAME)) AND MANAGER_IS_DELETE', 'company-option');
      CommonScript.makeSelectBox('tbl_user', 'USER_NAME', 'USER_SEQ',
              'USER_IS_DELETE', 'user-option');
      CommonScript.makeSelectBox('tbl_stock',
              'CONCAT(STOCK_TYPE," ",STOCK_PRICE)', 'STOCK_SEQ',
              'STOCK_IS_DELETE', 'stock-option');
    },
    setCommonParam: function() {
      CommonScript.listParam.originalSortField = 'stockDate';
      CommonScript.listParam.originalSortOrder = 'DESC';
      CommonScript.listParam.sortField = 'stockDate';
      CommonScript.listParam.sortOrder = 'DESC';
      CommonScript.listParam.listFunc = StampListScript.listAjax;
    },
    listAjax: function() {
      $.ajax({
        type: 'POST',
        url: '/stamp/api/list',
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
          if (json.listObject.length == 0) {
            CommonScript.alert('入出庫一覧', '表示するリストがありません。');
            $('.paging').remove();
          } else {
            StampListScript.makeList(json);
          }
          CommonScript.closeLoading();
        }
      })
    },
    makeList: function(json) {
      var lists = json.listObject;
      var list = $('.list-area');
      for (var i = 0; i < lists.length; i++) {
        if (lists[i].tblOutgoing) {
          list.append($('<tr>').addClass('listRow'));
          var tr = list.children().last();
          tr.append($('<td>').text(lists[i].tblOutgoing.outgoingSeq));
          tr.append($('<td>').text(
                  CommonScript.dateFormat(lists[i].tblOutgoing.outgoingDate)));
          tr.append($('<td>').append(
                  $('<span>').attr('class', 'status red').text('出庫')));
          tr.append($('<td>').text(lists[i].tblOutgoing.handler.userName));
          tr.append($('<td>').text(lists[i].tblOutgoing.inputUser.userName));
          tr.append($('<td>').text(
                  lists[i].tblOutgoing.type.stockType
                          + lists[i].tblOutgoing.type.stockPrice));
          tr.append($('<td>').text(lists[i].tblOutgoing.outgoingCount))
          tr.append($('<td>').text(lists[i].tblOutgoing.outgoingComment));
          tr.append($('<td>').text(lists[i].tblOutgoing.outgoingContent));

        } else if (lists[i].tblInstock) {
          list.append($('<tr>').addClass('listRow'));
          var tr = list.children().last();
          tr.append($('<td>').text(lists[i].tblInstock.instockSeq));
          tr.append($('<td>').text(
                  CommonScript.dateFormat(lists[i].tblInstock.instockDate)));
          tr.append($('<td>').append(
                  $('<span>').attr('class', 'status green').text('入庫')));
          tr.append($('<td>').text(lists[i].tblInstock.handler.userName));
          tr.append($('<td>').text(lists[i].tblInstock.inputUser.userName));
          tr.append($('<td>').text(
                  lists[i].tblInstock.type.stockType
                          + lists[i].tblInstock.type.stockPrice));
          tr.append($('<td>').text(lists[i].tblInstock.instockCount));
          tr.append($('<td>').text(lists[i].tblInstock.instockComment));
          tr.append($('<td>'));

        }
      }
      $('.paging').remove();
      list.append($('<tr>').attr('class', 'paging').append(
              $('<td>').attr('onclick', 'CommonScript.nextPage();').attr(
                      'colspan', '13').text('次のページを見る')));
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
        var vals = $(this).val();
        if (vals == '選択してください。') {
          vals = '';
        }
        var searchObj = {
          searchKey: $(this).attr('name'),
          searchValue: vals
        };
        searchArr.push(searchObj);
      })
      CommonScript.listParam.searchObj = searchArr;
      CommonScript.listParam.page = 0;
      CommonScript.showLoading();
      StampListScript.listAjax();
    },
  }
</script>
