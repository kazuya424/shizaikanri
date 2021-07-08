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
			<input type="text" class="datepicker1" name="outgoingDate">
		</div>
		<div class="accordion-search">
			<div class="search-title">種別名</div>
			<input type="text" placeholder="検索" name="stockType">
		</div>
		<div class="accordion-search">
			<div class="search-title">価格</div>
			<input type="text" placeholder="検索" name="stockPrice">
		</div>
		<div class="accordion-search">
			<div class="search-title">入力者</div>
			<input type="text" placeholder="検索" name="outgoingInputUser">
		</div>
		<div class="accordion-search">
			<div class="search-title">払出会社</div>
			<input type="text" placeholder="検索" name="managerCompany">
		</div>
		<div class="accordion-search">
			<div class="search-title">送付先会社</div>
			<input type="text" placeholder="検索" name="outgoingDestination">
		</div>
		<div class="accordion-search">
			<div class="search-title">送付先担当者</div>
			<input type="text" placeholder="検索" name="outgoingManager">
		</div>
		<div class="accordion-search">
			<div class="search-title">取扱者</div>
			<input type="text" placeholder="検索" name="outgoingHandler">
		</div>
		<div class="accordion-search">
			<div class="search-title">内容</div>
			<input type="text" placeholder="検索" name="outgoingContent">
		</div>
		<div class="accordion-search">
			<div class="search-title">備考</div>
			<input type="text" placeholder="検索" name="outgoingComment">
		</div>
		<br /> <input type="button" value="検索" class="search-button"
			onclick="StampOutgoingScript.search(this);" />
	</div>
</div>

<div class="full-conts">
	<div class="button-conts" style="display: block;">
		<input type="button" value="変更"
			onclick="StampOutgoingScript.updateAction(this);"> <input
			type="button" value="削除"
			onclick="StampOutgoingScript.deleteAction(this);">
	</div>
	<div class="table-area">
		<table style="width: 2100px;">
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="150px" />
				<col width="150px" />
				<col width="150px" />
				<col width="100px" />
				<col width="150px" />
				<col width="150px" />
				<col width="150px" />
				<col width="150px" />
				<col width="150px" />
			</colgroup>
			<thead>
				<tr>
					<th><span>チェック</span></th>
					<th class="sortable" data-sort="OUTGOING_SEQ"><span>管理番号</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="OUTGOING_DATE"><span>出庫日付</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="OUTGOING_TYPE"><span>種別名(価格)</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="double-column sortable" data-sort="OUTGOING_DATE"><span>入力者<br />
					</span><img src="/resources/images/left-arrow.png"></th>
					<th class="double-column sortable" data-sort="OUTGOING_INPUTUSER"><span>取扱者<br />
					</span><img src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="B.MANAGER_COMPANY"><span>払出会社</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="OUTGOING_COUNT"><span>枚数</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="OUTGOING_DESTINATION"><span>送付先会社</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="OUTGOING_MANAGER"><span>送付先担当者</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="OUTGOING_CONTENT"><span>内容</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="OUTGOING_COMMENT"><span>備考</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="double-column sortable" data-sort="OUTGOING_REG_DT"><span>登録者<br />登録日
					</span><img src="/resources/images/left-arrow.png"></th>
					<th class="double-column sortable" data-sort="OUTGOING_UPD_DT"><span>修正者<br />修正日
					</span><img src="/resources/images/left-arrow.png"></th>
				</tr>
			</thead>
			<tbody class="list-area">
			</tbody>
		</table>
	</div>
</div>