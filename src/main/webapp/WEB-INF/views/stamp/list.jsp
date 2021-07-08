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
			<div class="search-title">入力年月日</div>
			<input type="text" class="datepicker" name="stockDate" placeholder="年/月/日/">
		</div>
		<div class="select-area">
			<div class="select-title">入力者</div>
			<select name="user" class="user-option"></select>
		</div>
		<div class="select-area">
			<div class="select-title">取扱者</div>
			<select name="handler" class="user-option"></select>
		</div>
		<div class="select-area">
			<div class="select-title">種別・価格</div>
			<select name="stock" class="stock-option"></select>
		</div>

		<br /> <input type="button" onclick="StampListScript.search(this);"
			value="検索" />
	</div>
</div>

<div class="full-conts">
	<div class="table-area">
		<table style="width: 1200px;">
			<colgroup>
				<col width="70px" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="70px" />
				<col width="100px" />
				<col width="100px" />
			</colgroup>
			<thead>
				<tr class="list-title">
					<th><span>管理番号</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="stockDate"><span>入力年月日</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="operation"><span>入出庫区分</span></th>
					<th class="sortable" data-sort="handler"><span>入力者</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="inputUser"><span>取扱者</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="stockType"><span>種別・価格</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="stockCount"><span>枚数</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="stockComment"><span>備考</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="stockContent"><span>内容</span><img
						src="/resources/images/left-arrow.png"></th>

				</tr>
			</thead>
			<tbody class="list-area">
			</tbody>
		</table>
	</div>
</div>
