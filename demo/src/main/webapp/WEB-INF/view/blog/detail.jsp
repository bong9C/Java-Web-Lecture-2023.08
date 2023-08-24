<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 자주 사용 될 예정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 자주 사용 될 예정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- 자주 사용 될 예정 -->
<% pageContext.setAttribute("newline", "\n"); %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="./common/head.jspf" %>
	<style>
        th { text-align: center; width: 14.28%; }
        td { height: 100px; }
	</style>
</head>
<body>
	<%@ include file="./common/top.jspf" %>
	
	    <div class="container" style="margin-top:80px">
        <div class="row">
            <%@ include file="./common/aside.jspf" %>
            <!-- ======================= main ============================ -->
            <div class="col-9">
            <h3>
            		<strong>블로그 상세 조회</strong>
            		<span style="font-size: 0.6em;">
            			<a href="/demo/blog/list">
            				<i class="ms-5 fa-solid fa-list"></i> 목록
            			</a>
            			<a href="/demo/blog/update/${blog.bid}">
            				<i class="ms-3 fa-regular fa-pen-to-square"></i> 수정
            			</a>
            			<a href="/demo/blog/delete/${blog.bid}">
            				<i class="ms-3 fa-solid fa-trash-can"></i> 삭제
            			</a>
            		</span>
            	</h3>
            	<hr>
            	<div class="row">
            		<div class="col-8">
            			<h5>${blog.title}</h5>
            			<h6>ID: ${blog.bid} | ${fn:replace(blog.modTime, 'T', ' ')}</h6>
            		</div>
            		<div class="col-4 text-end">
            			<h5>${blog.penName}</h5>
            			<h6>조회 ${blog.viewCount}</h6>
            		</div>
            	</div>
            	<hr>
            	<div class="row">
            		<div class="col-1"></div>
            		<div class="col-10">
            			${fn:replace(blog.content, newline, '<br>')}
            		</div>
            		<div class="col-1"></div>
            	</div>
            </div>
            
             <!-- ======================= main ============================ -->
        </div>
    </div>
	
	
	
	<%@ include file="./common/bottom.jspf" %>
</body>
</html>