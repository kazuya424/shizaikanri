<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="accordion-conts">
	<div class="cont-title filter">
		<div class="cont-title-text">フィルター</div>
	</div>
	<div class="cont-contents" style="display: block;">
		<div class="accordion-search">
			<div class="search-title">担当者</div>
			<input type="text" class="company-option" name="managerName">
		</div>
		<br /> <input type="button" value="新規登録"
			onclick="AdminManagerScript.openRegistPopup();" /> <input
			type="button" value="検索" class="search-button"
			onclick="AdminManagerScript.search(this);" />
	</div>
</div>
<div class="full-conts">
	<div class="table-area">
		<table style="width: 1000px;">
			<colgroup>
				<col width=100px />
				<col width=200px />
				<col width=200px />
				<col width=150px />
				<col width=150px />
				<col width=100px />
				<col width=100px />
			</colgroup>
			<thead>
				<tr>
					<th class="sortable" data-sort="MANAGER_SEQ"><span>管理番号</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="MANAGER_COMPANY"><span>会社</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="MANAGER_NAME"><span>担当者</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="MANAGER_REG_DT"><span>登録日</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="MANAGER_UPD_DT"><span>修正日</span><img
						src="/resources/images/left-arrow.png"></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody class="list-area">
			</tbody>
		</table>
	</div>
</div>