<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form name="form1">
	<div class="full-conts">
		<div class="cont-contents" style="display: block">
		<div class="select-area">
			<div class="date">年月</div>
			<input type="text" name="outgoingDate" placeholder="yyyy/mm 例:2020/01">
			<div class="select-title">払出会社</div>
			<select class="company-option" name="outgoingCompany"></select>
		</div>
		<div class="button-conts" style="display: block;">
				<input type="button" value="実行"
				onclick="StampAnalyzeScript.analyzeAction();">

				<input type="button" value="PDF"
				onclick="StampAnalyzeScript.pdfAction();">
		</div>
		</div>
	</div>
</form>
<form name="form2">
	<div class="full-conts">
		<div class="table-area">
			<table style="width: 950px">
				<colgroup>
					<col width="200px" />
					<col width="350px" />
					<col width="200px" />
					<col width="350px" />
				</colgroup>
				<thead>
					<tr>
						<th>種別</th>
						<th>価格</th>
						<th>枚数</th>
						<th>合計金額</th>
					</tr>
				</thead>
				<tbody class="list-area">
				</tbody>
			</table>
		</div>
	</div>
</form>