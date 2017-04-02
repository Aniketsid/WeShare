 <jsp:include page="/People" />
 <jsp:include page="/Threads" />
 <jsp:include page="/Follows" />
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
 <% 
 String fname="dummy fname",lname="dummy lname",email="dummy",designation="dummy",gender="dummy",dob="dummy",tname="dummy";
 String description="dummy",time="dummy";
 %>
    
     
<c:forEach items="${interests}" var="item1">
	 <c:set var="threadname"  value="${item1.Threadname}" />
	 <c:set var="des"  value="${item1.description}" />
</c:forEach>
    
<c:forEach items="${message2}" var="item">
	 <c:set var="fname"  value="${item.FirstName}" />
	 <c:set var="lname"  value="${item.LastName}" />
	 <c:set var="email"  value="${item.EmailId}" />
	 <c:set var="designation"  value="${item.Designation}" />
	 <c:set var="gender"  value="${item.Gender}" />
	 <c:set var="dob"  value="${item.DOB}" />
<%-- 	<c:out value="${fname}" /> --%>
</c:forEach>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Profile </title>

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
       

        <!-- top navigation -->
          <jsp:include page="navigation.jsp" />
        <!-- /top navigation -->

        <!-- page content -->
        <div class="" role="main">
          <div class="">
          
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>User Profile <small>Activity report</small></h2>
                     
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                      <div class="profile_img">
                        <div id="crop-avatar">
                          <!-- Current avatar -->
                          <img class="img-responsive avatar-view" src="images/picture.jpg" alt="Avatar" title="Change the avatar">
                        </div>
                      </div>
                      <h3> <span style="color:red">  <c:out value="${fname}" />  </span> </h3>

                      <ul class="list-unstyled user_data">
                        
                        <li>
                          <i class="fa fa-briefcase user-profile-icon"></i>  <c:out value="${designation}" />  
                        </li>

                        <li class="m-top-xs">
                          <i class="fa fa-external-link user-profile-icon"></i>
                          <a href="http://www.kimlabs.com/profile/" target="_blank"> <c:out value="${email}" /> </a>
                        </li>
                      </ul>

                      <a class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>Edit Profile</a>
                      <br />

                      <!-- start skills -->
                      <h4>Recent Activity</h4>
                      <ul class="list-unstyled user_data">  
                       <h5><span style="color:blue">Recently Followed Threads</span></h5>
			<c:forEach items="${thread}" var="item1">
				 <c:set var="threadname"  value="${item1.Threadname}" />
				 <c:set var="des"  value="${item1.description}" />
			           <li>
                          <h7 class="heading"><span style="color:blue"> <c:out value="${threadname}" /> </span></h7>
                            <p><c:out value="${des}" />  </p>
                       </li>
            </c:forEach>
	            <h5><span style="color:blue">Recently Followed People</span></h5>
	            <c:forEach items="${people}" var="item2">
					 <c:set var="firstname"  value="${item2.FirstName}" />
					 <c:set var="lastname"  value="${item2.LastName}" />
					 <c:set var="mail"  value="${item2.EmailId}" />
					     <li>
                          <h7 class="heading"><span style="color:green"> <c:out value="${firstname}" />  <c:out value="${lastname}" /></span></h7>
                            <p><c:out value="${mail}" />  </p>
                       </li>
               </c:forEach>
               
                   <h5><span style="color:blue">Recently Followed Topics</span></h5>
	            <c:forEach items="${topic}" var="item3">
					 <c:set var="ques"  value="${item3.description}" />
					     <li>
                          <h7 class="heading"><span style="color:blue"> <c:out value="${ques}" /></span></h7>
                           
                       </li>
               </c:forEach>
               
                     </ul> 
                      
                       <!-- end of skills -->

                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12">

                      <div class="profile_title">
                        <div class="col-md-6">
                          <h2>User Activity Report</h2>
                        </div>
                        <div class="col-md-6">
                          
                        </div>
                      </div>
                      <!-- start of user-activity-graph -->
                
                      <!-- end of user-activity-graph -->

                      <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Thread Followed</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Added Thread </a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Added Topic</a>
                          </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                            <!-- start recent activity -->
<!--                             <ul class="messages"> -->
                              <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                 
                                  <th>Thread Name</th>
                                  <th>Description</th>
                                </tr>
                              </thead>
                              <tbody>
                            
                     <c:forEach items="${interests}" var="item1">
				   <c:set var="threadname"  value="${item1.Threadname}" />
				 <c:set var="des"  value="${item1.description}" />
<!--                               <li> -->
<!--                                 <div class="message_wrapper"> -->
<%--                                   <h4 class="heading"><span style="color:blue"> <c:out value="${threadname}" /> </span></h4> --%>
<%--                                   <blockquote class="message"><c:out value="${des}" /> </blockquote> --%>
<!--                                   <br /> -->
                                  
<!--                                 </div> -->
<!--                               </li> -->
                              <tr> 
                                  <td>   <c:out value="${threadname}" />  </td>
                                  <td> <c:out value="${des}" /></td>
<%--                                   <td class="hidden-phone"><c:out value="${time}" /></td> --%>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-success" data-transitiongoal="35"></div>
                                    </div>
                                  </td>
                                </tr>

                         </c:forEach>
                          </tbody>  
                            </table>
                             
<!--                              </ul> -->
                            <!-- end followed thread/interests activity -->

                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                            <!-- start user projects -->
                            <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                   
                                  <th>Thread Name</th>
                                  <th>Description</th>
                                  <th class="hidden-phone">Creation Time</th>
                                  <th>Tags</th>
                                </tr>
                              </thead>
                              <tbody>
                               
                      <c:forEach items="${threads}" var="thread">
								 <c:set var="tname"  value="${thread.Threadname}" />
								 <c:set var="description"  value="${thread.description}" />
								 <c:set var="time"  value="${thread.time}" />
								  						 
                                <tr>
                                   
                                  <td> <c:out value="${tname}" /></td>
                                  <td> <c:out value="${description}" /></td>
                                  <td class="hidden-phone"><c:out value="${time}" /></td>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-success" data-transitiongoal="35"></div>
                                    </div>
                                  </td>
                                </tr>
                   </c:forEach>
                                
                  </tbody>  
                            </table>
                            <!-- end user projects  -->

                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                       <!-- start user projects tab3 -->
                            <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  
                                  <th>Topic Description</th>
                                  <th class="hidden-phone">Thread Name</th>
                                  <th>Tags</th>
                                </tr>
                              </thead>
                              <tbody>
   								 
							<c:forEach var="element" items="${topic1}" varStatus="status">
								 
                                <tr>
                                 
                                  <td>  <c:out value="${element.description}" /></td>
                                  <td class="hidden-phone"> <c:out value="${topic2[status.index].Threadname}" /></td>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-success" data-transitiongoal="35"></div>
                                    </div>
                                  </td>
                                </tr>
                        </c:forEach>
                                
                             </tbody>  
                            </table>
                            <!-- end user projects ..tab3-->
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
       
        <!-- /footer content -->
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
    <!-- morris.js -->
    <script src="vendors/raphael/raphael.min.js"></script>
    <script src="vendors/morris.js/morris.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="vendors/moment/min/moment.min.js"></script>
    <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>

  </body>
</html>