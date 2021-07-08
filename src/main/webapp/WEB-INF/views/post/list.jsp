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
			<input type="text" class="datepicker" name="postInput">
			<div class="search-title">入力者</div>
			<input type="text" name="postInputUser" />
			<div class="search-title">送付元会社</div>
			<input type="text" name="postSender" />
			<div class="search-title">配布先会社</div>
			<input type="text" name="postCompany" />
			<div class="search-title">配布先担当者</div>
			<input type="text" name="postManager" />
		</div>
		<br /> <input type="button" value="検索" class="search-button"
			onclick="PostListScript.search(this);" />
	</div>
</div>

<div class="full-conts">
	<div class="button-conts" style="display: block;">
		<input type="button" value="変更"
			onclick="PostListScript.updateAction(this);"> <input
			type="button" value="削除" onclick="PostListScript.deleteAction(this);">
	</div>
	<div class="table-area">
		<table style="width: 2000px;">
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="200px" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="200px" />
			</colgroup>
			<thead>
				<tr>
					<th><span>チェック</span></th>
					<th class="sortable" data-sort="POST_SEQ"><span>管理番号</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="POST_INPUT"><span>入力年月日</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="t2.USER_NAME"><span>入力者</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="POST_COMMENT"><span>内容</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="POST_SENDER"><span>送付元会社</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="POST_COMPANY"><span>配布先会社</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="POST_MANAGER"><span>配布先担当者</span><img
						src="/resources/images/left-arrow.png"></th>
					<th class="sortable" data-sort="POST_REMARK"><span>備考</span><img
						src="/resources/images/left-arrow.png"></th>
				</tr>
			</thead>
			<tbody class="list-area">
			</tbody>
		</table>
	</div>
</div>