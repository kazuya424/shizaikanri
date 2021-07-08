<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pop-layer alert-popup">
	<div class="popup-title"></div>
	<div class="popup-contents">
		
	</div>
	<div class="popup-buttonArea">
		<input type="button" value="閉じる" class="closeBtn" onclick="CommonScript.closePopup(this);"/>
	</div>
</div>
<div class="pop-layer confirm-popup">
	<div class="popup-title"></div>
	<div class="popup-contents">
		
	</div>
	<div class="popup-buttonArea">
		<input type="button" value="閉じる" class="closeBtn" onclick="CommonScript.closePopup(this);"/>
		<input type="button" value="確認" class="popup-confirm"/>
	</div>
</div>