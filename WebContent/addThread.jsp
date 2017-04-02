<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        
           <jsp:include page="navigation.jsp" />
        <!-- top navigation -->
       
           
          <div class="row">
         <div class="col-md-2"></div>
     <div class="col-md-7">
   <form id="demo-form" class="form-label-left" action="./AddThread" method="post">
 		  <input type="text" id="tname" placeholder="Thread Name" class="form-control" name="tname" required /> 
 		    </br>
  <textarea id="description" required="required" class="form-control" name="description" placeholder="Description of thread"></textarea>
    <div class="clearfix">   </br>
<textarea id="tag" required="required" class="form-control" name="tag" placeholder="Add some tags that are relevant to this thread (comma separated)" placeholder="Description of thread"></textarea>
</br>
 
<center><input type="submit" placeholder="Add Thread" value="Add Thread"  class="btn btn-primary"/></center>
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