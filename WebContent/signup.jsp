<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
     <link href="vendors/dropzone/dist/min/dropzone.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet"> 
    
     <script>
		    function matchPassword()
		    {
		    	
			    if (document.getElementById('password1').value==document.getElementById('password2').value)
			    {
			    	//alert("matched");
			         document.getElementById('submit').disabled = false;
			         document.getElementById('Warning').innerHTML="Password matched";
			    }
			    else 
			    {
			         document.getElementById('submit').disabled = true;
			         //alert("not matched");
			         document.getElementById('Warning').innerHTML="Password did not match";
			    }
			}
		    
	</script>
	
	<script>
		  //my js function to save image...
	        function onFileSelect(file){
	        //var image =  document.getElementById('uploadPic').files;
	        image = file;
            if (image.type !== 'image/png' && image.type !== 'image/jpeg') {
	            alert('Only PNG and JPEG are accepted.');
	            return;
	        }
            document.write("else block of js function");
	        $scope.uploadInProgress = true;
	        $scope.uploadProgress = 0;

	        var reader = new window.FileReader();
	        reader.readAsDataURL(image);
	        reader.onloadend = function() {
	            base64data = reader.result;

	            $scope.profile.profilePic = base64data;

	            ProfileService.updateProfile($scope.profile).then(function(response){
	                $rootScope.profile = response;
	                $scope.profilePicture = $rootScope.profile.profilePic;

	            });

	        }

	    }

	// when reading from the server just put the profile.profilePic value to src
	src="data:image/png;base64,{base64 string}"
    
	// profile schema
	var ProfileSchema = new mongoose.Schema({
	    userid:String,
	    //profilePic:{ name: String, img: Buffer, contentType: String },
	    profilePic:String
	}
    </script>
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
           
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
           
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
         
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/img.jpg" alt="">John Doe 
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            
            <div class="clearfix"></div>

            <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                   
                  <div class="x_content">


                    <!-- Smart Wizard -->
                    <p>User Registration/Signup Form</p>
                    <div id="wizard" class="form_wizard wizard_horizontal">
                      <ul class="wizard_steps">
                        <li>
                          <a href="#step-1">
                            <span class="step_no">1</span>
                            <span class="step_descr">
                                              Step 1<br />
                                              <small>Basic Information</small>
                                          </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-2">
                            <span class="step_no">2</span>
                            <span class="step_descr">
                                              Step 2<br />
                                              <small>Step 2 description</small>
                                          </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-3">
                            <span class="step_no">3</span>
                            <span class="step_descr">
                                              Step 3<br />
                                              <small>Step 3 description</small>
                                          </span>
                          </a>
                        </li>
                      </ul>
                      <div id="step-1">
                        <form class="form-horizontal form-label-left" action="./servlet/Save" method="post">

                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">First Name <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input name="fname" type="text" id="firstname" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Last Name <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input name="lname" type="text" id="lastname" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="Nitc Email">Email <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input name="email" type="email" id="email"  pattern="[a-z0-9._%+-]+@nitc+\.ac+\.in$" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>
                          <div class="form-group">
		                         <label class="control-label col-md-3 col-sm-3 col-xs-12" for="heard">Designation *:</label>
		                         <div class="col-md-6 col-sm-6 col-xs-12">
		                          <select name="designation" id="designation" class="form-control" required>
		                            <option value="">Choose..</option>
		                            <option value="staff">Staff</option>
		                            <option value="student">Student</option>
		                            <option value="faculty">Faculty</option>
		                          </select>
                            </div>
                            
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Gender</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <div id="gender" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="gender" value="male"> &nbsp; Male &nbsp;
                                </label>
                                <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="gender" value="female"> Female
                                </label>
                              </div>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Date Of Birth <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input name="dob" id="birthday" class="date-picker form-control col-md-7 col-xs-12" required="required" type="date">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Password <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input name="password1" id="password1" class="date-picker form-control col-md-7 col-xs-12" required="required" type="password">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Confirm Password <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input name="password2" id="password2" class="date-picker form-control col-md-7 col-xs-12" onchange='matchPassword();' required="required" type="password">
                              <label id="Warning"></label>                            
                            </div>
                          </div>
                          
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Profile Picture <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                               <input name="pic" type="file" name="image"/>  
    <!--  <input type="file" ngf-select="onFileSelect($file)" ng-model="file" name="file" ngf-pattern="'image/*'" 
     ngf-accept="'image/*'" ngf-max-size="15MB" class="btn btn-danger"  />  -->
    
                            </div>
                          </div>
                           <div class="form-group">
		                         <label class="control-label col-md-3 col-sm-3 col-xs-12" for="heard">Threads *:</label>
		                         <div class="col-md-6 col-sm-6 col-xs-12">

			                      <select name="interest" id="interest" class="form-control" multiple required>
		                          <option value="">Choose Interested Threads..</option>
		                          <jsp:include page="/Threads" />
		                          <c:forEach items="${message}" var="item">
							         <option value="${item.Threadid}">${item.Threadname}</option>
							      </c:forEach>
                                  </select>
                                
                                </div>
                            
                            <input type="submit" name="Done" id="submit" disabled/> 
                        </form>
                      </div>
                      
                      <div id="step-3">
                        <h2 class="StepTitle">Step 3 Content</h2>
                        <p>
                           Congratulations !!! AApne Bhut Bda Teer Maar Liya hai..Asa SHarma ji bole...
                        </p>
                       
                      </div>
                      

                    </div>
                 
                    <!-- End SmartWizard Content -->


 
                    <!-- End SmartWizard Content -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
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
    <!-- jQuery Smart Wizard -->
     <script src="vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script> 
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
  <script src="vendors/dropzone/dist/min/dropzone.min.js"></script>

	
  </body>
</html>