<%@ page language="java" contentType="text/html; char-set=UTF-8"
	pageEncoding="UTF-8"%>
<div class="pop-layer managerRegist-popup">
	<div class="popup-title">担当者情報新規登録</div>
	<div class="popup-contents">
		<div class="user-inform">
			<span class="tit">会社名</span> <span class="text"><input
				type="text" name="managerCompany" /></span>
		</div>
		<div class="user-inform">
			<span class="tit">担当者名</span> <span class="text"><input
				type="text" name="managerName" /></span>
		</div>
	</div>
	<div class="popup-buttonArea">
		<input type="hidden" name="managerSeq" /> <input type="button"
			value="登録" onclick="AdminManagerScript.registAjax();"
			class="confirmBtn" /> <input type="button" value="閉じる"
			onclick="CommonScript.closePopup(this);" class="closeBtn" />
	</div>
</div>
<div class="pop-layer managerUpdate-popup">
	<div class="popup-title">担当者情報更新</div>
	<div class="popup-contents">
		<div class="user-inform">
			<span class="tit">会社名</span> <span class="text"><input
				type="text" name="managerCompany" /></span>
		</div>
		<div class="user-inform">
			<span class="tit">担当者名</span> <span class="text"><input
				type="text" name="managerName" /></span>
		</div>
	</div>
	<div class="popup-buttonArea">
		<input type="hidden" name="managerSeq" /> <input type="hidden"
			name="managerUpdDt"> <input type="button" value="更新"
			onclick="AdminManagerScript.updateAjax();" class="confirmBtn" /> <input
			type="button" value="閉じる" onclick="CommonScript.closePopup(this);"
			class="closeBtn" />
	</div>
</div>