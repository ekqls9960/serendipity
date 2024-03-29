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
        <title>마이페이지 -SERENDIPITY</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
    
      		   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"> 
	<!--
  		  <script src="https://kit.fontawesome.com/6344f7dee7.js" crossorigin="anonymous"></script>  -->
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
    
 
     
        
          <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">My page</h2>
                    <h3 class="section-subheading text-muted">${member.nickname }님, 안녕하세요 :)</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                        <a href="${pageContext.request.contextPath}/poem/write">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                         </a></span>
                       
                        <h4 class="my-3">글쓰기</h4>
                        
                        <p class="text-muted">최신 주제에 맞는 글쓰기 창으로 넘어갑니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                          <a href="${pageContext.request.contextPath}/poem/mywork">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-bookmark fa-stack-1x fa-inverse"></i>
                        </a></span>
                        <h4 class="my-3">나의 활동</h4>
                        <p class="text-muted">나의 게시글, 댓글을 관리합니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                          <a href="${pageContext.request.contextPath}/member/edit">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                        </a></span>
                        <h4 class="my-3">회원 정보 수정</h4>
                        <p class="text-muted">닉네임, 비밀번호 등을 수정합니다.</p>
                    </div>
                </div>
            </div>
        </section>
 <br>
 <br>
 
 

    <%@ include file="../common/footer.jsp" %>

    </body>
    
         
      
</html>
