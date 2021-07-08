<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form name="form1">
	<div class="full-conts">
		<div class="cont-contents" style="display: block">
			<div class="area">
				<div class="select-title">
					入力日付<span style="color: red">※必須</span>
				</div>
				<input type="text" class="datepicker1" name="outgoingDate">
			</div>
			<div class="select-area">
				<div class="select-title">
					入力者<span style="color: red">※必須</span>
				</div>
				<select class="manager-option" name="outgoingHandler"></select>
			</div>
		</div>
	</div>
</form>
<form name="form2">
	<div class="full-conts">
		<div class="button-conts" style="display: block;">
			<input type="button" value="新規登録"
				onclick="StampOutgoingScript.registAction();">
		</div>
		<div class="table-area">
			<table style="width: 1600px">
				<thead>
					<tr>
						<th>取扱者<span style="color: red">※必須</span></th>
						<th>種別名(価格)<span style="color: red">※必須</span></th>
						<th>送付先会社</th>
						<th>送付先担当者</th>
						<th>枚数<br />
						<span style="color: red">※必須</span></th>
						<th>払出会社<span style="color: red">※必須</span></th>
						<th>内容<span style="color: red">※必須</span></th>
						<th>備考</th>
					</tr>
				</thead>
				<tbody>
					<tr class="outgoingRow">
						<td class="outgoingInputUser" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingInputUser" class="manager-option1"></select>
							</div></td>
						<td class="outgoingType"><div class="select-area">
								<div class="select-title"></div>
								<select name="outgoingType" class="type-option"
									data-sort="CONCAT(OUTGOING_TYPE,'(',OUTGOING_PRICE,')')"></select>
							</div></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingDestination"></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingManager"></td>
						<td><input type="number" style="width: 30px"
							name="outgoingCount"></td>
						<td class="outgoingCompany" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingCompany" class="company-option"></select>
							</div></td>
						<td><textarea name="outgoingContent"></textarea></td>
						<td><textarea name="outgoingComment"></textarea></td>
					</tr>
					<tr class="outgoingRow">
						<td class="outgoingInputUser" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingInputUser" class="manager-option1"></select>
							</div></td>
						<td class="outgoingType"><div class="select-area">
								<div class="select-title"></div>
								<select name="outgoingType" class="type-option"
									data-sort="CONCAT(OUTGOING_TYPE,'(',OUTGOING_PRICE,')')"></select>
							</div></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingDestination"></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingManager"></td>
						<td><input type="number" style="width: 30px"
							name="outgoingCount"></td>
						<td class="outgoingCompany" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingCompany" class="company-option"></select>
							</div></td>
						<td><textarea name="outgoingContent"></textarea></td>
						<td><textarea name="outgoingComment"></textarea></td>
					</tr>
					<tr class="outgoingRow">
						<td class="outgoingInputUser" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingInputUser" class="manager-option1"></select>
							</div></td>
						<td class="outgoingType"><div class="select-area">
								<div class="select-title"></div>
								<select name="outgoingType" class="type-option"
									data-sort="CONCAT(OUTGOING_TYPE,'(',OUTGOING_PRICE,')')"></select>
							</div></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingDestination"></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingManager"></td>
						<td><input type="number" style="width: 30px"
							name="outgoingCount"></td>
						<td class="outgoingCompany" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingCompany" class="company-option"></select>
							</div></td>
						<td><textarea name="outgoingContent"></textarea></td>
						<td><textarea name="outgoingComment"></textarea></td>
					</tr>
					<tr class="outgoingRow">
						<td class="outgoingInputUser" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingInputUser" class="manager-option1"></select>
							</div></td>
						<td class="outgoingType"><div class="select-area">
								<div class="select-title"></div>
								<select name="outgoingType" class="type-option"
									data-sort="CONCAT(OUTGOING_TYPE,'(',OUTGOING_PRICE,')')"></select>
							</div></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingDestination"></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingManager"></td>
						<td><input type="number" style="width: 30px"
							name="outgoingCount"></td>
						<td class="outgoingCompany" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingCompany" class="company-option"></select>
							</div></td>
						<td><textarea name="outgoingContent"></textarea></td>
						<td><textarea name="outgoingComment"></textarea></td>
					</tr>
					<tr class="outgoingRow">
						<td class="outgoingInputUser" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingInputUser" class="manager-option1"></select>
							</div></td>
						<td class="outgoingType"><div class="select-area">
								<div class="select-title"></div>
								<select name="outgoingType" class="type-option"
									data-sort="CONCAT(OUTGOING_TYPE,'(',OUTGOING_PRICE,')')"></select>
							</div></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingDestination"></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingManager"></td>
						<td><input type="number" style="width: 30px"
							name="outgoingCount"></td>
						<td class="outgoingCompany" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingCompany" class="company-option"></select>
							</div></td>
						<td><textarea name="outgoingContent"></textarea></td>
						<td><textarea name="outgoingComment"></textarea></td>
					</tr>
					<tr class="outgoingRow">
						<td class="outgoingInputUser" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingInputUser" class="manager-option1"></select>
							</div></td>
						<td class="outgoingType"><div class="select-area">
								<div class="select-title"></div>
								<select name="outgoingType" class="type-option"
									data-sort="CONCAT(OUTGOING_TYPE,'(',OUTGOING_PRICE,')')"></select>
							</div></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingDestination"></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingManager"></td>
						<td><input type="number" style="width: 30px"
							name="outgoingCount"></td>
						<td class="outgoingCompany" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingCompany" class="company-option"></select>
							</div></td>
						<td><textarea name="outgoingContent"></textarea></td>
						<td><textarea name="outgoingComment"></textarea></td>
					</tr>
					<tr class="outgoingRow">
						<td class="outgoingInputUser" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingInputUser" class="manager-option1"></select>
							</div></td>
						<td class="outgoingType"><div class="select-area">
								<div class="select-title"></div>
								<select name="outgoingType" class="type-option"
									data-sort="CONCAT(OUTGOING_TYPE,'(',OUTGOING_PRICE,')')"></select>
							</div></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingDestination"></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingManager"></td>
						<td><input type="number" style="width: 30px"
							name="outgoingCount"></td>
						<td class="outgoingCompany" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingCompany" class="company-option"></select>
							</div></td>
						<td><textarea name="outgoingContent"></textarea></td>
						<td><textarea name="outgoingComment"></textarea></td>
					</tr>
					<tr class="outgoingRow">
						<td class="outgoingInputUser" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingInputUser" class="manager-option1"></select>
							</div></td>
						<td class="outgoingType"><div class="select-area">
								<div class="select-title"></div>
								<select name="outgoingType" class="type-option"
									data-sort="CONCAT(OUTGOING_TYPE,'(',OUTGOING_PRICE,')')"></select>
							</div></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingDestination"></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingManager"></td>
						<td><input type="number" style="width: 30px"
							name="outgoingCount"></td>
						<td class="outgoingCompany" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingCompany" class="company-option"></select>
							</div></td>
						<td><textarea name="outgoingContent"></textarea></td>
						<td><textarea name="outgoingComment"></textarea></td>
					</tr>
					<tr class="outgoingRow">
						<td class="outgoingInputUser" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingInputUser" class="manager-option1"></select>
							</div></td>
						<td class="outgoingType"><div class="select-area">
								<div class="select-title"></div>
								<select name="outgoingType" class="type-option"
									data-sort="CONCAT(OUTGOING_TYPE,'(',OUTGOING_PRICE,')')"></select>
							</div></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingDestination"></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingManager"></td>
						<td><input type="number" style="width: 30px"
							name="outgoingCount"></td>
						<td class="outgoingCompany" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingCompany" class="company-option"></select>
							</div></td>
						<td><textarea name="outgoingContent"></textarea></td>
						<td><textarea name="outgoingComment"></textarea></td>
					</tr>
					<tr class="outgoingRow">
						<td class="outgoingInputUser" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingInputUser" class="manager-option1"></select>
							</div></td>
						<td class="outgoingType"><div class="select-area">
								<div class="select-title"></div>
								<select name="outgoingType" class="type-option"
									data-sort="CONCAT(OUTGOING_TYPE,'(',OUTGOING_PRICE,')')"></select>
							</div></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingDestination"></td>
						<td><input type="text" style="margin: 20px"
							name="outgoingManager"></td>
						<td><input type="number" style="width: 30px"
							name="outgoingCount"></td>
						<td class="outgoingCompany" style="width: 100px"><div
								class="select-area">
								<div class="select-title"></div>
								<select name="outgoingCompany" class="company-option"></select>
							</div></td>
						<td><textarea name="outgoingContent"></textarea></td>
						<td><textarea name="outgoingComment"></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</form>