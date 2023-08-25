<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="./common/head.jspf" %>
</head>
<body>
	<%@ include file="./common/top.jspf" %>

    <div class="container" style="margin-top:80px">
        <div class="row">
            <%@ include file="./common/aside.jspf" %>
            <!-- ================= Main ================= -->
            <div class="col-9">
            	<h3><strong>글 삭제</strong></h3>
                <hr>
                <div class="row">
                	<div class="col-1"></div>
                	<div class="col-10">
                		<div class="card border-warning">
                			<div class="card-body">
            							<div class="card-header">참말로 지와 헤어지고 싶어유?</div>
            							<br>
                						<p class="card-text text-center mt-4">
	                						<button class="btn btn-primary" onclick="location.href='/demo/blog/deleteConfirm/${bid}'">삭제</button>
	                						<button class="btn btn-secondary" onclick="location.href='/demo/blog/detail/${blog.bid}?option=DNI'">취소</button>
      									</p>
      						</div>
            			</div>
            		</div>
                	</div>
                	<div class="col-1"></div>
                </div>
            </div>
			<!-- ================= Main ================= -->
        </div>
    </div>

	<%@ include file="./common/bottom.jspf" %>

</body>
</html>