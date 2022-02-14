<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
    <head>

        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>이메일 인증 -SERENDIPITY</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
    
    
   		<script src="/js/addrPopup.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

         <%@ include file="../common/header.jsp" %>
         
         <style>
         .errorMsg{ color:red;
         } 
         
         .center{

         }
         

         

         </style>
    </head>
    
    

    <body id="page-top">
    
 
 
  	<div class="wrapper">
		<div class="container">
			<!-- <h3>${email } 로 인증 메일이 발송되었습니다</h3> -->
			 <c:set var ="email" value="${email}"/>
 				<c:if test ="${fn:contains(email,'naver')}">
 					<h2>
   				 	<a href="<c:url value='https://mail.naver.com'/>">${email}</a></h2>
 				</c:if>
 				<c:if test ="${fn:contains(email,'gmail')}">
    				<h2><a href="<c:url value='https://mail.google.com/mail'/>">>${email}</a></h2>
 				</c:if>
 				<c:if test ="${fn:contains(email,'daum')}">
    				<h2><a href="<c:url value='https://mail.daum.net'/>">>${email}</a></h2>
 				</c:if>
 				<h2>인증 메일을 전송했습니다. 메일함을 확인해주세요!</h2>
		</div>
	</div>
 
 

    <%@ include file="../common/footer.jsp" %>

    </body>
    
         
      
</html>
