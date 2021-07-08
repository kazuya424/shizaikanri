<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    PcadminListScript.init();
  })

  var PcadminListScript = {
    init: function() {
      CommonScript.filterInit();
      CommonScript.sortInit();
      PcadminListScript.setCommonParam();
      PcadminListScript.listAjax();

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
      CommonScript.listParam.originalSortField = 'PCADMIN_SEQ';
      CommonScript.listParam.originalSortOrder = 'DESC';
      CommonScript.listParam.sortField = 'PCADMIN_SEQ';
      CommonScript.listParam.sortOrder = 'DESC';
      CommonScript.listParam.updateCallback = PcadminListScript.updateAction;
      CommonScript.listParam.listFunc = PcadminListScript.listAjax;
    },
    listAjax: function() {
      $.ajax({
        type: 'POST',
        url: '/pcadmin/api/list',
        data: JSON.stringify(CommonScript.listParam),
        dataType: 'json',
        contentType: 'application/json; charset=UTF-8',
        error: function(xhr, status, error) {
          console.log(error);
          CommonScript.alert('PC管理', 'リスト取得に失敗しました。');
          CommonScript.closeLoading();
        },
        success: function(json) {
          if (CommonScript.listParam.page == 0) {
            $('.list-area').children().remove();
          }
          if (json.tblPcadmin.length == 0) {
            CommonScript.alert('PC管理', '表示するリストがありません。');
            $('.paging').remove();
          } else {
            PcadminListScript.makeList(json);
          }
          CommonScript.closeLoading();
        }
      })
    },
    makeList: function(json) {
      var pcadminList = json.tblPcadmin;
      var list = $('.list-area');
      for (var i = 0; i < pcadminList.length; i++) {

        list.append($('<tr>').attr('name', pcadminList[i].pxadminSeq));
        var tr = list.children().last();
        tr.append($('<td>').append(
                $('<input type="checkbox">').attr('name', 'pcadminList')));
        tr.append($('<td>').append(
                $('<input type="text" name="pcadminId">').val(
                        pcadminList[i].pcadminId)));
        tr.append($('<td class="select-area" name="pcadminHoldingCompany">')
                .append($('<select class = "company-option">')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminHoldingPlace).attr('name',
                        'pcadminHoldingPlace')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminUsePlace).attr('name',
                        'pcadminUsePlace')));
        tr.append($('<td class="select-area pu" neme="pcadminOperation">').append(
                $('<select class="operation'+i+'">').append(
                        $('<option>').html('選択してください。').val('選択してください。'))
                        .append($('<option>').html('待機').val('待機')).append(
                                $('<option>').html('稼働中').val('稼働中')).append(
                                $('<option>').html('故障').val('故障'))));
        $('.operation' + i).children().each(function() {
          if ($(this).val() == pcadminList[i].pcadminOperation) {
            $(this).attr('selected', 'selected')
          }
        })
        tr.append($('<td>')
                .append(
                        $('<input type="text">').attr('value',
                                pcadminList[i].pcadminUser).attr('name',
                                'pcadminUser')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminLastUser).attr('name',
                        'pcadminLastUser')));
        tr.append($('<td class="select-area" neme="pcadminType">').append(
                $('<select class="type'+i+'">').append(
                        $('<option>').html('選択してください。').val('選択してください。'))
                        .append($('<option>').html('デスクトップ').val('デスクトップ'))
                        .append($('<option>').html('ノートパソコン').val('ノートパソコン'))
                        .append($('<option>').html('ルーター').val('ルーター'))));
        $('.type' + i).children().each(function() {
          if ($(this).val() == pcadminList[i].pcadminType) {
            $(this).attr('selected', 'selected')
          }
        })
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminAccountName).attr('name',
                        'pcadminAccountName')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminPassword).attr('name',
                        'pcadminPassword')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminMaker).attr('name',
                        'pcadminMaker')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminModel).attr('name',
                        'pcadminModel')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminModelNum).attr('name',
                        'pcadminModelNum')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminEthernet).attr('name',
                        'pcadminEthernet')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminWifiAddress).attr('name',
                        'pcadminWifiAddress')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminCpu).attr('name', 'pcadminCpu')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminMemory).attr('name',
                        'pcadminMemory')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminHardDisk).attr('name',
                        'pcadminHardDisk')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminInstallMedia).attr('name',
                        'pcadminInstallMedia')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminSecuritySoft).attr('name',
                        'pcadminSecuritySoft')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminOffice).attr('name',
                        'pcadminOffice')));
        tr.append($('<td>').append(
                $('<input type="text">')
                        .attr('value', pcadminList[i].pcadminOs).attr('name',
                                'pcadminOs')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('value',
                        pcadminList[i].pcadminProductKey).attr('name',
                        'pcadminProductKey')));
        tr.append($('<td class="select-area" neme="pcadminForm">').append(
                $('<select class="form'+i+'">').append(
                        $('<option>').html('選択してください。').val('選択してください。'))
                        .append($('<option>').html("購入").val("購入")).append(
                                $('<option>').html("寄贈").val("寄贈")).append(
                                $('<option>').html("レンタル").val("レンタル"))));
        $('.form' + i).children().each(function() {
          if ($(this).val() == pcadminList[i].pcadminForm) {
            $(this).attr('selected', 'selected')
          }
        })
        tr.append($('<td>').append(
                $('<input type="date">').attr('value',
                        pcadminList[i].pcadminRetDt).attr('name',
                        'pcadminRetDt')));
        tr.append($('<td>').append(
                $('<input type="date">').attr('value',
                        pcadminList[i].pcadminPurchaseDate).attr('name',
                        'pcadminPurchaseDate')));
        tr.append($('<td>').append(
                $('<textarea>').text(pcadminList[i].pcadminComment).attr(
                        'name', 'pcadminComment')));
        tr
                .append($('<td>')
                        .html(
                                pcadminList[i].inputUserInfo.userName
                                        + '<br/>'
                                        + CommonScript
                                                .dateFormat(pcadminList[i].pcadminRegDt)));
        tr
                .append($('<td>')
                        .html(
                                pcadminList[i].userUpdIdInfo.userName
                                        + '<br/>'
                                        + CommonScript
                                                .dateFormat(pcadminList[i].pcadminUpdDt)));
        tr.append($('<input Type="hidden" name = "pcadminUpdDt">').val(
                (pcadminList[i].pcadminUpdDt)));

        tr.append($('<input Type="hidden" name = "pcadminSeq">').val(
                (pcadminList[i].pcadminSeq)));

        var managerCompany = pcadminList[i].managerInfo.managerCompany;

        CommonScript
                .makeSelectBoxByElement(
                        'TBL_MANAGER',
                        'MANAGER_COMPANY',
                        'MANAGER_SEQ',
                        '(MANAGER_NAME = "" OR ISNULL(MANAGER_NAME)) AND MANAGER_IS_DELETE',
                        tr.find('.company-option'), managerCompany);
      }

      $('.paging').remove();
      list.append($('<tr>').attr('class', 'paging').append(
              $('<td>').attr('onclick', 'CommonScript.nextPage();').attr(
                      'colspan', '31').attr('id', 'paging').text(
                      '次のページを見る 次のページを見る 次のページを見る')));

    },
    search: function(ele) {
      var searchArr = [];
      var pcadminRetDt = $('input[name=pcadminRetDt]');

      $(ele).parent().find('input[type=text]').each(function() {
        var pcadminRetDtDate = pcadminRetDt.val().replace(/\//g, "");

        var key = $(this).attr('name');
        var val = $(this).val();
        if ($(this).attr('name') == "pcadminRetDt") {
          val = pcadminRetDtDate;
        }
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

      var pcadminSeq = '';
      var pcadminUpdDt = '';
      var pcadminId = '';
      var pcadminHoldingCompany = '';
      var pcadminHoldingPlace = '';
      var pcadminUsePlace = '';
      var pcadminOperation = '';
      var pcadminUser = '';
      var pcadminLastUser = '';
      var pcadminType = '';
      var pcadminAccountName = '';
      var pcadminPassword = '';
      var pcadminMaker = '';
      var pcadminModel = '';
      var pcadminModelNum = '';
      var pcadminEthernet = '';
      var pcadminWifiAddress = '';
      var pcadminCpu = '';
      var pcadminMemory = '';
      var pcadminHardDisk = '';
      var pcadminInstallMedia = '';
      var pcadminSecuritySoft = '';
      var pcadminOffice = '';
      var pcadminOs = '';
      var pcadminProductKey = '';
      var pcadminForm = '';
      var pcadminRetDt = '';
      var pcadminPurchaseDate = '';
      var pcadminComment = '';
      var i = 0

      try {
        checkedRow = $(ele).parents('div').find("[name='pcadminList']:checked")
                .parents('tr');
        if (checkedRow.length == 0) { throw new Error('最低1つ以上チェックをつけてください'); }

        checkedRow
                .each(function(i) {
                  selectedRows.push($(this));

                  pcadminSeq = $(selectedRows[i])
                          .find('input[name=pcadminSeq]');
                  pcadminUpdDt = $(selectedRows[i]).find(
                          'input[name=pcadminUpdDt]');
                  pcadminId = $(selectedRows[i]).find('input[name=pcadminId]');
                  pcadminHoldingCompany = $(selectedRows[i]).find(
                          'td[name=pcadminHoldingCompany]').find('.selected')
                          .find('input');
                  if (pcadminHoldingCompany.val() == '選択してください。') { throw new Error(
                          '保有会社を選択してください。'); }
                  pcadminHoldingPlace = $(selectedRows[i]).find(
                          'input[name=pcadminHoldingPlace]');
                  pcadminUsePlace = $(selectedRows[i]).find(
                          'input[name=pcadminUsePlace]');
                  pcadminOperation = $(selectedRows[i]).find(
                          'td[neme=pcadminOperation]').find('.selected').find(
                          'input');
                  if (pcadminOperation.val() == '選択してください。') { throw new Error(
                  '稼働区分を選択してください。'); }
                  pcadminUser = $(selectedRows[i]).find(
                          'input[name=pcadminUser]');
                  pcadminLastUser = $(selectedRows[i]).find(
                          'input[name=pcadminLastUser]');
                  pcadminType = $(selectedRows[i]).find(
                          'td[neme="pcadminType"]').find('.selected').find(
                          'input');
                  if (pcadminType.val() == '選択してください。') { throw new Error(
                  '種類を選択してください。'); }
                  pcadminAccountName = $(selectedRows[i]).find(
                          'input[name=pcadminAccountName]');
                  pcadminPassword = $(selectedRows[i]).find(
                          'input[name=pcadminPassword]');
                  pcadminMaker = $(selectedRows[i]).find(
                          'input[name=pcadminMaker]');
                  pcadminModel = $(selectedRows[i]).find(
                          'input[name=pcadminModel]');
                  pcadminModelNum = $(selectedRows[i]).find(
                          'input[name=pcadminModelNum]');
                  pcadminEthernet = $(selectedRows[i]).find(
                          'input[name=pcadminEthernet]');
                  pcadminWifiAddress = $(selectedRows[i]).find(
                          'input[name=pcadminWifiAddress]');
                  pcadminCpu = $(selectedRows[i])
                          .find('input[name=pcadminCpu]');
                  pcadminMemory = $(selectedRows[i]).find(
                          'input[name=pcadminMemory]');
                  pcadminHardDisk = $(selectedRows[i]).find(
                          'input[name=pcadminHardDisk]');
                  pcadminInstallMedia = $(selectedRows[i]).find(
                          'input[name=pcadminInstallMedia]');
                  pcadminSecuritySoft = $(selectedRows[i]).find(
                          'input[name=pcadminSecuritySoft]');
                  pcadminOffice = $(selectedRows[i]).find(
                          'input[name=pcadminOffice]');
                  pcadminOs = $(selectedRows[i]).find('input[name=pcadminOs]');
                  pcadminProductKey = $(selectedRows[i]).find(
                          'input[name=pcadminProductKey]');
                  pcadminForm = $(selectedRows[i]).find(
                          'td[neme="pcadminForm"]').find('.selected').find(
                          'input');
                  if (pcadminForm.val() == '選択してください。') { throw new Error(
                  '形態を選択してください。'); }
                  pcadminRetDt = $(selectedRows[i]).find(
                          'input[name=pcadminRetDt]');

                  var date = CommonScript.reverseDateFormat(pcadminRetDt.val());
                  if(date != ''){
                  	var validYear = date.split('-')[0];
                  	var validMonth = date.split('-')[1];
                  	var validDate = date.split('-')[2];
                  	if(validYear < 1700 || validYear > 3000){
                  		throw new Error('返却年の値が正常ではありません');
                  	}
                  	if (!CommonScript.validDate(validYear, validMonth, validDate)) { throw new Error(
                  		'返却日の形式が正しくありません');
                  	}
                  }

                  pcadminPurchaseDate = $(selectedRows[i]).find(
                          'input[name=pcadminPurchaseDate]');
                  if (pcadminPurchaseDate.val() == '') { throw new Error(
                          '購入日を入力してください'); }
                  date = CommonScript.reverseDateFormat(pcadminPurchaseDate
                          .val());
                  var validYear = date.split('-')[0];
                  var validMonth = date.split('-')[1];
                  var validDate = date.split('-')[2];
                  if(validYear < 1700 || validYear > 3000){
                    throw new Error('購入年の値が正常ではありません');
                  }
                  if (!CommonScript.validDate(validYear, validMonth, validDate)) { throw new Error(
                          '購入日の形式が正しくありません'); }

                  pcadminComment = $(selectedRows[i]).find(
                          'textarea[name=pcadminComment]');
                  if (pcadminComment.val().length > 100) { throw new Error(
                          '内容が100文字を超えている行があります'); }

                  param[i] = {
                    pcadminSeq: pcadminSeq.val(),
                    pcadminUpdDt: pcadminUpdDt.val(),
                    pcadminId: pcadminId.val(),
                    pcadminHoldingCompany: pcadminHoldingCompany.val(),
                    pcadminHoldingPlace: pcadminHoldingPlace.val(),
                    pcadminUsePlace: pcadminUsePlace.val(),
                    pcadminOperation: pcadminOperation.val(),
                    pcadminUser: pcadminUser.val(),
                    pcadminLastUser: pcadminLastUser.val(),
                    pcadminType: pcadminType.val(),
                    pcadminAccountName: pcadminAccountName.val(),
                    pcadminPassword: pcadminPassword.val(),
                    pcadminMaker: pcadminMaker.val(),
                    pcadminModel: pcadminModel.val(),
                    pcadminModelNum: pcadminModelNum.val(),
                    pcadminEthernet: pcadminEthernet.val(),
                    pcadminWifiAddress: pcadminWifiAddress.val(),
                    pcadminCpu: pcadminCpu.val(),
                    pcadminMemory: pcadminMemory.val(),
                    pcadminHardDisk: pcadminHardDisk.val(),
                    pcadminInstallMedia: pcadminInstallMedia.val(),
                    pcadminSecuritySoft: pcadminSecuritySoft.val(),
                    pcadminOffice: pcadminOffice.val(),
                    pcadminOs: pcadminOs.val(),
                    pcadminProductKey: pcadminProductKey.val(),
                    pcadminForm: pcadminForm.val(),
                    pcadminRetDt: pcadminRetDt.val(),
                    pcadminPurchaseDate: date,
                    pcadminComment: pcadminComment.val()
                  };
                })
      } catch (e) {
        CommonScript.alert('PC管理', e);
        return false;
      }

      CommonScript
              .confirm(
                      'PC管理',
                      'チェックしたデータを修正しますか？',
                      function() {
                        $('.confirm-popup').find('.closeBtn').click();
                        CommonScript.showLoading();
                        $
                                .ajax({
                                  type: 'POST',
                                  url: '/pcadmin/api/list/update',
                                  data: JSON.stringify(param),
                                  dataType: 'json',
                                  contentType: 'application/json; charset=UTF-8',
                                  error: function(xhr, status, error) {
                                    console.log(error);
                                    CommonScript.closeLoading();
                                  },
                                  success: function(json) {
                                    if (!(json.code == 'duplicate'
                                            || json.code == 'locked' || json.code == 'failure')) {
                                      $('.closeBtn').click();
                                      $('.list-area').children().remove();
                                      CommonScript.listParam.listLength = CommonScript.listParam.page + 10;
                                      CommonScript.listParam.page = 0;
                                      CommonScript.listParam.listFunc();
                                      CommonScript.listParam.page = CommonScript.listParam.listLength;
                                      CommonScript.listParam.listLength = 10;
                                      CommonScript.alert('PC管理', json.code
                                              + '件のデータを更新しました。');
                                    } else if (json.code == 'duplicate') {
                                      CommonScript.alert('PC管理', 'IDが重複しています。');
                                    } else if (json.code == 'locked') {
                                      CommonScript.alert('PC管理',
                                              '他の人が更新中です。もうしばらくお待ちください。')
                                    } else if (json.code == 'failure') {
                                      CommonScript.alert('PC管理',
                                              'データの変更に失敗しました。')
                                    } else {
                                      CommonScript
                                              .alert('PC管理',
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
      var pcadminSeq = '';
      var pcadminUpdDt = '';

      try {
        checkedRow = $(ele).parents('div').find("[name='pcadminList']:checked")
                .parents('tr');
        if (checkedRow.length == 0) throw new Error('最低1つ以上チェックをつけてください');

        checkedRow.each(function(i) {
          selectedRows.push($(this));

          pcadminSeq = $(selectedRows[i]).find('input[name=pcadminSeq]');
          pcadminUpdDt = $(selectedRows[i]).find('input[name=pcadminUpdDt]');

          param[i] = {
            pcadminSeq: pcadminSeq.val(),
            pcadminUpdDt: pcadminUpdDt.val()
          };
        })
      } catch (e) {
        CommonScript.alert('PC管理リスト', e);
        return false;
      }

      CommonScript.confirm('PC管理リスト', 'チェックしたデータを削除しますか？', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/pcadmin/api/list/delete',
          data: JSON.stringify(param),
          dataType: 'json',
          contentType: 'application/json; charset=UTF-8',
          error: function(xhr, status, error) {
            console.log(error);
            CommonScript.closeLoading();
          },
          success: function(json) {
            if (!(json.code == 'locked' || json.code == 'failure')) {
              CommonScript.listParam.searchObj = [];
              CommonScript.listParam.page = 0;
              CommonScript.listParam.listFunc();
              CommonScript.alert('PC管理リスト', json.code + '件のデータを削除しました。');
            } else if (json.code == 'locked') {
              CommonScript.alert('利用者', '他の人が更新中です。もうしばらくお待ちください。')
            } else if (json.code == 'failure') {
              CommonScript.alert('PC管理', 'データの削除に失敗しました。')
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