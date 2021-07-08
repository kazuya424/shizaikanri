<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    StampAnalyzeScript.init();
  })
  var StampAnalyzeScript = {
    init: function() {
      CommonScript.closeLoading();
      StampAnalyzeScript.setSelectBox();
    },
    makeList: function(json) {
      var analyzeList = json.tblOutgoing;
      var list = $('.list-area');
      list.children().remove();
      for (var i = 0; i < analyzeList.length; i++) {
        list.append($('<tr>').attr('class', 'listRow'));
        var tr = list.children().last();
        tr.append($('<td>').text(analyzeList[i].stockInfo.stockType).attr(
                'name', 'stockInfo.stockType'));
        tr.append($('<td>').text(analyzeList[i].stockInfo.stockPrice).attr(
                'name', 'stockInfo.stockPrice'));
        tr.append($('<td>').text(analyzeList[i].outgoingCount).attr('name',
                'outgoingCount'));
        tr.append($('<td>').text(analyzeList[i].priceTimesCount).attr('name',
                'priceTimesCount'));
      }
      list.append($('<tr>').attr('class', 'totalRow'));
      var tr = list.children().last();
      tr.append($('<td>').attr('colspan', '2').text('合計'));
      tr
              .append($('<td>').text(json.stampTotalCount + '枚').attr(
                      'colspan', '1'))
      tr
              .append($('<td>').text(json.stampTotalPrice + '円').attr(
                      'colspan', '1'));

    },
    setSelectBox: function() {
      CommonScript.makeSelectBoxAddOption('TBL_MANAGER', 'MANAGER_COMPANY',
              'MANAGER_SEQ', 'MANAGER_IS_DELETE', 'MANAGER_NAME=""',
              'company-option');
    },

    analyzeAction: function() {
      var rows = $('.postRow');
      var outgoingDate = $('input[name=outgoingDate]');
      var outgoingCompany = $('select[name=outgoingCompany]');

      var validYear = outgoingDate.val().split('/')[0];
      var validMonth = outgoingDate.val().split('/')[1];
      if (validMonth > 12 || validMonth == 0 || validYear.length != 4
              || validMonth.length != 2) {
        CommonScript.alert('集計', '年月の形式が正しくありません');
        outgoingDate.focus();
        return;
      }
      if (outgoingCompany.val() == '選択してください。') {
        CommonScript.alert('集計', '払出会社を選択してください。');
        outgoingCompany.focus();
        return;
      }

      param = {
        outgoingDate: outgoingDate.val(),
        outgoingCompany: outgoingCompany.val(),
      }
      CommonScript.showLoading();
      $.ajax({
        type: 'POST',
        url: '/stamp/analyze/api/list',
        data: JSON.stringify(param),
        dataType: 'json',
        contentType: 'application/json; charset=UTF-8',
        error: function(xhr, status, error) {
          console.log(error, xhr, status);
          CommonScript.closeLoading();
        },
        success: function(json) {
          if (json.code != 'failure') {
            if (json.tblOutgoing.length == 0) {
              CommonScript.alert('郵便', '対象のデータがありません。');
            }
            StampAnalyzeScript.makeList(json);
          } else {
            CommonScript.alert('集計', '集計処理に失敗しました。');
          }
          CommonScript.closeLoading();
        }
      })
    },

    pdfAction: function(varIntX) {
      function utf16_to_hexcode(str) {
        var strText = str.replace(/[A-Za-z0-9]/g, function(s) {
          return String.fromCharCode(s.charCodeAt(0) + 0xFEE0);
        });
        var tmpCode = "";
        var strCode = "";
        var strTmpCode = "";
        var arr = strText.split('');
        var intArr = Number(arr.length);
        for (var i = 0; i < intArr; i++) {
          strCode = strCode + escape(arr[i]).replace(/%u/g, "");
        }
        return strCode;
      }
      ;

      // 半角を全角に変換する。
      function han2zen(str) {
        str = str.toString();
        var zenkaku = '';
        str.split('').forEach(function(s) {
          zenkaku += String.fromCharCode(s.charCodeAt(0) + 0xFEE0);
        });
        return zenkaku;
      }



      //表示
      var doc = new jsPDF('p', 'pt', 'a4', false);
      var listRow = $(".listRow");
      var total = $('.totalRow').eq(0).html()
              .replaceAll('</td>', '&nbsp;</td>');
      var outgoingDate = $('input[name=outgoingDate]').prepend("年月：");
      var validYear = outgoingDate.val().split('/')[0];
      var validMonth = outgoingDate.val().split('/')[1];
      var company = $(".select-box").text();

      doc.setFontSize(30);
      doc.text(250, 130, utf16_to_hexcode('【集計】'));
      doc.fromHTML(total, 40, 150, {
        'width': 300
      });
      doc.setLineWidth(1.5)
      /*       line(左右、高さ、長さ、高さ)
       */
      doc.line(50, 180, 570, 180)
      doc.setFontSize(13);
      doc.text(45, 60, utf16_to_hexcode('　' + '　' + '年月：' + validYear + '年'
              + validMonth + '月'));
      doc.text(45, 85, utf16_to_hexcode('払出会社：' + company));

      for (var i = 0; i < listRow.length; i++) {
        var n = i+1;
        var list = $('.listRow').eq(i).html()
                .replaceAll('</td>', '&nbsp;</td>').replaceAll(
                        '<td name="stockInfo.stockType">',
                        '<td name="stockInfo.stockType">'+n+'、種別：').replaceAll(
                        '<td name="stockInfo.stockPrice">',
                        '<td name="stockInfo.stockPrice">価格：').replaceAll(
                        '<td name="outgoingCount">',
                        '<td name="outgoingCount">枚数：').replaceAll(
                        '<td name="priceTimesCount">',
                        '<td name="priceTimesCount">合計金額：');
        if (i == 0) {
          doc.fromHTML(list, 40, 200, {
            'width': 300
          });
        } else if (i == 1) {
          doc.fromHTML(list, 40, 230, {
            'width': 300
          });

        } else if (i == 2) {
          doc.fromHTML(list, 40, 260, {
            'width': 300
          });
        } else if (i == 3) {
          doc.fromHTML(list, 40, 290, {
            'width': 300
          });
        } else if (i == 4) {
          doc.fromHTML(list, 40, 320, {
            'width': 300
          });

        } else if (i == 5) {
          doc.fromHTML(list, 40, 350, {
            'width': 300
          });
        } else if (i == 6) {
          doc.fromHTML(list, 40, 380, {
            'width': 300
          });
        } else if (i == 7) {
          doc.fromHTML(list, 40, 410, {
            'width': 300
          });

        } else if (i == 8) {
          doc.fromHTML(list, 40, 440, {
            'width': 300
          });
        } else if (i == 9) {
          doc.fromHTML(list, 40, 470, {
            'width': 300
          });
        } else if (i == 10) {
          doc.fromHTML(list, 40, 500, {
            'width': 300
          });

        } else if (i == 11) {
          doc.fromHTML(list, 40, 530, {
            'width': 300
          });
        } else if (i == 12) {
          doc.fromHTML(list, 40, 560, {
            'width': 300
          });
        } else if (i == 13) {
          doc.fromHTML(list, 40, 590, {
            'width': 300
          });

        } else if (i == 14) {
          doc.fromHTML(list, 40, 620, {
            'width': 300
          });
        } else if (i == 15) {
          doc.fromHTML(list, 40, 650, {
            'width': 300
          });
        } else if (i == 16) {
          doc.fromHTML(list, 40, 680, {
            'width': 300
          });

        } else if (i == 17) {
          doc.fromHTML(list, 40, 710, {
            'width': 300
          });
        } else if (i == 18) {
          doc.fromHTML(list, 40, 740, {
            'width': 300
          });
        } else if (i == 19) {
          doc.fromHTML(list, 40, 770, {
            'width': 300
          });

        } else if (i == 20) {
          doc.setPage(2);
          doc.addPage();
          doc.fromHTML(list, 40, 40, {
            'width': 300
          });
        }else if (i == 21) {
          doc.fromHTML(list, 40, 70, {
            'width': 300
          });
        } else if (i == 22) {
          doc.fromHTML(list, 40, 100, {
            'width': 300
          });
        } else if (i == 23) {
          doc.fromHTML(list, 40, 130, {
            'width': 300
          });

        } else if (i == 24) {
          doc.fromHTML(list, 40, 160, {
            'width': 300
          });
        } else if (i == 25) {
          doc.fromHTML(list, 40, 190, {
            'width': 300
          });
        } else if (i == 26) {
          doc.fromHTML(list, 40, 220, {
            'width': 300
          });

        } else if (i == 27) {
          doc.fromHTML(list, 40, 250, {
            'width': 300
          });
        } else if (i == 28) {
          doc.fromHTML(list, 40, 280, {
            'width': 300
          });
        } else if (i == 29) {
          doc.fromHTML(list, 40, 310, {
            'width': 300
          });

        } else {
          alert('30件までしか集計できません');
          exit;
        }
      }
      function getNowYMD(){
        var dt = new Date();
        var y = dt.getFullYear();
        var m = ("00" + (dt.getMonth()+1)).slice(-2);
        var d = ("00" + dt.getDate()).slice(-2);
        var result = y + "/" + m + "/" + d;
        return result;
      }
      doc.save(getNowYMD()+'集計.pdf');

    }
  }
</script>