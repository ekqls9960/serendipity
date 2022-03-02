<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SERENDIPITY</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    
    <style>
    #mainNav{
    	background-color:#242A30;
    	
    }
    
    </style>

    <body id="page-top">

        <!-- Navigation-->
      <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">Serendipity</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <c:if test="${member != null }">
                            <li class="nav-item"><a class="nav-link">${member.nickname }님~</a></li>
                 
                        </c:if>                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/#poetry">Poetry</a></li>
                        
                        <c:if test="${member == null }">
                     	   <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a></li>
						</c:if>
						<c:if test="${member != null }">
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/mypage">My page</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login/logout">Logout</a></li>
                 
                        </c:if>   
                        
                    </ul>
                </div>
            </div>
        </nav>
  
    <br>
    <br>

<br>
<br>
       <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>