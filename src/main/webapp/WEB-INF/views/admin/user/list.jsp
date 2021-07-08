<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="accordion-conts">
	<div class="cont-title filer">
		<div class="cont-title-text">フィルター</div>
	</div>
	<div class="cont-contents" style="display: block;">
		<div class="accordion-search">
			<div class="search-title">利用者</div>
			<input type="text" class="company-option" name="userName">
		</div>
		<br /> <input type="button" value="新規登録"
			onclick="AdminUserScript.openRegistPopup();" /> <input
			type="button" value="検索" class="search-button"
			onclick="AdminUserScript.search(this);" />
	</div>
</div>
<div class="full-conts">
	<div class="table-area">
		<table style="width: 800px;">
			<colgroup>
				<col width=100px />
				<col width=200px />
				<col width=150px />
				<col width=150px />
				<col width=100px />
				<col width=100px />
			</colgroup>
			<thead>
				<tr>
					<th class="sortable" data-sort="USER_SEQ"><span>管理番号</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="USER_NAME"><span>名前</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="USER_REG_DT"><span>登録日</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="USER_UPD_DT"><span>修正日</span><img
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