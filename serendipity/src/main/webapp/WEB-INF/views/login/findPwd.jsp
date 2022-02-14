<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html lang="en">
    <head>

        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>이메일 결과 -SERENDIPITY</title>
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
    
  <section class="page-section bg-light" id="findEmailForm">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">비밀번호 찾기</h2>
                    <h3 class="section-subheading text-muted">세렌디피티 비밀번호 찾기 페이지입니다. </h3>
                </div>
              <div class="center">
              	  
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
 				<h2>임시 비밀번호가 전송되었습니다. 메일함을 확인해주세요!</h2>
 				<br><br>
 				<input type="button" class="btn btn-primary btn-lg" value="메인으로" onclick="window.location.href='${pageContext.request.contextPath}/'">&nbsp;&nbsp;
 				<input type="button" class="btn btn-primary btn-lg" value="로그인" onclick="window.location.href='${pageContext.request.contextPath}/login'"><br><br>
 				
 				


                    <br>
     
                    <br>
                </div>
              	  
              </div>
            </div>
            

            
        </section>
 

    <%@ include file="../common/footer.jsp" %>

    </body>
    
         
      
</html>
