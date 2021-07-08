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
	<div class="cont-contents" style="display: block">
		<div class="search">種別名</div>
		<input type="text" class="type" name="stockType" placeholder="検索">

		<br /> <input type="button" value="新規登録"
			onclick="StampStockScript.openPopup();"><input type="button"
			value="検索" class="search-button"
			onclick="StampStockScript.search(this);">
	</div>
</div>
<div class="full-conts">
	<div class="button-conts" style="display: block;">
		<input type="button" value="変更"
			onclick="StampStockScript.updateAction(this);"> <input
			type="button" value="削除"
			onclick="StampStockScript.deleteAction(this)">
	</div>
	<div class="table-area">
		<table style="width: 1100px;">
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="150px" />
				<col width="150px" />
				<col width="200px" />
				<col width="200px" />
				<col width="200px" />
			</colgroup>
			<thead>
				<tr>
					<th><span>チェック</span></th>
					<th class="sortable" data-sort="STOCK_SEQ"><span>管理番号</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="STOCK_TYPE"><span>種別名</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="STOCK_PRICE"><span>価格</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="STOCK_COUNT"><span>在庫数</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="double-column sortable" data-sort="STOCK_REG_DT"><span>入力者<br />入力年月日
					</span><img src="/resources/images/left-arrow.png"></th>
					<th class="double-column sortable" data-sort="STOCK_UPD_DT"><span>修正者<br />修正年月日
					</span><img src="/resources/images/left-arrow.png"></th>
				</tr>
			</thead>
			<tbody class="list-area">
			</tbody>
		</table>
	</div>
</div>