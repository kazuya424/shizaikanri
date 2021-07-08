<%@ page language="java" contentType="text/html; char-set=UTF-8"
	pageEncoding="UTF-8"%>
<div class="pop-layer userRegist-popup">
	<div class="popup-title">利用者情報新規登録</div>
	<div class="popup-contents">

		<div class="user-inform">
			<span class="tit">利用者ID<span style="color:red">※必須</span></span> <span class="text"><input
				type="text" name="userId" /></span>
		</div>

		<div class="user-inform">
			<span class="tit">権限<span style="color:red">※必須</span></span> <span class="text select-area"> <select
				name="userAuth">
					<option value="">選択してください。</option>
					<option value="ADMIN">ADMIN</option>
					<option value="USER">USER</option>
			</select>
			</span>
		</div>

		<div class="user-inform">
			<span class="tit">名前<span style="color:red">※必須</span></span> <span class="text"><input
				type="text" name="userName" /></span>
		</div>

		<div class="user-inform">
			<span class="tit">パスワード<span style="color:red">※必須</span></span> <span class="text"><input
				type="password" name="userPw" /></span>
		</div>

		<div class="user-inform">
			<span class="tit"></span> <span class="text"></span>
		</div>

		<div class="user-inform">
			<span class="tit">パスワード確認<span style="color:red">※必須</span></span> <span class="text"><input
				type="password" name="checkPw" /></span>
		</div>

	</div>
	<div class="popup-buttonArea">
		<input type="hidden" name="userSeq" /> <input type="button"
			value="登録" onclick="AdminUserScript.registAjax();" class="confirmBtn" />
		<input type="button" value="閉じる"
			onclick="CommonScript.closePopup(this);" class="closeBtn" />
	</div>
</div>
<div class="pop-layer userUpdate-popup">
	<div class="popup-title">利用者情報更新</div>
	<div class="popup-contents">

		<div class="user-inform">
			<span class="tit">利用者ID</span> <span class="text"><input
				type="text" name="userId" /></span>
		</div>

		<div class="select-area">
			<div class="select-title">権限</div>
				<select name="userUpdateAuth" class="auth-option">
				</select>
		</div>


		<div class="user-inform">
			<span class="tit">名前</span> <span class="text"><input
				type="text" name="userName" /></span>
		</div>

		<div class="user-inform">
			<span class="tit">パスワード</span> <span class="text"><input
				type="password" name="userPw" /></span>
		</div>

		<div class="user-inform">
			<span class="tit"></span> <span class="text"></span>
		</div>

		<div class="user-inform">
			<span class="tit">パスワード確認</span> <span class="text"><input
				type="password" name="checkPw" /></span>
		</div>

	</div>
	<div class="popup-buttonArea">
		<input type="hidden" name="userSeq" /><input type="hidden"
			name="userUpdDt"> <input type="button" value="更新"
			onclick="AdminUserScript.updateAjax();" class="confirmBtn" /> <input
			type="button" value="閉じる" onclick="CommonScript.closePopup(this);"
			class="closeBtn" />
	</div>
</div>