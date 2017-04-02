<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
 
 
 <html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | </title>

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
     <div class="col-md-2"></div>
     <div class="col-md-7">
   <form id="demo-form"  class="form-label-left" action="./AddTopic" method="post">
           <label>Choose A Thread :</label>
                          <select  name="thread" id="thread" class="form-control"  required>
                            <option value="">Choose..</option>
                            <jsp:include page="/Threads" />
							 <c:forEach items="${message}" var="item">
							 <option value="${item.Threadid}">${item.Threadname}</option>
							  </c:forEach>
                          </select>
			<label> <a href="addThread.jsp">Add a new thread</a></label>	 </br>
              <label>Topic :</label>
             <textarea id="message" required class="form-control" name="description" placeholder="please enter the topic here"  
                             ></textarea>

              <br/>
              <input type="submit" class="btn btn-primary" value="Post topic"/>
     </form>      
</div>
 <div class="col-md-3">
                 <jsp:include page="rightBar.jsp" />
              </div>
</div>

 </div>
 </div>
 
 
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
 
 
 