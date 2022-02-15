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
        <title>작성하기 -SERENDIPITY</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />	<script src="/js/addrPopup.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


	<!-- summernote -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

         <%@ include file="../common/header.jsp" %>
         
         <style>
         .errorMsg{ color:red;
         } 
         
         .center{

         }
         

         

         </style>
    </head>
    
    

    <body id="page-top">
    <c:if test="${member == null }">
    <br>
    <br>
    <h2>로그인을 먼저 해주세요.</h2>
    <br>
    </c:if>
    <c:if test="${member != null }">
    
 
 
  <section class="page-section bg-light" id="editForm">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">작성하기</h2>
                    <h3 class="section-subheading text-muted">주제에 맞춰 시를 작성해주세요 :)</h3>
                </div>
              <div class="center">
              	   <form:form class="form-horizontal" modelAttribute="poemWriteForm" role="form" method="post" action="${pageContext.request.contextPath}/poem/write">


                
                <div class="form-group" id="divEmail">

                    <div class="col-md-10">
                    	<label for="inputEmail" class="col-lg-2 control-label">주제선택</label>
	                    	<form:select class="form-control" path="title">
	                    	<c:forEach var="theme" items="${themelist }">
								<form:option value="${theme.themename }"># ${theme.themename }</form:option>

							</c:forEach>
						</form:select>
                        <form:errors path="theme" class="errorMsg"/>
                        <br>
                    </div>
                </div>


                
                <div class="form-group" id="divNickname">
                    <label for="inputNickname" class="col-lg-2 control-label">제목</label>
                    <div class="col-md-10">
                        <form:input path="title" class="form-control" id="title" required="required"/>
                    	<form:errors path="title" class="errorMsg"/>
                   <br>
                     </div>
                </div>
                
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">내용</label>
                    <div class="col-md-10">
                    <textarea class="summernote" name="content"></textarea>
                    	
                    	<form:errors path="content" class="errorMsg"/>
                   <br>
                     </div>
                </div>
               
            
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <input type="submit" class="btn btn-primary btn-lg" value="작성 완료">
                    </div>
                </div>
            </form:form>
              </div>
            </div>
        </section>
 <br>
 <br>
 
 </c:if>
 
 <script>
      $('.summernote').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 2,
        height: 500,
        width:800,
        lang: "ko-KR"
      });
    </script>

    <%@ include file="../common/footer.jsp" %>

    </body>
    
         
      
</html>
