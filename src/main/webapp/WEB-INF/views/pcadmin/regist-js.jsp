<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    PcAdminRegistScript.init();
  })
  var PcAdminRegistScript = {
    init: function() {
      CommonScript.closeLoading();
      PcAdminRegistScript.makeList();
      PcAdminRegistScript.setSelectBox();
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
        list.append($('<tr>').attr('class', 'pcadminRow'));
        var tr = list.children().last();
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminId')));
        tr.append($('<td class="select-area" name="pcadminHoldingCompany">').append(
                $('<select class = "company-option">')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminHoldingPlace')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminUsePlace')));
        tr.append($('<td class="select-area" name="pcadminOperation">').append(
                $('<select id = "Operation">').append($('<option>').html('選択してください。').val('選択してください。')).append($('<option>').html('待機').val('待機')).append($('<option>').html('稼働中').val('稼働中')).append($('<option>').html('故障').val('故障'))));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminUser')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminLastUser')));
        tr.append($('<td class="select-area" name="pcadminType">').append(
                $('<select id = "Type">').append($('<option>').html('選択してください。').val('選択してください。')).append($('<option>').html('デスクトップ').val('デスクトップ')).append($('<option>').html('ノートパソコン').val('ノートパソコン')).append($('<option>').html('ルーター').val('ルーター'))));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminAccountName')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminPassword')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminMaker')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminModel')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminModelNum')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminEthernet')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminWifiAddress')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminCpu')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminMemory')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminHardDisk')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminInstallMedia')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminSecuritySoft')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminOffice')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminOs')));
        tr.append($('<td>').append(
                $('<input type="text">').attr('name', 'pcadminProductKey')));
        tr.append($('<td class="select-area" name="pcadminForm">').append(
                $('<select id = "Form">').append($('<option>').html('選択してください。').val('選択してください。')).append($('<option>').html('購入').val('購入')).append($('<option>').html('寄贈').val('寄贈')).append($('<option>').html('レンタル').val('レンタル'))));
        tr.append($('<td>').append(
                $('<input type="date">').attr('name', 'pcadminRetDt')));
        tr.append($('<td>').append(
                $('<input type="date">').attr('name', 'pcadminPurchaseDate')));
        tr.append($('<td>').append($('<textarea>').attr('name', 'pcadminComment')));
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
      var rows = $('.pcadminRow');
      var param = [];
      var errorflag = false;
      var pcadminId = $('input[name=pcadminId]');
      if (pcadminId.val() == '') {
        CommonScript.alert('PC登録画面', 'IDが入力されていません。');
        pcadminId.focus();
        errorflag = true;
        return false;
      }

      rows.each(function(i) {
                var pcadminId = $(rows[i]).find('input[name=pcadminId]');
                 var pcadminHoldingCompany = $(rows[i]).find(
                'td[name=pcadminHoldingCompany] .selected input');
                 var pcadminHoldingPlace = $(rows[i]).find('input[name=pcadminHoldingPlace]');
                 var pcadminUsePlace = $(rows[i]).find('input[name=pcadminUsePlace]');
                 var pcadminOperation = $(rows[i]).find(
                 'td[name=pcadminOperation] .selected input');
                 var pcadminUser = $(rows[i]).find('input[name=pcadminUser]');
                 var pcadminLastUser = $(rows[i]).find('input[name=pcadminLastUser]');
                 var pcadminType = $(rows[i]).find(
                 'td[name=pcadminType] .selected input');
                 var pcadminAccountName = $(rows[i]).find('input[name=pcadminAccountName]');
                 var pcadminPassword = $(rows[i]).find('input[name=pcadminPassword]');
                 var pcadminMaker = $(rows[i]).find('input[name=pcadminMaker]');
                 var pcadminModel = $(rows[i]).find('input[name=pcadminModel]');
                 var pcadminModelNum = $(rows[i]).find('input[name=pcadminModelNum]');
                 var pcadminEthernet = $(rows[i]).find('input[name=pcadminEthernet]');
                 var pcadminWifiAddress = $(rows[i]).find('input[name=pcadminWifiAddress]');
                 var pcadminCpu = $(rows[i]).find('input[name=pcadminCpu]');
                 var pcadminMemory = $(rows[i]).find('input[name=pcadminMemory]');
                 var pcadminHardDisk = $(rows[i]).find('input[name=pcadminHardDisk]');
                 var pcadminInstallMedia = $(rows[i]).find('input[name=pcadminInstallMedia]');
                 var pcadminSecuritySoft = $(rows[i]).find('input[name=pcadminSecuritySoft]');
                 var pcadminOffice = $(rows[i]).find('input[name=pcadminOffice]');
                 var pcadminOs = $(rows[i]).find('input[name=pcadminOs]');
                 var pcadminProductKey = $(rows[i]).find('input[name=pcadminProductKey]');
                 var pcadminForm = $(rows[i]).find(
                 'td[name=pcadminForm] .selected input');
                 var pcadminRetDt = $(rows[i]).find('input[name=pcadminRetDt]');
                 var pcadminPurchaseDate = $(rows[i]).find('input[name=pcadminPurchaseDate]');
                 var pcadminComment = $(rows[i]).find('textarea[name=pcadminComment]');


                 if (pcadminId.val() == '' && pcadminHoldingCompany.val() == '選択してください。') {return true;}

                  if (pcadminId.val() == '') {
                  CommonScript.alert('PC登録画面', 'IDが入力されていません。');
                  pcadminId.focus();
                  errorflag = true;
                  return false;
                }
                 if (pcadminHoldingCompany.val() == '選択してください。') {
                  CommonScript.alert('PC登録画面', '保有会社が選択されていません。');
                  pcadminHoldingCompany.focus();
                  errorflag = true;
                  return false;
                }
                 if (pcadminHoldingPlace.val() == '') {
                   CommonScript.alert('PC登録画面', '保管場所が入力されていません');
                   pcadminHoldingPlace.focus();
                   errorflag = true;
                   return false;
                 }
                 if (pcadminOperation.val() == "選択してください。") {
                   CommonScript.alert('PC登録画面', '稼働区分が選択されていません。');
                   pcadminOperation.focus();
                   errorflag = true;
                   return false;
                 }
                 if (pcadminUser.val() == '') {
                   CommonScript.alert('PC登録画面', '利用者が入力されていません。');
                   pcadminUser.focus();
                   errorflag = true;
                   return false;
                 }
                 if (pcadminType.val() == "選択してください。") {
                   CommonScript.alert('PC登録画面', '種類が選択されていません。');
                   pcadminType.focus();
                   errorflag = true;
                   return false;
                 }
                 if (pcadminForm.val() == '選択してください。') {
                   CommonScript.alert('PC登録画面', '形態が選択されていません。');
                   pcadminForm.focus();
                   errorflag = true;
                   return false;
                 }
                 if (pcadminPurchaseDate.val() == '') {
                   CommonScript.alert('PC登録画面', '購入日を入力してください。');
                   pcadminPurchaseDate.focus();
                   errorflag = true;
                   return false;
                 }

                 var date = CommonScript.reverseDateFormat(pcadminRetDt.val());
                 if(date != ''){
                 	var validYear = date.split('-')[0];
                 	var validMonth = date.split('-')[1];
                 	var validDate = date.split('-')[2];
                 	if(validYear < 1700 || validYear > 3000){
                    CommonScript.alert('PC登録画面', '返却年の値が正常ではありません');
                    pcadminPurchaseDate.focus();
                    errorflag = true;
                    return false;
                 	}
                 	if (!CommonScript.validDate(validYear, validMonth, validDate)) {
                          CommonScript.alert('PC登録画面', '返却日の形式が正しくありません');
                          pcadminPurchaseDate.focus();
                          errorflag = true;
                          return false;
                 	}
                 }

                 date = CommonScript.reverseDateFormat(pcadminPurchaseDate
                         .val());
                 var validYear = date.split('-')[0];
                 var validMonth = date.split('-')[1];
                 var validDate = date.split('-')[2];
                 if(validYear < 1700 || validYear > 3000){
                   CommonScript.alert('PC登録画面', '購入年の値が正常ではありません');
                   pcadminPurchaseDate.focus();
                   errorflag = true;
                   return false;
                 }
                 if (!CommonScript.validDate(validYear, validMonth, validDate)) {
                   CommonScript.alert('PC登録画面', '購入日の形式が正しくありません');
                   pcadminPurchaseDate.focus();
                   errorflag = true;
                   return false;
                   }

                data = {
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
                        pcadminPurchaseDate: pcadminPurchaseDate.val(),
                        pcadminComment: pcadminComment.val()
                }
                param.push(data);
              });
      if (errorflag == true) { return; }
      CommonScript.confirm('PC登録画面', '登録処理を開始します。', function() {
        $('.confirm-popup').find('.closeBtn').click();
        CommonScript.showLoading();
        $.ajax({
          type: 'POST',
          url: '/pcadmin/api/insert',
          data: JSON.stringify(param),
          dataType: 'json',
          contentType: 'application/json; charset=UTF-8',
          error: function(xhr, status, error) {
            console.log(error, xhr, status);
            CommonScript.closeLoading();
          },
          success: function(json) {
            if (json.code !=  'duplicate') {
              CommonScript.alert('PC登録画面', json.code + '件のデータを登録しました。');
              $('[name=pcadminId]').val("");
              $('[name=pcadminHoldingCompany]').children(".select-box").text("選択してください。");
              $('[name=pcadminHoldingPlace]').val("");
              $('[name=pcadminUsePlace]').val("");
              $('[name=pcadminOperation]').children(".select-box").text("選択してください。");
              $('[name=pcadminUser]').val("");
              $('[name=pcadminLastUser]').val("");
              $('[name=pcadminType]').children(".select-box").text("選択してください。");
              $('[name=pcadminAccountName]').val("");
              $('[name=pcadminPassword]').val("");
              $('[name=pcadminMaker]').val("");
              $('[name=pcadminModel]').val("");
              $('[name=pcadminModelNum]').val("");
              $('[name=pcadminEthernet]').val("");
              $('[name=pcadminWifiAddress]').val("");
              $('[name=pcadminCpu]').val("");
              $('[name=pcadminMemory]').val("");
              $('[name=pcadminHardDisk]').val("");
              $('[name=pcadminInstallMedia]').val("");
              $('[name=pcadminSecuritySoft]').val("");
              $('[name=pcadminOffice]').val("");
              $('[name=pcadminOs]').val("");
              $('[name=pcadminProductKey]').val("");
              $('[name=pcadminForm]').children(".select-box").text("選択してください。");
              $('[name=pcadminRetDt]').val("");
              $('[name=pcadminPurchaseDate]').val("");
              $('[name=pcadminComment]').val("");

            } else if(json.code = 'duplicate'){
              CommonScript.alert('PC登録画面', 'IDが重複しています。');
            } else {
              CommonScript.alert('PC登録画面', '登録に失敗しました。');
            }
            CommonScript.closeLoading();
          }
        })
      })
    }
  }
</script>