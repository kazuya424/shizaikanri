<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form name="form1">
	<div class="full-conts">
		<div class="cont-contents" style="display: block">
			<div class="area">
				<div class="select-title">入力日付<span style="color:red">※必須</span></div>
				<input type="text" class="datepicker1" name="instockDate">
			</div>
			<div class="select-area">
				<div class="select-title">入力者<span style="color:red">※必須</span></div>
				<select class="manager-option" name="instockHandler"></select>
			</div>
		</div>
	</div>
</form>
<form name="form2">
	<div class="full-conts">
		<div class="button-conts" style="display: block;">
			<input type="button" value="新規登録"
				onclick="StampInstockScript.registAction();">
		</div>
		<div class="table-area">
			<table style="width: 750px">
				<thead>
					<tr>
						<th>取扱者<span style="color:red">※必須</span></th>
						<th>種別名(価格)<span style="color:red">※必須</span></th>
						<th>枚数<span style="color:red">※必須</span></th>
						<th>備考</th>
					</tr>
				</thead>
				<tbody>
					<tr class="instockRow">
						<td class="instockInputUser"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockInputUser" class="manager-option1"></select>
							</div></td>
						<td class="instockType"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockType" class="type-option"></select>
							</div></td>
						<td><input type="number" name="instockCount"></td>
						<td><textarea name="instockComment"></textarea></td>
					</tr>
					<tr class="instockRow">
						<td class="instockInputUser"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockInputUser" class="manager-option1"></select>
							</div></td>
						<td class="instockType"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockType" class="type-option"></select>
							</div></td>
						<td><input type="number" name="instockCount"></td>
						<td><textarea name="instockComment"></textarea></td>
					</tr>
					<tr class="instockRow">
						<td class="instockInputUser"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockInputUser" class="manager-option1"></select>
							</div></td>
						<td class="instockType"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockType" class="type-option"></select>
							</div></td>
						<td><input type="number" name="instockCount"></td>
						<td><textarea name="instockComment"></textarea></td>
					</tr>
					<tr class="instockRow">
						<td class="instockInputUser"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockInputUser" class="manager-option1"></select>
							</div></td>
						<td class="instockType"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockType" class="type-option"></select>
							</div></td>
						<td><input type="number" name="instockCount"></td>
						<td><textarea name="instockComment"></textarea></td>
					</tr>
					<tr class="instockRow">
						<td class="instockInputUser"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockInputUser" class="manager-option1"></select>
							</div></td>
						<td class="instockType"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockType" class="type-option"></select>
							</div></td>
						<td><input type="number" name="instockCount"></td>
						<td><textarea name="instockComment"></textarea></td>
					</tr>
					<tr class="instockRow">
						<td class="instockInputUser"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockInputUser" class="manager-option1"></select>
							</div></td>
						<td class="instockType"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockType" class="type-option"></select>
							</div></td>
						<td><input type="number" name="instockCount"></td>
						<td><textarea name="instockComment"></textarea></td>
					</tr>
					<tr class="instockRow">
						<td class="instockInputUser"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockInputUser" class="manager-option1"></select>
							</div></td>
						<td class="instockType"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockType" class="type-option"></select>
							</div></td>
						<td><input type="number" name="instockCount"></td>
						<td><textarea name="instockComment"></textarea></td>
					</tr>
					<tr class="instockRow">
						<td class="instockInputUser"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockInputUser" class="manager-option1"></select>
							</div></td>
						<td class="instockType"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockType" class="type-option"></select>
							</div></td>
						<td><input type="number" name="instockCount"></td>
						<td><textarea name="instockComment"></textarea></td>
					</tr>
					<tr class="instockRow">
						<td class="instockInputUser"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockInputUser" class="manager-option1"></select>
							</div></td>
						<td class="instockType"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockType" class="type-option"></select>
							</div></td>
						<td><input type="number" name="instockCount"></td>
						<td><textarea name="instockComment"></textarea></td>
					</tr>
					<tr class="instockRow">
						<td class="instockInputUser"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockInputUser" class="manager-option1"></select>
							</div></td>
						<td class="instockType"><div class="select-area">
								<div class="select-title"></div>
								<select name="instockType" class="type-option"></select>
							</div></td>
						<td><input type="number" name="instockCount"></td>
						<td><textarea name="instockComment"></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>
</form>