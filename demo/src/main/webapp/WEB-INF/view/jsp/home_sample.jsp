<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 자주 사용 될 예정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 자주 사용 될 예정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- 자주 사용 될 예정 -->

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
            	<h3 style=text-align:center; ><storng>샘플</storng></h3>
            	<hr>
            	<%@ include file="./Homework/home_jstl1_core.jsp" %>
            </div>
             <!-- ======================= main =========== ================= -->
        </div>
    </div>
	
	
	
	<%@ include file="./common/bottom.jspf" %>
</body>
</html>