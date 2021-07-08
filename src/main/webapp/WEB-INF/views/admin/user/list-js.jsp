<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    AdminUserScript.init();
  })

  var AdminUserScript = {
    init: function() {
      CommonScript.sortInit();
      //AdminUserScript.setSelectBox();
      AdminUserScript.setCommonParam();
      AdminUserScript.listAjax();
    },
    setSelectBox: function() {
      CommonScript.makeSelectBox('TBL_USER', 'USER_AUTH', 'USER_AUTH',
              'USER_IS_DELETE', 'auth-option');
    },
    setCommonParam: function() {
      CommonScript.listParam.originalSortField = 'USER_SEQ';
      CommonScript.listParam.originalSortOrder = 'DESC';
      CommonScript.listParam.sortField = 'USER_SEQ';
      CommonScript.listParam.sortOrder = 'DESC';
      CommonScript.listParam.updateCallback = AdminUserScript.updateAjax;
      CommonScript.listParam.listFunc = AdminUserScript.listAjax;
    },
    listAjax: function() {
      $.ajax({
        type: 'POST',
        url: '/admin/user/api/list',
        data: JSON.stringify(CommonScript.listParam),
        dataType: 'json',
        contentType: 'application/json; charset=UTF-8',
        error: function(xhr, satus, error) {
          console.log(error);
          CommonScript.closeLoading();
        },
        success: function(json) {
          if (CommonScript.listParam.page == 0) {
            $('.list-area').children().remove();
          }
          if (json.tblUser.length == 0) {
            CommonScript.alert('利用者', '表示するリストがありません。');
            $('.paging').remove();
          } else {
            AdminUserScript.makeList(json);
          }
          CommonScript.closeLoading();
        }
      })
    },
    makeList: function(json) {
      var userList = json.tblUser;
      var list = $('.list-area');
      for (var i = 0; i < userList.length; i++) {
        list.append($('<tr>'));
        var tr = list.children().last();
        tr.append($('<td name = "userSeq">').text(userList[i].userSeq));
        tr.append($('<td>').text(userList[i].userName));
        tr.append($('<td>')
                .html(CommonScript.dateFormat(userList[i].userRegDt)));
        tr.append($('<td>')
                .html(CommonScript.dateFormat(userList[i].userUpdDt)));
        tr.append($('<input type="hidden" name="userUpdDt">').val(
                userList[i].userUpdDt));
        tr.append($('<td>').append(
                $('<input>').attr('type', 'button').attr('onclick',
                        'AdminUserScript.getAjax(this);').val('更新')));
        tr.append($('<td>').append(
                $('<input>').attr('type', 'button').attr('onclick',
                        'AdminUserScript.deleteAjax(this)').val('削除')));
      }
      $('.paging').remove();
      list.append($('<tr>').attr('class', 'paging').append(
              $('<td>').attr('onclick', 'CommonScript.nextPage();').attr(
                      'colspan', '6').text('次のページを見る')));
    },
    getAjax: function(ele) {
      var seq, id, name, auth, updDt, pw;
      seq = $(ele).parent().parent().find("[name = 'userSeq']").text();
      var param = {
        managerSeq: seq
      };
      $.ajax({
        type: 'GET',
        url: '/admin/user/api/' + seq,
        contentType: 'application/json; charset=UTF-8',
        error: function(xhr, status, error) {
          console.log(error, xhr, status);
        },
        success: function(json) {
          if (json != null) {
            name = json.userName;
            id = json.userId;
            auth = json.userAuth;
            updDt = json.userUpdDt;
            pw = json.userPw;
            $('#popup-dim').fadeIn();
            var updatePopup = $('.userUpdate-popup');
            updatePopup.find('.popup-title').text('利用者修正');
            updatePopup.find('input[name=userName]').val(name);
            updatePopup.find('input[name=userUpdDt]').val(updDt);
            updatePopup.find('input[name=userId]').val(id);
            updatePopup.find('input[name=userSeq]').val(seq);
            updatePopup.find('input[name=userPw]').val(pw);
            updatePopup.find('input[name=checkPw]').val("");
            updatePopup.find('.confirmBtn').attr('onclick',
                    'AdminUserScript.updateAjax();');
            updatePopup.find('.confirmBtn').val('更新');
            $('select[name=userUpdateAuth] option').remove();
            CommonScript.makeSelectBox('TBL_USER', 'USER_AUTH', 'USER_AUTH',
                    'USER_IS_DELETE', 'auth-option', auth);
            $('#popup-dim').find('.select-options').children().each(function() {
              if ($(this).text() == auth) {
                $(this).click();
              }
            })
            $('#popup-dim').find('.select-options').hide();
            $('.userUpdate-popup').show();
            console.log(auth);
          } else {
            CommonScript.alert('利用者',
                    '保存されたデータを読み込む際に問題が出ました。もう少し時間がたってからもう一回試してください。')
          }
        }
      })
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
      CommonScript.listParam.searchObj = searchArr;
      CommonScript.listParam.page = 0;
      CommonScript.showLoading();
      CommonScript.listParam.listFunc();
    },
    registAjax: function() {
      var pop = $('.userRegist-popup');
      var userId = pop.find('input[name=userId]');
      var auth = pop.find('.select-options .selected input');
      var userName = pop.find('input[name=userName]');
      var pw = pop.find('input[name=userPw]');
      var checkPw = pop.find('input[name=checkPw]');

      if (userId.val() == '') {
        CommonScript.alert('利用者', '利用者IDを入力してください。');
        userId.focus();
        return;
      } else if (auth.val() == '') {
        CommonScript.alert('利用者', '権限を選択してください。');
        auth.focus();
        return;
      } else if (userName.val() == '') {
        CommonScript.alert('利用者', '利用者名を入力してください。');
        userName.focus();
        return;
      } else if (pw.val() == '') {
        CommonScript.alert('利用者', 'パスワードを入力してください。');
        pw.focus();
        return;
      } else if (checkPw.val() == '') {
        CommonScript.alert('利用者', 'パスワード確認を入力してください。');
        checkPw.focus();
        return;
      } else if (pw.val() != checkPw.val()) {
        CommonScript.alert('利用者', 'パスワードが一致していません。');
        checkPw.focus();
        return;
      } else if (userId.val().length > 45) {
        CommonScript.alert('利用者', '利用者IDが長すぎます。');
        userName.focus();
        return;
      } else if (userName.val().length > 45) {
        CommonScript.alert('利用者', '利用者名が長すぎます。');
        userName.focus();
        return;
      } else if (pw.val().length > 45) {
        CommonScript.alert('利用者', 'パスワードが長すぎます。');
        userName.focus();
        return;
      }

      var param = {
        userName: userName.val(),
        userAuth: auth.val(),
        userId: userId.val(),
        userPw: pw.val()

      }
      CommonScript
              .confirm(
                      '利用者',
                      '利用者のデータを登録しますか？',
                      function() {
                        $('.confirm-popup').find('.closeBtn').click();
                        CommonScript.showLoading();
                        $
                                .ajax({
                                  type: 'POST',
                                  url: '/admin/user/api/regist',
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
                                      $('.list-area').children().remove();
                                      CommonScript.listParam.listLength = CommonScript.listParam.page + 10;
                                      CommonScript.listParam.page = 0;
                                      CommonScript.listParam.listFunc();
                                      CommonScript.listParam.page = CommonScript.listParam.listLength;
                                      CommonScript.listParam.listLength = 10;
                                      CommonScript.alert('利用者', 'データを登録しました。')
                                      $('input[name=userId]').val("");
                                      $('input[name=userName]').val("");
                                      $('input[name=userPw]').val("");
                                      $('input[name=checkPw]').val("");
                                    } else if (json.code == 'duplicate') {
                                      CommonScript.alert('利用者',
                                              '重複しているIDです。IDを再入力してください。')
                                    } else {
                                      CommonScript
                                              .alert('利用者',
                                                      'データを登録する時に問題が出ました。もう少し時間がたってからもう一回試してください。')
                                    }
                                    CommonScript.closeLoading();
                                  }
                                })
                      })
    },
    updateAjax: function() {
      var pop = $('.userUpdate-popup');
      var userSeq = pop.find('input[name=userSeq]');
      var userId = pop.find('input[name=userId]');
      var auth = pop.find('.select-options .selected input');
      var userName = pop.find('input[name=userName]');
      var pw = pop.find('input[name=userPw]');
      var checkPw = pop.find('input[name=checkPw]');
      var userUpdDt = pop.find('input[name=userUpdDt]');

      if (userId.val() == '') {
        CommonScript.alert('利用者', '利用者IDを入力してください。');
        userId.focus();
        return;
      } else if (auth.val() == '選択してください。') {
        CommonScript.alert('利用者', '権限を選択してください。');
        auth.focus();
        return;
      } else if (userName.val() == '') {
        CommonScript.alert('利用者', '利用者名を入力してください。');
        userName.focus();
        return;
      } else if (pw.val() == '') {
        CommonScript.alert('利用者', 'パスワードを入力してください。');
        pw.focus();
        return;
      } else if (checkPw.val() == '') {
        CommonScript.alert('利用者', 'パスワード確認を入力してください。');
        checkPw.focus();
        return;
      } else if (pw.val() != checkPw.val()) {
        CommonScript.alert('利用者', 'パスワードが一致していません。');
        checkPw.focus();
        return;
      } else if (userId.val().length > 45) {
        CommonScript.alert('利用者', '利用者IDが長すぎます。');
        userName.focus();
        return;
      } else if (userName.val().length > 45) {
        CommonScript.alert('利用者', '利用者名が長すぎます。');
        userName.focus();
        return;
      } else if (pw.val().length > 45) {
        CommonScript.alert('利用者', 'パスワードが長すぎます。');
        userName.focus();
        return;
      }

      var param = {
        userSeq: userSeq.val(),
        userName: userName.val(),
        userAuth: auth.val(),
        userId: userId.val(),
        userPw: pw.val(),
        userUpdDt: userUpdDt.val()
      }
      CommonScript
              .confirm(
                      '利用者',
                      '利用者のデータを修正しますか？',
                      function() {
                        $('.confirm-popup').find('.closeBtn').click();
                        CommonScript.showLoading();
                        $
                                .ajax({
                                  type: 'POST',
                                  url: '/admin/user/api/update',
                                  data: JSON.stringify(param),
                                  dataType: 'json',
                                  contentType: 'application/json; charset=UTF-8',
                                  error: function(xhr, status, error) {
                                    console.log(error);
                                    CommonScript.closeLoading();
                                  },

                                  success: function(json) {
                                    if (json.code == 'success') {
                                      $('.closeBtn').click();
                                      $('.list-area').children().remove();
                                      CommonScript.listParam.listLength = CommonScript.listParam.page + 10;
                                      CommonScript.listParam.page = 0;
                                      CommonScript.listParam.listFunc();
                                      CommonScript.listParam.page = CommonScript.listParam.listLength;
                                      CommonScript.listParam.listLength = 10;
                                      CommonScript.alert('利用者', 'データを修正しました。')
                                      $('input[name=userId]').val("");
                                      $('input[name=userName]').val("");
                                      $('input[name=userPw]').val("");
                                      $('input[name=checkPw]').val("");
                                    } else if (json.code == 'locked') {
                                      CommonScript.alert('利用者',
                                              '他の人が更新中です。もうしばらくお待ちください。')
                                    } else if (json.code == 'duplicate') {
                                      CommonScript.alert('利用者',
                                              '重複しているIDです。IDを再入力してください。');
                                    } else {
                                      CommonScript
                                              .alert('利用者',
                                                      'データを修正する時に問題が出ました。もう少し時間がたってからもう一回試してください。')
                                    }
                                    CommonScript.closeLoading();
                                  }
                                })
                      })
    },
    deleteAjax: function(ele) {
      if (event.stopPropagation) {
        event.stopPropagation();
      }
      event.cancelBubble = true;
      var seq = $(ele).parent().parent().children().first().text();
      var updDt = $(ele).parent().parent().find('input[name=userUpdDt]');
      var param = {
        userSeq: seq,
        userUpdDt: updDt.val()
      }
      CommonScript.confirm('利用者', '利用者のデータを削除しますか？', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/admin/user/api/delete',
          data: JSON.stringify(param),
          dataType: 'json',
          contentType: 'application/json; charset=UTF-8',
          error: function(xhr, status, error) {
            console.log(error);
            CommonScript.closeLoading();
          },
          success: function(json) {
            if (json.code == 'success') {
              CommonScript.listParam.searchObj = [];
              CommonScript.listParam.page = 0;
              CommonScript.listParam.listFunc();
              CommonScript.alert('利用者', 'データを削除しました。')
            } else if (json.code == 'locked') {
              CommonScript.alert('利用者', '他の人が更新中です。もうしばらくお待ちください。')
            } else {
              CommonScript.alert('利用者',
                      'データを修正する時に問題が出ました。もう少し時間がたってからもう一回試してください。')
            }
            CommonScript.closeLoading();

          }
        })
      })
    },
    openRegistPopup: function() {
      $('#popup-dim').fadeIn();
      $('#popup-dim').find('input[type=text]').val('');
      $('#popup-dim').find('.select-options').children().first().click();
      $('#popup-dim').find('.select-options').hide();
      $('.userRegist-popup').find('.popup-title').text('利用者登録 ');
      $('.userRegist-popup').find('.confirmBtn').attr('onclick',
              'AdminUserScript.registAjax();');
      $('.userRegist-popup').show();
    }
  }
</script>