<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="pop-layer stockRegist-popup">
	<div class="popup-title">在庫</div>
	<div class="popup-contents">
		<div class="user-inform">
			<span class="tit">種別名<span style="color:red">※必須</span></span> <span class="text"><input
				type="text" name="stockType" /></span>
		</div>
		<div class="user-inform">
			<span class="tit">価格<span style="color:red">※必須</span></span> <span class="text"><input
				type="text" name="stockPrice" /></span>
		</div>
	</div>
	<div class="popup-buttonArea">
		<input type="button" value="閉じる" class="closeBtn"
			onclick="CommonScript.closePopup(this);" /> <input type="button"
			value="登録" onclick="StampStockScript.registAction();" />
	</div>
</div>
