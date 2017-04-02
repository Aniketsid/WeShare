 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>WeShare | HOME </title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
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
            <div class="clearfix"></div>

      

            <br />
 
    <div class="row">
              <div class="col-md-2">       <a class="btn btn-primary center" href="addTopic.jsp">Post a new Topic</a> </div>
           		<div class="col-md-7">
           		
				 <ul class="messages">
				 <jsp:include page="/RecentTopics" />
           		 	<c:forEach items="${recent}" var="item" >
	             		 <li>
<!--                                 <img src="images/img.jpg" class="avatar" alt="Avatar"> -->
                                <div class="message_date">
                                  <h3 class="date text-info"><c:out value="${item.time}"/></h3>
<!--                                   <p class="month">May</p> -->
                                </div>
                                <div class="message_wrapper">
                                  <h4 class="heading"><c:out value="${item.creatorid}"/></h4>
                                  <blockquote class="message" ><c:out value="${item.description}"/></blockquote>
                                  <br />
                                  <p class="url">
                                    <span class="fs1 text-info" aria-hidden="true" data-icon=""></span>
                                    <a href="./ViewTopic?id=${item.Topicid}"><i class="fa fa-paperclip"></i>View or Add comment</a>
                                  </p>
                                </div>
                              </li>  
	                </c:forEach>
                            
				</ul>
				
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
    <!-- Chart.js -->
    <script src="vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- jQuery Sparklines -->
    <script src="vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <!-- Flot -->
    <script src="vendors/Flot/jquery.flot.js"></script>
    <script src="vendors/Flot/jquery.flot.pie.js"></script>
    <script src="vendors/Flot/jquery.flot.time.js"></script>
    <script src="vendors/Flot/jquery.flot.stack.js"></script>
    <script src="vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="vendors/DateJS/build/date.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="vendors/moment/min/moment.min.js"></script>
    <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
  </body>
</html>
























                   
            
            
            
            
 
 