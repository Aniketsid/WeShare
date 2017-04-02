<%@page import="java.util.ArrayList"%>

<%@page import="com.mongodb.BasicDBObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- <script type="text/javascript">
// var x,y,z;
// function sendRequest()
// {
// 	alert("hello");
// 	var a = new XMLHttpRequest();
// 	a.onreadystatechange=function(){
// 		console.log(a.readyState);
// 		if(a.status == 200 && a.readyState == 4){
// 			x = document.getElementById('id').value;
// 			y = document.getElementById('comment').value;
// 			console.log(x);
// 			console.log(y);
		   
// 		}
// 	}
  	 z = './AddComment?id=2&comment=Comment Stub';  
// 	console.log(z);
// 	a.open('GET',z,true);
// 	a.send();
// }
// var el = document.getElementById('submit');
// el.addEventListener('click',sendRequest);
  </script> -->
 
 
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>WeShare|Home </title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
  <%if(session.getAttribute("loggedin")!="yes" || session.getAttribute("email")==null)
	  {
	  response.sendRedirect("./index.jsp");
	  }
  %>
    <div class="container body">
      <div class="main_container">
        

        <!-- top navigation -->
       
        <jsp:include page="navigation.jsp" />
      
        <!-- /top navigation -->
        <div class="row">
        <div class="col-md-2">
        
        </div>
		<div class="col-md-7">
            <ul class="messages">
			  <c:forEach items="${topic}" var="item" >
	             		 <li style="background:white;">
	             		 <c:set var="topicid" scope="session" value="${item.Topicid}"/>
<!--                                 <img src="images/img.jpg" class="avatar" alt="Avatar"> -->
                                <div class="message_date">
                                  <h3 class="date text-info"><c:out value="${item.time}"/></h3>
<!--                                   <p class="month">May</p> -->
                                </div>
                                <div class="message_wrapper">
                                  <h4 class="heading"><c:out value="${item.creatorid}"/></h4>
                                  <blockquote class="message" ><c:out value="${item.description}"/></blockquote>
                                  <br />
                                 </div>
                              </li>  
                      </c:forEach>
                 </ul>
                   <div class="clearfix"></div>
                <ul class="messages">
				  <c:forEach items="${comments}" var="item" >
	             		 <li>
	             		 
<!--                                 <img src="images/img.jpg" class="avatar" alt="Avatar"> -->
                                <div class="message_date">
                                  <h3 class="date text-info"><c:out value="${item.time}"/></h3>
<!--                                   <p class="month">May</p> -->
                                </div>
                              <div class="message_wrapper">
                                  <h4 class="heading"><c:out value="${item.creatorid}"/></h4>
                                  <blockquote class="message" ><c:out value="${item.Description}"/></blockquote>
                              </div>
                        </li>  
                  </c:forEach>
                </ul>
		<form id="demo-form" data-parsley-validate method="post" action="./AddComment">
		 <input type="hidden" name="id" id = "id" value="${topicid}"/>
		  <label for="message">Comment :</label>
		<textarea id="message" required="required" class="form-control" name="comment" data-parsley-trigger="keyup" data-parsley-maxlength="100"  
		                            data-parsley-validation-threshold="10" placeholder="Add your comment(100 characters max) " ></textarea>
		
		                          <br/>
		                          <button class="btn btn-primary" type="submit">Post Comment</button>
		 </form>	        
        </div>
         <div class="col-md-3">
                 <jsp:include page="rightBar.jsp" />
              </div>
        </div>
      
    
      </div>
    </div>

    <!-- compose -->
  

       
    <!-- /compose -->

    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-wysiwyg -->
    <script src="vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="vendors/google-code-prettify/src/prettify.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>

  </body>
</html>
  
  
  
  
  
  