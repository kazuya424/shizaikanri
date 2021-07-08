<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    StampOutgoingScript.init();
  })
  var StampOutgoingScript = {
    init: function() {
      CommonScript.closeLoading();
      StampOutgoingScript.setSelectBox();
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
      CommonScript.makeSelectBoxByElement('TBL_STOCK',
              'CONCAT(STOCK_TYPE,"(",STOCK_PRICE,"円)")', 'STOCK_SEQ',
              'STOCK_IS_DELETE', 'select[name=outgoingType]',
              'outgoingType-option');
      CommonScript.makeSelectBoxAddOption('TBL_MANAGER', 'MANAGER_COMPANY',
              'MANAGER_SEQ', 'MANAGER_IS_DELETE', 'MANAGER_NAME= ""',
              'company-option');
    },

    registAction: function() {
      var rows = $('.outgoingRow');
      var dates = $('input[name=outgoingDate]');
      var handler = $('select[name=outgoingHandler]');
      if (handler.val() == '選択してください。') {
        CommonScript.alert('出庫', '入力者を入力してください。');
        handler.focus();
        return;
      }
      var param = [];
      var errorflag = false;
      rows
              .each(function(i) {
                var outgoingInputUser = $(rows[i]).find(
                        'td.outgoingInputUser .selected input');
                var outgoingType = $(rows[i]).find(
                        'td.outgoingType .selected input');
                var outgoingDestination = $(rows[i]).find(
                        'input[name=outgoingDestination]');
                var outgoingManager = $(rows[i]).find(
                        'input[name=outgoingManager]');
                var outgoingCount = $(rows[i])
                        .find('input[name=outgoingCount]');
                var outgoingCompany = $(rows[i]).find(
                        'td.outgoingCompany .selected input');
                var outgoingContent = $(rows[i]).find(
                        'textarea[name=outgoingContent]');
                var outgoingComment = $(rows[i]).find(
                        'textarea[name=outgoingComment]');

                if (  outgoingInputUser.val() == '選択してください。'
                        && outgoingType.val() == '選択してください。'
                        && outgoingDestination.val() == ''
                        && outgoingManager.val() == ''
                        && outgoingCount.val() == ''
                        && outgoingCompany.val() == '選択してください。'
                        && outgoingContent.val() == ''
                        && outgoingComment.val() == '') { return true;

                }
                if (outgoingInputUser.val() == '選択してください。') {
                  CommonScript.alert('出庫', '取扱者が入力されていません。');
                  outgoingType.focus();
                  errorflag = true;
                  return false;
                }
                if (outgoingType.val() == '選択してください。') {
                  CommonScript.alert('出庫', '種別名が入力されていません。');
                  outgoingType.focus();
                  errorflag = true;
                  return false;
                }
                if (outgoingDestination.val().length > 200) {
                  CommonScript.alert('出庫',
                          '送付先会社名の文字数が制限を越えています。200文字以内にしてください。');
                  outgoingDestination.focus();
                  errorflag = true;
                  return;
                }
                if (outgoingCount.val() == '') {
                  CommonScript.alert('出庫', '枚数が入力されていません。');
                  outgoingCount.focus();
                  errorflag = true;
                  return false;
                }
                if (!regex.validateNumber(outgoingCount.val())) {
                  CommonScript.alert('出庫', '枚数は数字で入力してください。');
                  outgoingCount.focus();
                  errorflag = true;
                  return false;
                } else if (outgoingCount.val() == "0") {
                  CommonScript.alert('出庫', '枚数は1以上の数字で入力してください。');
                  outgoingCount.focus();
                  errorflag = true;
                  return false;
                }
                if (outgoingCompany.val() == '選択してください。') {
                  CommonScript.alert('出庫', '払出会社が入力されていません。');
                  outgoingCompany.focus();
                  errorflag = true;
                  return false;
                }
                if (outgoingContent.val() == '') {
                  CommonScript.alert('出庫', '内容が入力されていません。');
                  outgoingContent.focus();
                  errorflag = true;
                  return false;
                }
                if (outgoingContent.val().length > 200) {
                  CommonScript.alert('出庫', '内容の文字数が制限を越えています。200文字以内にしてください。');
                  outgoingContent.focus();
                  errorflag = true;
                  return;
                }
                if (outgoingComment.val().length > 200) {
                  CommonScript.alert('出庫', '備考の文字数が制限を越えています。200文字以内にしてください。');
                  outgoingComment.focus();
                  errorflag = true;
                  return;
                }

                data = {
                  outgoingDate: dates.val(),
                  outgoingHandler: handler.val(),
                  outgoingInputUser: outgoingInputUser.val(),
                  outgoingType: outgoingType.val(),
                  outgoingDestination: outgoingDestination.val(),
                  outgoingManager: outgoingManager.val(),
                  outgoingCount: outgoingCount.val(),
                  outgoingCompany: outgoingCompany.val(),
                  outgoingContent: outgoingContent.val(),
                  outgoingComment: outgoingComment.val()
                }
                param.push(data);
              });
      if (errorflag == true) { return; }
      CommonScript.confirm('出庫', '登録処理を開始します。', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/stamp/outgoing/api/insert',
          data: JSON.stringify(param),
          dataType: 'json',
          contentType: 'application/json; charset=UTF-8',
          error: function(xhr, status, error) {
            console.log(error, xhr, status);
            CommonScript.closeLoading();
          },
          success: function(json) {
            if (json.code > 0) {
              CommonScript.alert('出庫', json.code + '件のデータを登録しました。');
              $('input[name=outgoingDestination]').val("");
              $('input[name=outgoingCount]').val("");
              $('textarea[name=outgoingContent]').val("");
              $('textarea[name=outgoingComment]').val("");
              $('.instockRow').each(
                      function(index, element) {
                        $('.select-area .select-options', element).children()
                                .first().click();
                        $('.select-area .select-options', element).hide();
                      });

            } else if (json.code == "inventory") {
              CommonScript.alert('出庫', '在庫不足のため登録できません。');
            } else {
              CommonScript.alert('出庫', '登録に失敗しました。');
            }
            CommonScript.closeLoading();
          }
        })
      })
    },
    openPopup: function() {
      $('#popup-dim').fadeIn();
      $('.outgoingRegist-popup').show();
    }
  }
</script>