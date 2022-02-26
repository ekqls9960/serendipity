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

			  display: flex;
			  position: absolute;
			  align-items: center;
         }
         

	hr{
	border:solid RGB(255,200,0); 
	align:center;
	width:50%; }
         

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
           
           			<!-- 작성자에게만 수정/삭제 버튼이 뜨도록. -->
                  	<c:if test="${member.id == poem.memberId }">    
                  		         
                       <input type="button" class="btn btn-light btn-sm" value="수정" onclick="window.location.href='${pageContext.request.contextPath}/poem/edit'">&nbsp;&nbsp;
                       <input type="button" class="btn btn-light btn-sm" value="삭제"  onclick="window.location.href='${pageContext.request.contextPath}/poem/delete'">
                   </c:if>
           
                    <!--  
                        <h4 class="my-3">내 게시물</h4><p class="text-muted">등록한 시 목록입니다.</p>
                    <br>-->
                    <div>
	                  
	                 <br><br><br>
	                <div class="summernote" id="content">
						${poem.content}
						<!--  ${item.content}-->
					</div> 
	                  <br><br><br>
                   </div>
                    
                  </div>
					<div class="col-md-2"></div>
                   <br><br><br><br><br><br>
              <br><br><br><br><br><br>
              
              	<hr>
                	
              
              
                <section class="page-section" id="response">
          
                <div class="text-center">
                    <h2>댓글</h2> 
                      <h3 class="section-subheading text-muted"><strong>댓글을 자유롭게 달아주세요 :) </strong></h3><br><br>
	              
        
                </div>
              	  <div class="row text-center ">
               <div class="col-md-2"></div>
                	<div class="col-md-8 text-center " id ="responseList">
   
                		<c:forEach var="response" items="${responseList }"> 
			                    	<table class="table table-hover">
				                    	<tr>
				                  
				                    		<td width="20%" style="text-align:center"><strong>${response.memberNickname}</strong>  &nbsp;&nbsp; </td>
				                    		<td width="50%" style="text-align:left"> ${response.content }   &nbsp;&nbsp; </td>
				                    		<td width="20%" style="text-align:right"> ${response.regDate}   &nbsp;&nbsp; </td>
				                    		<!-- 댓글 작성자에게만 삭제 버튼이 뜨도록. -->
              						    	<td><c:if test="${member.id == response.memberId }">    
              						    	   <form:form class="form-horizontal text-center" modelAttribute="response" role="form" method="get" action="${pageContext.request.contextPath}/response/delete">
              						    			<input type="submit" class="btn btn-light btn-sm" value="삭제">
              						    			<form:hidden path="id" value="${response.id }"/>
              						    		 	<form:hidden path="poemId" value="${poem.id }"/>
              						    		</form:form>
											</c:if></td>
				                    	</tr>
				                    	
				               		</table>
                		</c:forEach>
                		
                	
                    <div class="col-md-10  center">
                  	<form:form class="form-horizontal text-center" modelAttribute="response" role="form" method="post" action="${pageContext.request.contextPath}/response/add">
                  	
                  		<form:input size="60" path="content"   required="required"/>
                  		<form:hidden path="memberId" value="${member.id }"/>
                  		<form:hidden path="memberNickname" value="${member.nickname }"/>
                  		<form:hidden path="poemTitle" value="${poem.title }"/>
                  		<form:hidden path="poemId" value="${poem.id }"/>&nbsp;&nbsp;
                       <input type="submit" class="btn btn-primary btn-md" value="댓글 등록">&nbsp;&nbsp;
                     
                     </form:form>
                     
                     </div>
                	
                	</div>
                	
                	
   
                    <div>
	                  <br><br>
	              
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
