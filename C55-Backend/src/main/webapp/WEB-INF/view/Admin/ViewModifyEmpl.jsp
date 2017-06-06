<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:url var="home" value="/" scope="request" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>C55 Bank</title>


<!-- Bootstrap Core CSS -->
    <link href="/C55-Backend/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="/C55-Backend/assets/css/jquery.dataTables.min.css" rel="stylesheet">    

    <!-- Custom CSS -->
    <link href="/C55-Backend/assets/css/simple-sidebar.css" rel="stylesheet">
     <!-- jQuery -->
        <script src="/C55-Backend/assets/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="/C55-Backend/assets/js/bootstrap.min.js"></script>
        <script src="/C55-Backend/assets/js/jquery.dataTables.min.js"></script>


        <script type="text/javascript">
        
        function loadPage()
        {
        	userData=${internalUser};
        	setData(userData);
        }
          function setData(data)
          {
        	 // var data=formData;
        	  document.getElementById("e_id").innerHTML= data["e_id"];
              document.getElementById("firstname").value= data["f_name"];
             document.getElementById("lastname").value= data["l_name"];
             document.getElementById("password").value=data["password"];
            var role= data["access_level"];
            var $radios = $('input:radio[name=role]');
            if($radios.is(':checked') === false) {
                $radios.filter('[value=manager]').prop('checked', true);
             
             }
        	  
          }
         
function editprofile()
            {

                //alert(document.getElementById("fromself").value + " " + document.getElementById("toself").value + " " + document.getElementById("transferamount").value);
                //alert(data[][document.getElementById("fromself").value])
                //if(document.getElementById("transferamount").value > )

                var postdata = 
                {
                	"e_id"	: document.getElementById("e_id").innerHTML,
                    "f_name":document.getElementById("firstname").value,
                    "l_name":document.getElementById("lastname").value,
                    "password":document.getElementById("password").value,
                    "access_level":$('input:radio[name=role]:checked').val() 
                   
                }
        
                var dataString = JSON.stringify(postdata);
                alert(dataString);
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "${home}employee/update",
                    data: dataString,
                    contentType: "application/json; charset=utf-8",
                    success: function(data){
                        alert('transacion successfull');
                    },
                    error: function(e){
                        console.log(e.message);
                    }
                });

            }

          window.onload=loadPage;

        </script>


      </head>

      <body>

        <div id="wrapper">

       <!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"></li>


				<li><a href="${home}Admin/RoleAddition">Add New Employees</a></li>
				<li><a href="${home}Admin/ViewAllEmployees">View All
						Employees</a></li>
				<li><a href="${home}Admin/AccessLog">Access Logs</a></li>
				<li><a href="${home}Admin/logout">Logout</a></li>
			</ul>

		</div>
            
            <!-- Page Content -->
            <div class="container-fluid">
                <ul class="nav nav-tabs nav-justified" role="tablist">
					<li><a data-toggle="tab" href="#employee">View Employee</a></li>
					
                    
                   
                </ul>
                
                    
                    
                <!-- ###################################### Nameab-->
                    <div id="changeName" class="tab-pane fade in active">
                        <div class="container">
                          <h1>Edit Details</h1>
                          <hr>
                          <div class="row">
                            <!-- left column -->


                            <!-- edit form column -->
                            <div class="col-md-12 personal-info">
                              <div class="alert alert-info alert-dismissable">
                                <a class="panel-close close" data-dismiss="alert">×</a> 
                                <i class="fa fa-coffee"></i>
                                This is an <strong>.alert</strong>. Use this to show important messages to the user.
                              </div>

                              <form class="form-horizontal" role="form" action="" method="POST">
                                
                                 <div class="form-group">
                                  <label class="col-lg-3 control-label">Employee ID:</label>
                                  <div class="col-lg-8">
                                    <label class="col-lg-3 control-label" id="e_id"> </label>
                                  </div>
                                </div>
                                
                                <div class="form-group">
                                  <label class="col-lg-3 control-label">First name:</label>
                                  <div class="col-lg-8">
                                    <input class="form-control" id="firstname" type="text">
                                  </div>
                                </div>

                                <div class="form-group">
                                  <label class="col-lg-3 control-label">Last name:</label>
                                  <div class="col-lg-8">
                                    <input class="form-control" id="lastname"  type="text">
                                  </div>
                                </div>
                                
                                <div class="form-group">
                                  <label class="col-lg-3 control-label">Password</label>
                                  <div class="col-lg-8">
                                    <input class="form-control" id="password"  type="password">
                                  </div>
                                </div>
                                
                                
                                <div class="form-group">
                                <label class="col-lg-3 control-label">Role</label>
				<div class="radio-inline">
					<label><input type="radio" name="role" value="regular">Regular Employee.</label>
				</div>
				
				<div class="radio-inline">
					<label><input type="radio" name="role" value="manager">Manager</label>
				</div>
				
				
				</div>


                            <div class="form-group">
                              <label class="col-md-3 control-label"></label>
                              <div class="col-md-8">

                                <input class="btn btn-primary" value="Update Changes" onclick="editprofile()" type="button">
                                <span></span>
                                
                                <input class="btn btn-default" value="Cancel" onclick="loadPage()" type="button">

                                    </div>
                                </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
<!-- ######################################-->    
                

    </div><!--end of tabbed content-->
</div>
            
            
 


        </div>
        <!-- /#wrapper -->

        <!-- Menu Toggle Script -->
        <script>
          $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
          });
        </script>

      </body>

      </html>
