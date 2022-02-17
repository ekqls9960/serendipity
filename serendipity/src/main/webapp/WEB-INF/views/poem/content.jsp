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
                    <h3 class="section-subheading text-muted">조회수 : ${poem.hit} / 댓글: ${poem.commentCount }</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-6">
                        <h4 class="my-3">내 게시물</h4><p class="text-muted">등록한 시 목록입니다.</p>
                    <br>
                    <div>
	                    <table class="table table-hover table-borderless">
	                   
		                    	<tr class="table-primary ">
		                    		<th> # </th>
		                    		<th> TITLE </th>
	                    			<th> COMMENT </th>
	                    			<th> HIT </th>
	                    			<th> DATE </th>
		                    	
		                    	</tr>
	                    	 <c:forEach var="poem" items="${poemlist }">
		                    	<tr>
		                    		<td> ${poem.id }</td>
		                    		<td> ${poem.title }</td>
		                    		<td> ${poem.commentCount }</td>
		                    		<td> ${poem.hit }</td>
		                    		<td> ${poem.regDate }</td>
		                    	</tr>
		                    
	                    </c:forEach>
	                  </table> 	
                   </div>
                    
                  </div>
                 
                    
                    
                    <div class="col-md-6">
                       
                        <h4 class="my-3">내 댓글</h4>
                        <p class="text-muted">등록한 댓글 목록입니다.</p>
                    </div>
                
              
            </div>
                   <br><br><br><br><br><br>
            
            	  <div class="text-center">
                    <div class="col-lg-offset-2 col-lg-10">
                         &nbsp;&nbsp;
                        <input type="button" class="btn btn-secondary btn-md" value="뒤로" onclick="history.back();">&nbsp;&nbsp;
                        <input type="button" class="btn btn-primary btn-md" value="메인으로"  onclick="window.location.href='${pageContext.request.contextPath}/'">
                    </div>
                    <br>
     
                    <br>
                </div>
            
           </div>
           
        </section>
 <br>
 <br>
 
 

    <%@ include file="../common/footer.jsp" %>

    </body>
    
         
      
</html>
