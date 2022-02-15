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
        <title>로그인 -SERENDIPITY</title>
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
    
  <section class="page-section bg-light" id="loginForm">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">로그인</h2>
                    <h3 class="section-subheading text-muted">세렌디피티 로그인 페이지입니다.</h3>
                </div>
              <div class="center">
              	   <form:form class="form-horizontal" modelAttribute="loginForm" role="form" method="post" action="${pageContext.request.contextPath}/login">


                
                <div class="form-group" id="divEmail">

                    <div class="col-md-10">
                    	<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                        <form:input path="email" class="form-control" id="email" data-rule-required="true" placeholder="이메일" required="required"/>
                        <br>
                    </div>
                </div>


                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
                    <div class="col-md-10">
                        
                    	<form:password path="pwd" class="form-control" id="pwd"  data-rule-required="true" placeholder="비밀번호" maxlength="30" required="required"/>
              
                     <br>
                     </div>
                           	<form:errors  class="errorMsg"/>
                </div>
              
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <input type="submit" class="btn btn-primary btn-lg" value="로그인"> &nbsp;&nbsp;
                        <input type="button" class="btn btn-dark btn-md" value="회원가입" onclick="window.location.href='${pageContext.request.contextPath}/member/join'">&nbsp;&nbsp;
                        <input type="button" class="btn btn-secondary btn-md" value="이메일찾기" onclick="window.location.href='${pageContext.request.contextPath}/login/findEmail'">&nbsp;&nbsp;
                        <input type="button" class="btn btn-secondary btn-md" value="비밀번호찾기" onclick="window.location.href='${pageContext.request.contextPath}/login/findPwd'">
                    </div>
                    <br>
     
                    <br>
                </div>
            </form:form>
              </div>
            </div>
        </section>
 

    <%@ include file="../common/footer.jsp" %>

    </body>
    
         
      
</html>
