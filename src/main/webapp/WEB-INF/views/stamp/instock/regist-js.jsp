<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    StampInstockScript.init();
  })
  var StampInstockScript = {
    init: function() {
      CommonScript.closeLoading();
      StampInstockScript.setSelectBox();
      var datepicker1 = new JsDatePicker($('.datepicker1'), {
        titles: '入力日付',
        curDates: new Date(),
        isPastOk: true,
        changeCallback: function() {
        }
      });
      datepicker1.make();
    },
    setSelectBox: function() {
      CommonScript.makeSelectBox('TBL_USER', 'USER_NAME', 'USER_SEQ',
              'USER_IS_DELETE', 'manager-option', ${sessionScope.Seq});
      CommonScript.makeSelectBox('TBL_USER', 'USER_NAME', 'USER_SEQ',
              'USER_IS_DELETE', 'manager-option1');
      CommonScript.makeSelectBox('TBL_STOCK',
              'CONCAT(STOCK_TYPE,"(",STOCK_PRICE,"円)")', 'STOCK_SEQ',
              'STOCK_IS_DELETE', 'type-option');
    },
    registAction: function() {
      var rows = $('.instockRow');
      var dates = $('input[name=instockDate]');
      var handler = $('select[name=instockHandler]');
      if (handler.val() == '選択してください。') {
        CommonScript.alert('入庫', '入力者を入力してください。');
        handler.focus();
        return;
      }
      var param = [];
      var errorflag = false;
      rows.each(function(i) {
        var instockInputUser = $(rows[i]).find('td.instockInputUser .selected input');
        var instockType = $(rows[i]).find('td.instockType .selected input');
        var instockCount = $(rows[i]).find('input[name=instockCount]');
        var instockComment = $(rows[i]).find('textarea[name=instockComment]');

        if (instockInputUser.val() == '選択してください。' && instockType.val() == '選択してください。' && instockCount.val() == ''
                && instockComment.val() == '') { return true;
        }
        if (instockInputUser.val() == '選択してください。') {
          CommonScript.alert('入庫', '取扱者が入力されていません。');
          instockType.focus();
          errorflag = true;
          return false;
        }
        if (instockType.val() == '選択してください。') {
          CommonScript.alert('入庫', '種別名が入力されていません。');
          instockType.focus();
          errorflag = true;
          return false;
        }
        if (instockCount.val() == '') {
          CommonScript.alert('入庫', '枚数が入力されていません。');
          instockCount.focus();
          errorflag = true;
          return false;
        }
        if (!regex.validateNumber(instockCount.val())) {
          CommonScript.alert('入庫', '枚数は数字で入力してください。');
          instockCount.focus();
          errorflag = true;
          return false;
        } else if (instockCount.val() == "0") {
          CommonScript.alert('入庫', '1以上の数字で入力してください。');
          instockCount.focus();
          errorflag = true;
          return false;
        }

        data = {
          instockDate: dates.val(),
          instockHandler: handler.val(),
          instockInputUser: instockInputUser.val(),
          instockType: instockType.val(),
          instockCount: instockCount.val(),
          instockComment: instockComment.val()
        }
        param.push(data);
      });
      if (errorflag == true) { return; }
      CommonScript.confirm('入庫', '登録処理を開始します。', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/stamp/instock/api/insert',
          data: JSON.stringify(param),
          dataType: 'json',
          contentType: 'application/json; charset=UTF-8',
          error: function(xhr, status, error) {
            console.log(error, xhr, status);
            CommonScript.closeLoading();
          },
          success: function(json) {
            if (json.code != 'failure') {
              CommonScript.alert('入庫', json.code + '件のデータを登録しました。');
              $('input[name=instockCount]').val("");
              $('textarea[name=instockComment]').val("");
              $('.instockRow').each(
                      function(index, element) {
                        $('.select-area .select-options', element).children()
                                .first().click();
                        $('.select-area .select-options', element).hide();
                      });
            } else {
              CommonScript.alert('入庫', '登録に失敗しました。');
            }
            CommonScript.closeLoading();
          }
        })
      })
    },
    openPopup: function() {
      $('#popup-dim').fadeIn();
      $('.instockRegist-popup').show();
    }
  }
</script>