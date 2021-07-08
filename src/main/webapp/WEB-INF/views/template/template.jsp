<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tiles:insertAttribute name="meta"></tiles:insertAttribute>
</head>
<tiles:insertAttribute name="scripts"></tiles:insertAttribute>
<tiles:insertAttribute name="common"></tiles:insertAttribute>
<body>
	<div id="popup-dim">
		<div class="dimBg"></div>
		<tiles:insertAttribute name="modal" ignore="true"></tiles:insertAttribute>
		<tiles:insertAttribute name="popup"></tiles:insertAttribute>
	</div>
	<div id="dim-layer"></div>
	<div id="loading">
		<span class="title">資材管理</span>
		<span>L</span><span>O</span><span>A</span><span>D</span><span>I</span><span>N</span><span>G</span><span>...</span>
	</div>
	<div class="body">
		<tiles:insertAttribute name="left"></tiles:insertAttribute>
		<div class="container">
			<tiles:insertAttribute name="header"></tiles:insertAttribute>
			<div class="contents">
				<tiles:insertAttribute name="body"></tiles:insertAttribute>
			</div>
		</div>
	</div>
</body>
</html>