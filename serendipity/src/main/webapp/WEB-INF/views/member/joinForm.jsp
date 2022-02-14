<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
    <head>

        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원가입 -SERENDIPITY</title>
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
    
 
 
  <section class="page-section bg-light" id="joinForm">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">회원가입</h2>
                    <h3 class="section-subheading text-muted">세렌디피티 회원가입 페이지입니다.</h3>
                </div>
              <div class="center">
              	   <form:form class="form-horizontal" modelAttribute="memberJoinForm" role="form" method="post" action="${pageContext.request.contextPath}/member/join">


                
                <div class="form-group" id="divEmail">

                    <div class="col-md-10">
                    	<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                        <form:input path="email" class="form-control" id="email" data-rule-required="true" placeholder="이메일" required="required"/>
                        <form:errors path="email" class="errorMsg"/>
                        <br>
                    </div>
                </div>


                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
                    <div class="col-md-10">
                        
                    	<form:password path="pwd" class="form-control" id="pwd"  data-rule-required="true" placeholder="비밀번호" maxlength="30" required="required"/>
                    	<form:errors path="pwd" class="errorMsg"/>
                     <br>
                     </div>
                </div>
                <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호 확인</label>
                    <div class="col-md-10">
                    	<form:password path="confirmPwd" class="form-control" id="confirmPwd" data-rule-required="true" placeholder="비밀번호 확인" maxlength="30" required="required"/>
                    	<form:errors path="confirmPwd" class="errorMsg"/>
                     <br>
                     </div>
                </div>
                
                <div class="form-group" id="divNickname">
                    <label for="inputNickname" class="col-lg-2 control-label">닉네임</label>
                    <div class="col-md-10">
                        <form:input path="nickname" class="form-control" id="nickname" data-rule-required="true" placeholder="닉네임" maxlength="15" required="required"/>
                    	<form:errors path="nickname" class="errorMsg"/>
                   <br>
                     </div>
                </div>
                
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-md-10">
                    
                    	<form:input path="phoneNum" class="form-control onlyNumber" id="phoneNum" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11" required="required"/>
                    	<form:errors path="phoneNum" class="errorMsg"/>
                   <br>
                     </div>
                </div>
                 <div class="form-inline-form-group">
                    <label for="postCode" class="col-lg-2 control-label">우편번호</label>
                    <div class="col-md-10">
                    	<form:input path="postCode" class="form-control"/>
                        <input type="button" class="btn btn-secondary btn-sm" onClick="execDaumPostcode()" value="우편번호 검색" required="required">
                        <form:errors path="postCode" class="errorMsg"/>
                     <br>
                     </div>
                </div>
                <br>
                <div class="form-group">
                    <label for="roadAddr" class="col-lg-2 control-label">도로명 주소</label>
                    <div class="col-md-10">
                        <form:input path="roadAddr" class="form-control" required="required"/>&nbsp;
                        <form:errors path="roadAddr" class="errorMsg"/>
                     <br>
                     </div>
                </div>
                <div class="form-group">
                    <label for="detailAddr" class="col-lg-2 control-label">상세 주소</label>
                    <div class="col-md-10">
                        <form:input path="detailAddr" class="form-control" required="required"/>&nbsp;
                        <form:errors path="detailAddr" class="errorMsg"/>
                     <br>
                     </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <input type="submit" class="btn btn-primary btn-lg" value="가입하기">
                    </div>
                </div>
            </form:form>
              </div>
            </div>
        </section>
 
 
 

    <%@ include file="../common/footer.jsp" %>

    </body>
    
         
      
</html>
