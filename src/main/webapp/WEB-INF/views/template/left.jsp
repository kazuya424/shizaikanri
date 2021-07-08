<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="left">
	<div class="left-title">
		<span class="logo">資材管理</span> <span class="text">資材管理システム</span>
	</div>
	<div class="menu-list">
		<div
			style="font-size: 30px; line-height: 36px; border: 1px solid #fff; margin-bottom: 10px; padding: 20px; text-align: center">
			${sessionScope.Name}</div>
		<ul>
			<li class="depth1" data-target="/main"><img
				src="/resources/images/left-dashboard.png" class="icon" />ダッシュボード</li>
			<li class="depth1 contents-li"><img
				src="/resources/images/left-stamp.png" class="icon" />切手・印紙管理 <span><img
					src="/resources/images/left-arrow.png" /></span></li>
			<ul class="depth2">
				<li data-target="/stamp/list">入出庫一覧</li>
				<li data-target="/stamp/instock/regist">入庫登録</li>
				<li data-target="/stamp/instock/list">入庫修正</li>
				<li data-target="/stamp/outgoing/regist">出庫登録</li>
				<li data-target="/stamp/outgoing/list">出庫修正</li>
				<li data-target="/stamp/analyze">集計</li>
				<li data-target="/stamp/stock">在庫</li>
			</ul>
			<li class="depth1 contents-li"><img
				src="/resources/images/left-post.png" class="icon" />郵便管理 <span><img
					src="/resources/images/left-arrow.png" /></span></li>
			<ul class="depth2">
				<li data-target="/post/list">郵便一覧</li>
				<li data-target="/post/regist">郵便受付</li>
			</ul>

			<li class="depth1 contents-li"><img
				src="/resources/images/left-pc.png" class="icon" />PC管理 <span><img
					src="/resources/images/left-arrow.png" /></span></li>
			<ul class="depth2">
				<li data-target="/pcadmin/list">PC一覧</li>
				<li data-target="/pcadmin/regist">PC受付</li>
			</ul>

			<li class="depth1 contents-li"><img
				src="/resources/images/left-admin.png" class="icon" />マスター管理 <span><img
					src="/resources/images/left-arrow.png" /></span></li>
			<ul class="depth2">
				<c:if test="${sessionScope.Auth eq 'ADMIN'}">
					<li data-target="/admin/user">利用者管理</li>
				</c:if>
				<li data-target="/admin/manager">担当者管理</li>
			</ul>
		</ul>
	</div>
</div>