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
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top">Serendipity</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <c:if test="${member != null }">
                            <li class="nav-item"><a class="nav-link">${member.nickname }님 </a></li>
                 
                        </c:if>                        <li class="nav-item"><a class="nav-link" href="#portfolio">Poetry</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <c:if test="${member == null }">
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
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Welcome :)</div>
                <div class="masthead-heading text-uppercase">Jump into Serendipity!</div>
                 <c:if test="${member != null }">
                 	<a class="btn btn-primary btn-xl text-uppercase" href="${pageContext.request.contextPath}/poem/write">Create one</a>
                 	
                 </c:if>
                  <c:if test="${member == null }">
                <a class="btn btn-primary btn-xl text-uppercase" href="${pageContext.request.contextPath}/member/join">Free join</a>
            	</c:if>
            </div>
        </header>
        <!-- 마이페이지로 수정-->

        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Poetry</h2>
                    <h3 class="section-subheading text-muted">세렌디피티 회원의 주제별 시를 감상하세요.</h3>
                </div>
                <div class="row">
                    
                        <!-- Portfolio item-->
                        <c:forEach var="theme" items="${list }">
                       
	                        <div class="col-lg-4 col-sm-6 mb-4">
		                        <div class="portfolio-item">
		                            <a class="portfolio-link" href="${pageContext.request.contextPath}/member/join">
		                                <div class="portfolio-hover">
		                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
		                                </div>
		                                <img class="img-fluid" src="assets/img/portfolio/${theme.id }.jpg" alt="..." />
		                            </a>
		                            <div class="portfolio-caption">
		                                <div class="portfolio-caption-heading">${theme.themename }</div>
		                                <div class="portfolio-caption-subheading text-muted">#${theme.id }</div>
		                            </div>
		                        </div>
	                 	  </div>
                        </c:forEach>
                        
                  
                </div>
            </div>
        </section>
        <!-- About-->
        <section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">About</h2>
                    <h3 class="section-subheading text-muted">Get interested? feel free to join us.</h3>
                </div>
               <div class="row">
                    <div class="col-lg-4 ms-auto"><p class="lead"><br>Serendipity는 익명으로 시 창작 및 감상을 할 수 있는 모임 공간입니다.</p></div>
                    <div class="col-lg-4 me-auto"><p class="lead">이 곳에서 여러분 자신만의 Serendipity, 우연한 행운을 발견하세요!</p></div>
                </div>
               
        </section>
      
        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright &copy; dabeen 2022</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                        <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                    </div>
                </div>
            </div>
        </footer>
       
        
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
