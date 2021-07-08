<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    AdminManagerScript.init();
  })

  var AdminManagerScript = {
    init: function() {
      CommonScript.sortInit();
      AdminManagerScript.setCommonParam();
      AdminManagerScript.listAjax();
    },
    setCommonParam: function() {
      CommonScript.listParam.originalSortField = 'MANAGER_SEQ';
      CommonScript.listParam.originalSortOrder = 'DESC';
      CommonScript.listParam.sortField = 'MANAGER_SEQ';
      CommonScript.listParam.sortOrder = 'DESC';
      CommonScript.listParam.updateCallback = AdminManagerScript.updateAjax;
      CommonScript.listParam.listFunc = AdminManagerScript.listAjax;
    },
    listAjax: function() {
      $.ajax({
        type: 'POST',
        url: '/admin/manager/api/list',
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
          if (json.tblManager.length == 0) {
            CommonScript.alert('担当者', '表示するリストがありません。');
            $('.paging').remove();
          } else {
            AdminManagerScript.makeList(json);
          }
          CommonScript.closeLoading();
        }
      })
    },
    makeList: function(json) {
      var managerList = json.tblManager;
      var list = $('.list-area');
      for (var i = 0; i < managerList.length; i++) {
        list.append($('<tr>'));
        var tr = list.children().last();
        tr
                .append($('<td name = "managerSeq">').text(
                        managerList[i].managerSeq));
        tr.append($('<td>').text(managerList[i].managerCompany));
        tr.append($('<td>').text(managerList[i].managerName));
        tr.append($('<td>').html(
                CommonScript.dateFormat(managerList[i].managerRegDt)));
        tr.append($('<td>').html(
                CommonScript.dateFormat(managerList[i].managerUpdDt)));
        tr.append($('<input type="hidden" name="managerUpdDt">').val(
                managerList[i].managerUpdDt));
        tr.append($('<td>').append(
                $('<input>').attr('type', 'button').attr('onclick',
                        'AdminManagerScript.getAjax(this);').val('更新')));
        tr.append($('<td>').append(
                $('<input>').attr('type', 'button').attr('onclick',
                        'AdminManagerScript.deleteAjax(this)').val('削除')));
      }
      $('.paging').remove();
      list.append($('<tr>').attr('class', 'paging').append(
              $('<td>').attr('onclick', 'CommonScript.nextPage();').attr(
                      'colspan', '6').text('次のページを見る')));
    },
    getAjax: function(ele) {
      var seq;
      seq = $(ele).parent().parent().find("[name = 'managerSeq']").text();
      var param = {
        managerSeq: seq
      };
      $.ajax({
        type: 'GET',
        url: '/admin/manager/api/' + seq,
        error: function(xhr, status, error) {
          console.log(error, xhr, status);
        },
        success: function(json) {
          var tblData = json;
          if (tblData != null) {
            $('#popup-dim').fadeIn();
            $('#popup-dim').find('input[type=text]').val('');
            $('.managerUpdate-popup').find('.popup-title').text('担当者更新 ');
            $('.managerUpdate-popup').find('.confirmBtn').attr('onclick',
                    'AdminManagerScript.updateAjax();');
            $('.managerUpdate-popup').find('input[name=managerSeq]').val(seq);
            $('.managerUpdate-popup').find('input[name=managerCompany]').val(
                    tblData.managerCompany);
            $('.managerUpdate-popup').find('input[name=managerName]').val(
                    tblData.managerName);
            $('.managerUpdate-popup').find('input[name=managerUpdDt]').val(
                    tblData.managerUpdDt);
            $('.managerUpdate-popup').show();
          } else {
            alert('保存されたデータを読み込む際に問題が出ました。もう少し時間がたってからもう一回試してください。')
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
      var pop = $('.managerRegist-popup');
      var managerCompany = pop.find('input[name=managerCompany]');
      var managerName = pop.find('input[name=managerName]');
      if ((managerCompany.val() || managerName.val()) == '') {
        CommonScript.alert('担当者', 'どちらか入力してください。');
        managerCompany.focus();
        return;
      }
      if (managerCompany.val() && managerName.val()) {
        CommonScript.alert('担当者', 'どちらか1つのみ入力してください。');
        managerCompany.focus();
        return;
      }
      var param = {
        managerCompany: managerCompany.val(),
        managerName: managerName.val()
      }
      CommonScript.confirm('担当者', '担当者のデータを登録しますか？', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/admin/manager/api/regist',
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
              CommonScript.alert('担当者', 'データを登録しました。')
            } else if (json.code == 'duplicate') {
              $('.closeBtn').click();
              var param = {
                managerCompany: managerCompany.val(),
                managerName: managerName.val()
              }
              if (managerName.val() && managerCompany.val()) {
                CommonScript.alert('担当者', '重複しています。担当者名、会社目どちらか変更してください。');
              } else if (managerCompany.val()) {
                CommonScript.alert('担当者', managerCompany.val() + 'は重複しています');
              } else if (managerName.val()) {
                CommonScript.alert('担当者', managerName.val() + 'は重複しています');
              }
            } else {
              alert('データを登録する時に問題が出ました。もう少し時間がたってからもう一回試してください。')
            }
            CommonScript.closeLoading();
          }
        })
      })

    },
    updateAjax: function() {
      var pop = $('.managerUpdate-popup');
      var managerCompany = pop.find('input[name=managerCompany]');
      var managerName = pop.find('input[name=managerName]');
      var managerSeq = pop.find('input[name=managerSeq]');
      var managerUpdDt = pop.find('input[name=managerUpdDt]');
      if ((managerCompany.val() || managerName.val()) == '') {
        CommonScript.alert('担当者', 'どちらか入力してください。');
        managerCompany.focus();
        return;
      }
      if (managerCompany.val() && managerName.val()) {
        CommonScript.alert('担当者', 'どちらか1つのみ入力してください。');
        managerCompany.focus();
        return;
      }
      var param = {
        managerSeq: managerSeq.val(),
        managerCompany: managerCompany.val(),
        managerName: managerName.val(),
        managerUpdDt: managerUpdDt.val()
      };
      CommonScript
              .confirm(
                      '担当者',
                      '担当者のデータを修正しますか？',
                      function() {
                        $('.confirm-popup').find('.closeBtn').click();
                        CommonScript.showLoading();
                        $
                                .ajax({
                                  type: 'POST',
                                  url: '/admin/manager/api/update',
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
                                      CommonScript.alert('担当者', 'データを修正しました。')
                                    } else if (json.code == 'locked') {
                                      CommonScript.alert('担当者',
                                              '他の人が更新中です。もうしばらくお待ちください。')
                                    } else if (json.code == 'update') {
                                      CommonScript.alert('担当者',
                                              '他の端末で更新されています。')
                                    } else if (json.code == 'duplicate') {
                                      $('.closeBtn').click();
                                      var param = {
                                        managerCompany: managerCompany.val(),
                                        managerName: managerName.val()
                                      }
                                      if (managerName.val()
                                              && managerCompany.val()) {
                                        CommonScript
                                                .alert('担当者',
                                                        '重複しています。担当者名、会社目どちらか変更してください。');
                                      } else if (managerCompany.val()) {
                                        CommonScript.alert('担当者',
                                                managerCompany.val()
                                                        + 'は重複しています');
                                      } else if (managerName.val()) {
                                        CommonScript.alert('担当者', managerName
                                                .val()
                                                + 'は重複しています');
                                      }
                                    } else {
                                      CommonScript
                                              .alert('担当者',
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
      var updDt = $(ele).parent().parent().find('input[name=managerUpdDt]');
      var param = {
        managerSeq: seq,
        managerUpdDt: updDt.val()
      }
      CommonScript.confirm('担当者', '担当者のデータを削除しますか？', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/admin/manager/api/delete',
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
              CommonScript.alert('担当者', 'データを削除しました。')
            } else if (json.code == 'locked') {
              CommonScript.alert('担当者', '他の人が更新中です。もうしばらくお待ちください。')
            } else if (json.code == 'update') {
              CommonScript.alert('担当者', '他の端末で更新されています。')
            } else if (json.code == 'counted') {
              CommonScript.alert('担当者', 'この担当者情報を使用しているデータがある為、削除することができません。')
            } else {
              CommonScript.alert('担当者',
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
      $('.managerRegist-popup').find('.popup-title').text('担当者登録 ');
      $('.managerRegist-popup').find('.confirmBtn').attr('onclick',
              'AdminManagerScript.registAjax();');
      $('.managerRegist-popup').show();
    }
  }
</script>