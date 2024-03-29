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
        <title>'${themename }' 게시글 목록 -SERENDIPITY</title>
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
                    <h2 class="section-heading text-uppercase">${themename }</h2>
                    <h3 class="section-subheading text-muted">주제에 해당되는 시 목록입니다.</h3>
                </div>
                
        
	                <div class="row text-center">
	                 
	                
	                 
		                    
		                     <c:if test="${poemlist == '[]' }">
	                  			<br>
			                   <h5>작성된 게시물이 없습니다.</h5>
			                   <input type="button" class="btn btn-primary btn-md" value="글 작성"  onclick="window.location.href='${pageContext.request.contextPath}/poem/write'">
			                   
			                  </c:if>
			                   <c:if test="${poemlist != '[]' }">
			                    <table class="table table-hover table-borderless">
			                   
				                    	<tr class="table-primary ">
				                    		<th> # </th>
				                    		<th> TITLE </th>
			                    			<th> POET </th>
			                    			<th> HIT </th>
			                    			<th> COMMENT </th>
			                    			<th> DATE </th>
				                    		<th>  </th>
				                    	</tr>
			                    	 <c:forEach var="poem" items="${poemlist }">
			                    	 <c:set var="i" value="${i+1 }"/>
			                    	 <form:form class="form-horizontal" modelAttribute="content" role="form" method="get" action="${pageContext.request.contextPath}/poem/content">
			                    	 	
				                    	<tr>
				                    		<td> ${i }</td>
				                    		<td> ${poem.title }</td>
				                    		<td> ${poem.memberNickname }</td>
				                    		<td> ${poem.hit }</td>
				                    		<td> ${poem.commentCount }</td>				                    		
				                    		<td> ${poem.regDate }</td>
				                    		<form:input type="hidden" path="id" value="${poem.id }" />
				                    		<td><input type="submit" class="btn btn-primary btn-sm" value="상세"></td>

				                    	</tr>
				                    	
				                    </form:form>
			                    </c:forEach>
			                  </table> 	
			                   </c:if>
		                   </div>
		                 
	                  	</div>
	                 
                 <br><br><br>

              
            </div>
                   <br><br><br><br><br><br>
            
            	  <div class="text-center">
                    <div >
                         &nbsp;&nbsp;
                        <input type="button" class="btn btn-secondary btn-md" value="뒤로" onclick="history.back();">&nbsp;&nbsp;
                        <input type="button" class="btn btn-dark btn-md" value="메인"  onclick="window.location.href='${pageContext.request.contextPath}/'">
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
