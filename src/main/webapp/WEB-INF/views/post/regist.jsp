<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form name="form1">
	<div class="full-conts">
		<div class="cont-contents" style="display: block">
			<div class="area">
				<div class="select-title">入力日付<span style="color:red">※必須</span></div>
				<input type="text" class="datepicker1" name="postInput">
			</div>

			<div class="select-area">
				<div class="select-title">入力者<span style="color:red">※必須</span></div>
				<select class="user-option" name="postInputUser"></select>
			</div>
		</div>
	</div>
</form>
<form name="form2">
	<div class="full-conts">
		<div class="button-conts" style="display: block;">
			<input type="button" value="新規登録"
				onclick="PostRegistScript.registAction();">
		</div>
		<div class="table-area">
			<table style="width: 1150px">
				<colgroup>
					<col width="50px" />
					<col width="200px" />
					<col width="350px" />
					<col width="200px" />
					<col width="200px" />
					<col width="350px" />
				</colgroup>
				<thead>
					<tr>
						<th>項番</th>
						<th>送付元会社</th>
						<th>内容</th>
						<th>配布先会社<span style="color:red">※必須</span></th>
						<th>配布先担当者<span style="color:red">※必須</span></th>
						<th>備考</th>
					</tr>
				</thead>
				<tbody class="list-area">
				</tbody>
			</table>
		</div>
	</div>
</form>