<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="accordion-conts">
	<div class="cont-title filter">
		<div class="cont-title-text">フィルター</div>
		<div class="cont-title-arrow">
			<img src="/resources/images/left-arrow.png"
				style="transform: rotate(0deg);">
		</div>
	</div>
	<div class="cont-contents" style="display: block;">
		<div class="accordion-search">
			<div class="search-title">日付</div>
			<input type="text" class="datepicker1" name="instockDate">
		</div>
		<div class="accordion-search">
			<div class="search-title">種別</div>
			<input type="text" placeholder="検索" name="stockType">
		</div>
		<div class="accordion-search">
			<div class="search-title">価格</div>
			<input type="text" placeholder="検索" name="stockPrice">
		</div>
		<div class="accordion-search">
			<div class="search-title">入力者</div>
			<input type="text" placeholder="検索" name="instockHandler">
		</div>
		<div class="accordion-search">
			<div class="search-title">取扱者</div>
			<input type="text" placeholder="検索" name="instockUser">
		</div>
		<br /> <input type="button" value="検索" class="search-button"
			onclick="StampInstockScript.search(this);" />
	</div>
</div>
<div class="full-conts">
	<div class="button-conts" style="display: block;">
		<input type="button" value="変更"
			onclick="StampInstockScript.updateAction(this);"> <input
			type="button" value="削除"
			onclick="StampInstockScript.deleteAction(this);">
	</div>
	<div class="table-area">
		<table style="width: 1300px;">
			<colgroup>
				<col width="70px" />
				<col width="70px" />
				<col width="200px" />
				<col width="200px" />
				<col width="150px" />
				<col width="100px" />
				<col width="100px" />
				<col width="200px" />
			</colgroup>
			<thead>
				<tr>
					<th><span>チェック</span></th>
					<th class="sortable" data-sort="INSTOCK_SEQ"><span>管理番号</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="INSTOCK_DATE"><span>入力年月日</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="INSTOCK_HANDLER"><span>入力者</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="INSTOCK_INPUTUSER"><span>取扱者</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="INSTOCK_TYPE"><span>種別名(価格)</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="INSTOCK_COUNT"><span>枚数</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="INSTOCK_COMMENT"><span>備考</span><img
						src="/resources/images/left-arrow.png"></th>

				</tr>
			</thead>
			<tbody class="list-area">
			</tbody>
		</table>
	</div>
</div>