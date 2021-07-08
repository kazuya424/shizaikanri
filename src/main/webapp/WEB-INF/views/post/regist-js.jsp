<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    PostRegistScript.init();
  })
  var PostRegistScript = {
    init: function() {
      CommonScript.closeLoading();
      PostRegistScript.makeList();
      PostRegistScript.setSelectBox();
      var datepicker1 = new JsDatePicker($('.datepicker1'), {
        titles: '入力日付',
        curDates: new Date(),
        isPastOk: true,
        changeCallback: function() {
        }
      });
      datepicker1.make();
    },
    makeList: function() {
      var list = $('.list-area');
      for (var i = 0; i < 10; i++) {
        list.append($('<tr>').attr('class', 'postRow'));
        var tr = list.children().last();
        tr.append($('<td>').text(i + 1));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'postSender')));
        tr
                .append($('<td>').append(
                        $('<textarea>').attr('name', 'postComment')));
        tr.append($('<td class="select-area" name="postCompany">').append(
                $('<select class = "company-option">')));
        tr.append($('<td class="select-area" name="postManager">').append(
                $('<select class = "manager-option">')));
        tr.append($('<td>').append($('<textarea>').attr('name', 'postRemark')));
      }
    },

    setSelectBox: function() {
      CommonScript.makeSelectBox('TBL_USER', 'USER_NAME', 'USER_SEQ',
              'USER_IS_DELETE', 'user-option', ${sessionScope.Seq});
      CommonScript.makeSelectBoxAddOption('TBL_MANAGER',
              'MANAGER_NAME', 'MANAGER_SEQ',
              'MANAGER_IS_DELETE','MANAGER_COMPANY= ""', 'manager-option');

      CommonScript.makeSelectBoxAddOption('TBL_MANAGER', 'MANAGER_COMPANY',
              'MANAGER_SEQ', 'MANAGER_IS_DELETE', 'MANAGER_NAME= ""',
              'company-option');
    },

    registAction: function() {
      var rows = $('.postRow');
      var postInput = $('input[name=postInput]');
      var postInputUser = $('select[name=postInputUser]');
      if (postInputUser.val() == '選択してください。') {
        CommonScript.alert('郵便受付', '入力者を入力してください。');
        postInputUser.focus();
        return;
      }
      var param = [];
      var errorflag = false;
      rows
              .each(function(i) {

                var postSender = $(rows[i]).find('input[name=postSender]');
                var postComment = $(rows[i]).find('textarea[name=postComment]');
                var postCompany = $(rows[i]).find(
                'td[name=postCompany] .selected input');
                var postManager = $(rows[i]).find(
                        'td[name=postManager] .selected input');
                var postRemark = $(rows[i]).find('textarea[name=postRemark]');

                if (postCompany.val() == '選択してください。' && postManager.val() == '選択してください。' &&
                        postSender.val() == '' && postComment.val() == '' && postRemark.val() == '') {return true;}
                if (postCompany.val() == '選択してください。') {
                  CommonScript.alert('郵便受付', '配布先会社が選択されていません。');
                  postCompany.focus();
                  errorflag = true;
                  return false;
                }
                if (postManager.val() == '選択してください。') {
                  CommonScript.alert('郵便受付', '担当者が選択されていません。');
                  postManager.focus();
                  errorflag = true;
                  return false;
                }
                var date = CommonScript.reverseDateFormat(postInput.val());
                var validYear = date.split('-')[0];
                var validMonth = date.split('-')[1];
                var validDate = date.split('-')[2];
                if (!CommonScript.validDate(validYear, validMonth, validDate)) {
                  CommonScript.alert('郵便受付', '入力日の形式が正しくありません');
                  postInput.focus();
                  errorflag = true;
                  return false;
                }
                if (postSender.val().length > 100) {
                  CommonScript.alert('郵便受付', '送付元会社は100文字以内で記入してください');
                  postSender.focus();
                  errorflag = true;
                  return false;
                }
                if (postComment.val().length > 100) {
                  CommonScript.alert('郵便受付', '内容は100文字以内で記入してください');
                  postComment.focus();
                  errorflag = true;
                  return false;
                }
                if (postRemark.val().length > 100) {
                  CommonScript.alert('郵便受付', '備考は100文字以内で記入してください');
                  postRemark.focus();
                  errorflag = true;
                  return false;
                }

                data = {
                  postInput: postInput.val(),
                  postInputUser: postInputUser.val(),
                  postSender: postSender.val(),
                  postComment: postComment.val(),
                  postCompany: postCompany.val(),
                  postManager: postManager.val(),
                  postRemark: postRemark.val()
                }
                param.push(data);
              });
      if (errorflag == true) { return; }
      CommonScript.confirm('郵便受付', '登録処理を開始します。', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/post/api/insert',
          data: JSON.stringify(param),
          dataType: 'json',
          contentType: 'application/json; charset=UTF-8',
          error: function(xhr, status, error) {
            console.log(error, xhr, status);
            CommonScript.closeLoading();
          },
          success: function(json) {
            if (json.code != 'failure') {
              CommonScript.alert('郵便受付', json.code + '件のデータを登録しました。');
              $('[name=postSender]').val("");
              $('[name=postComment]').val("");
              $('[name=postRemark]').val("");

            } else {
              CommonScript.alert('郵便受付', '登録に失敗しました。');
            }
            CommonScript.closeLoading();
          }
        })
      })
    }
  }
</script>