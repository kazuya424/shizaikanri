<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    PostListScript.init();
  })

  var PostListScript = {
    init: function() {
      CommonScript.filterInit();
      CommonScript.sortInit();
      PostListScript.setCommonParam();
      PostListScript.listAjax();

      var datepicker = new JsDatePicker($('.datepicker'), {
        titles: '日付',
        curDates: new Date(),
        isPastOk: true,
        changeCallback: function() {
        }
      });
      datepicker.make();
      $('.datepicker').val('');
    },
    setCommonParam: function() {
      CommonScript.listParam.originalSortField = 'POST_SEQ';
      CommonScript.listParam.originalSortOrder = 'DESC';
      CommonScript.listParam.sortField = 'POST_SEQ';
      CommonScript.listParam.sortOrder = 'DESC';
      CommonScript.listParam.updateCallback = PostListScript.updateAction;
      CommonScript.listParam.listFunc = PostListScript.listAjax;
    },
    listAjax: function() {
      $.ajax({
        type: 'POST',
        url: '/post/api/list',
        data: JSON.stringify(CommonScript.listParam),
        dataType: 'json',
        contentType: 'application/json; charset=UTF-8',
        error: function(xhr, status, error) {
          console.log(error);
          CommonScript.alert('郵便', 'リスト取得に失敗しました。');
          CommonScript.closeLoading();
        },
        success: function(json) {
          if (CommonScript.listParam.page == 0) {
            $('.list-area').children().remove();
          }
          if (json.tblPost.length == 0) {
            CommonScript.alert('郵便', '表示するリストがありません。');
            $('.paging').remove();
          } else {
            PostListScript.makeList(json);
          }
          CommonScript.closeLoading();
        }
      })
    },
    makeList: function(json) {
      var postList = json.tblPost;
      var list = $('.list-area');
      for (var i = 0; i < postList.length; i++) {
        list.append($('<tr>').attr('name', postList[i].postSeq));
        var tr = list.children().last();
        tr.append($('<td>').append(
                $('<input type="checkbox">').attr('name', 'postList')));
        tr.append($('<input type="hidden">').attr('value',
                postList[i].postUpdDt).attr('name', 'postUpdDt'));
        tr.append($('<td>').text(postList[i].postSeq).attr('name', 'postSeq'));
                tr.append($('<td>').append(
                        $('<input type="date" name="postInput">').val(
                                postList[i].postInput)));
        tr.append($('<td class="select-area" name="postInputUser">').append(
                $('<select class = "user-option">')));
        tr.append($('<td>').append(
                $('<textarea>').text(postList[i].postComment).attr('name',
                        'postComment')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value', postList[i].postSender)
                        .attr('name', 'postSender')));
        tr.append($('<td class="select-area" name="postCompany">').append(
                $('<select class = "company-option">')));
        tr.append($('<td class="select-area" name="postManager">').append(
                $('<select class = "manager-option">')));
        tr.append($('<td>').append(
                $('<textarea>').text(postList[i].postRemark).attr('name',
                        'postRemark')));

        var userName = postList[i].inputUserInfo.userName;
        var managerCompany = postList[i].companyInfo.managerCompany;
        var managerName = postList[i].managerInfo.managerName;

        CommonScript
                .makeSelectBoxByElement('TBL_USER', 'USER_NAME', 'USER_SEQ',
                        'USER_IS_DELETE', tr.find('.user-option'), userName);
        CommonScript.makeSelectBoxByElement('TBL_MANAGER',
                'MANAGER_COMPANY', 'MANAGER_SEQ',
                '(MANAGER_NAME = "" OR ISNULL(MANAGER_NAME)) AND MANAGER_IS_DELETE', tr.find('.company-option'), managerCompany);
        CommonScript.makeSelectBoxByElement('TBL_MANAGER',
                'MANAGER_NAME', 'MANAGER_SEQ',
                '(MANAGER_COMPANY = "" OR ISNULL(MANAGER_COMPANY)) AND MANAGER_IS_DELETE', tr.find('.manager-option'), managerName);
      }

      $('.paging').remove();
      list.append($('<tr>').attr('class', 'paging').append(
              $('<td>').attr('onclick', 'CommonScript.nextPage();').attr(
                      'colspan', '8').text('次のページを見る')));
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
      var selectedRows = [];
      var param = [];
      var checkedRow = [];

      var postSeq = '';
      var postUpdDt = '';
      var postInput = '';
      var postInputUser = '';
      var postComment = '';
      var postSender = '';
      var postCompany = '';
      var postManager = '';
      var postRemark = '';
      var i = 0

      try {
        checkedRow = $(ele).parents('div').find("[name='postList']:checked")
                .parents('tr');
        if (checkedRow.length == 0) { throw new Error('最低1つ以上チェックをつけてください'); }

        checkedRow
                .each(function(i) {
                  selectedRows.push($(this));

                  postSeq = $(selectedRows[i]).find('td[name=postSeq]');
                  postUpdDt = $(selectedRows[i]).find('input[name=postUpdDt]');
                  postInput = $(selectedRows[i]).find('input[name=postInput]');
                  if (postInput.val() == '') { throw new Error(
                          '入力日を入力されていない行があります'); }
                  var date = CommonScript.reverseDateFormat(postInput.val());
                  var validYear = date.split('-')[0];
                  var validMonth = date.split('-')[1];
                  var validDate = date.split('-')[2];
                  if (!CommonScript.validDate(validYear, validMonth, validDate)) { throw new Error(
                          '入力日の形式が正しくない行があります'); }
                  postInputUser = $(selectedRows[i]).find(
                          'td[name=postInputUser]').find('.selected').find(
                          'input');
                  if (postInputUser.val() == '選択してください。') { throw new Error(
                          '入力者を選択してください。'); }
                  postComment = $(selectedRows[i]).find(
                          'textarea[name=postComment]');
                  if (postComment.val().length > 100) { throw new Error(
                          '内容が100文字を超えている行があります'); }
                  postSender = $(selectedRows[i])
                          .find('input[name=postSender]');
                  if (postSender.val().length > 100) { throw new Error(
                          '送付元会社が100文字を超えている行があります'); }
                  postCompany = $(selectedRows[i]).find('td[name=postCompany]')
                  .find('.selected').find('input');
                  if (postCompany.val() == '選択してください。') { throw new Error(
                          '郵便配布先会社を選択してください。'); }
                  postManager = $(selectedRows[i]).find('td[name=postManager]')
                          .find('.selected').find('input');
                  if (postManager.val() == '選択してください。') { throw new Error(
                          '郵便配布先担当者を選択してください。'); }
                  postRemark = $(selectedRows[i]).find(
                          'textarea[name=postRemark]');
                  if (postRemark.val().length > 100) { throw new Error(
                          '備考が100文字を超えている行があります'); }

                  param[i] = {
                    postSeq: postSeq.text(),
                    postUpdDt: postUpdDt.val(),
                    postInput: date,
                    postInputUser: postInputUser.val(),
                    postComment: postComment.val(),
                    postSender: postSender.val(),
                    postCompany: postCompany.val(),
                    postManager: postManager.val(),
                    postRemark: postRemark.val()
                  };
                })
      } catch (e) {
        CommonScript.alert('郵便リスト', e);
        return false;
      }

      CommonScript
              .confirm(
                      '郵便リスト',
                      'チェックしたデータを修正しますか？',
                      function() {
                        $('.confirm-popup').find('.closeBtn').click();
                        CommonScript.showLoading();
                        $
                                .ajax({
                                  type: 'POST',
                                  url: '/post/api/list/update',
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
                                      CommonScript.alert('郵便リスト', json.code
                                              + '件のデータを更新しました。');
                                    } else {
                                      CommonScript
                                              .alert('郵便リスト',
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
      var postSeq = '';
      var postUpdDt = '';

      try {
        checkedRow = $(ele).parents('div').find("[name='postList']:checked")
                .parents('tr');
        if (checkedRow.length == 0) throw new Error('最低1つ以上チェックをつけてください');

        checkedRow.each(function(i) {
          selectedRows.push($(this));

          postSeq = $(selectedRows[i]).find('td[name=postSeq]');
          postUpdDt = $(selectedRows[i]).find('input[name=postUpdDt]');

          param[i] = {
            postSeq: postSeq.text(),
            postUpdDt: postUpdDt.val()
          };
        })
      } catch (e) {
        CommonScript.alert('郵便リスト', e);
        return false;
      }

      CommonScript.confirm('郵便リスト', 'チェックしたデータを削除しますか？', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/post/api/list/delete',
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
              CommonScript.alert('郵便リスト', json.code + '件のデータを削除しました。');
            } else {
              CommonScript.alert('担当者',
                      'データを削除する時に問題が出ました。もう少し時間がたってからもう一回試してください。')
            }
            CommonScript.closeLoading();
          }
        })
      })
    }
  }
</script>