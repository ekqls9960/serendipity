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
        <title>게시글 상세 -SERENDIPITY</title>
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
                    <h2 class="section-heading text-uppercase">게시글 상세</h2>
                    <h3 class="section-subheading text-muted"><strong>조회수 </strong>${poem.hit}&nbsp;&nbsp;&nbsp;&nbsp; <strong>댓글 </strong> ${poem.commentCount }</h3>
                </div>
                <div class="row text-center">
                	<div class="col-md-2"></div>
                    <div class="col-md-8">
                    
                       <input type="button" class="btn btn-light btn-sm" value="수정" onclick="window.location.href='${pageContext.request.contextPath}/poem/edit'">&nbsp;&nbsp;
                       <input type="button" class="btn btn-light btn-sm" value="삭제"  onclick="window.location.href='${pageContext.request.contextPath}/poem/delete'">
                    <!--  
                        <h4 class="my-3">내 게시물</h4><p class="text-muted">등록한 시 목록입니다.</p>
                    <br>-->
                    <div>
	                  
	                  ===================================<br><br><br>
	                <div class="summernote" id="content">
						${poem.content}
						<!--  ${item.content}-->
					</div> 
	                  ===================================<br><br><br>
                   </div>
                    
                  </div>
					<div class="col-md-2"></div>
                   <br><br><br><br><br><br>
              <br><br><br><br><br><br>
            	  <div class="text-center">
                    <div >
                         &nbsp;&nbsp;
                        <input type="button" class="btn btn-secondary btn-md" value="뒤로" onclick="history.back();">&nbsp;&nbsp;
                        <input type="button" class="btn btn-primary btn-md" value="메인"  onclick="window.location.href='${pageContext.request.contextPath}/'">
                    </div>
                    <br>
     
                    <br>
                </div>
            
           </div>
           
        </section>
 <br>
 <br>
 
 

    <%@ include file="../common/footer.jsp" %>
    <script>
    $('.summernote').summernote({
  	  height:700,
  	  minHeight:null
    })
    
	  var content = '${poem.content}';
      $('.summernote').summernote('code',content);
      $('.summernote').summernote('disable');
    </script>
    

    </body>
    
         
      
</html>
