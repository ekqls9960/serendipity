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
        <title>이메일 찾기 -SERENDIPITY</title>
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
                    <h2 class="section-heading text-uppercase">이메일 찾기</h2>
                    <h3 class="section-subheading text-muted">세렌디피티 이메일 찾기 페이지입니다.</h3>
                </div>
              <div class="center">
              	   <form:form class="form-horizontal" modelAttribute="findEmailForm" role="form" method="post" action="${pageContext.request.contextPath}/login/findEmail">


                
                <div class="form-group" id="divNickname">

                    <div class="col-md-10">
                    	<label for="inputNickname" class="col-lg-2 control-label">닉네임 </label>
                        <form:input path="nickname" class="form-control" id="nickname" data-rule-required="true" placeholder="가입한 닉네임" required="required"/>
                        <br>
                    </div>
                </div>


                <div class="form-group" id="divPhonenum">
                    <label for="inputPhonenum" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-md-10">
                        
                    	<form:password path="phoneNum" class="form-control" id="phoneNum"  data-rule-required="true" placeholder="가입한 휴대폰 번호" maxlength="30" required="required"/>
                     <br>
                     </div>
                </div>
                
                	<form:errors class="errorMsg"/>
              
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <input type="submit" class="btn btn-primary btn-lg" value="이메일 찾기"> &nbsp;&nbsp;
                        <input type="button" class="btn btn-secondary btn-md" value="뒤로" onclick="history.back();">&nbsp;&nbsp;
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
