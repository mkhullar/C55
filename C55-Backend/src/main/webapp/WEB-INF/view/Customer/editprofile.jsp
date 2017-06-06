<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="home" uri="http://java.sun.com/jsp/jstl/core"%>

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

<!-- Custom CSS -->
<link href="/C55-Backend/assets/css/simple-sidebar.css" rel="stylesheet">
<!-- jQuery -->
<script src="/C55-Backend/assets/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/C55-Backend/assets/js/bootstrap.min.js"></script>

<script type="text/javascript">

  function getdetails()
          {

            $.ajax({
              type: "POST",
              async: false,
              dataType: "json",
              url: "${home}profile/view",
              contentType: "application/json; charset=utf-8",
              success: function(responsedata,status)
              {
                if(status=="success"){
                  document.getElementById("new_address").value=responsedata.data['address'];
                  document.getElementById("firstname").value=responsedata.data['f_name'];
                  document.getElementById("lastname").value=responsedata.data['l_name']; 
                  
                }
                  
              },
                  error: function(e){
                    console.log(e.message);
                  }
                });

          }

        


          function changefirstname()
          {
            var postdata = 
            {
                    //"cust_id": 9999888877776666
                    "f_name":document.getElementById("firstname").value,
                    "item": "Fname"

                    //"l_name":document.getElementById("lastname").value
                  }
                  var dataString = JSON.stringify(postdata);

                  alert(dataString);
                  $.ajax({
                    type: "POST",
                    async: false,
                    dataType: "json",
                    url: "${home}profile/update",
                    data: dataString,
                    contentType: "application/json; charset=utf-8",
                    success: function(data,status){
                    if(status=="success"){
                    alert("First Name change Success");
                    }
                    },
                       error: function(e){
                        console.log(e.message);
                      }
                    });

                }


            function changelastname()
          {



            var postdata = 
            {
                    "l_name":document.getElementById("lastname").value,
                  "item": "Lname"
                  }

            var dataString = JSON.stringify(postdata);      
	
                  alert(dataString);
                  $.ajax({
                    type: "POST",
                    async: false,
                    dataType: "json",
                    url: "${home}profile/update",
                    data:dataString,
                    contentType: "application/json; charset=utf-8",
                    success: function(data,status){
                    if(status=="success"){
                    	alert("Last Name change Success");
                    	}   
                    },
                       error: function(e){
                        console.log(e.message);
                      }
                    });

                }

             function changepassword()
             {
              var postdata = 
              {
                  //"cust_id": 9999888877776666
                  
                  "password":document.getElementById("new_password").value,
                  "item" :  "Password"

                }
                var dataString = JSON.stringify(postdata);

                alert(dataString);

                $.ajax({
                  type: "POST",
                  async: false,
                  dataType: "json",
                  url: "${home}profile/update",
                  data: dataString,
                  contentType: "application/json; charset=utf-8",
                   success: function(data,status){
                    if(status=="success")
                    { alert("Password change Success");
                    }
                       },
                       error: function(e){
                        console.log(e.message);
                      }
                    });

              }




              function changeaddress()
              {

					

                var postdata = 
                {
                  //"cust_id": 9999888877776666
                  "address":document.getElementById("new_address").value,
                  "item" : "Address" 

                }
                var dataString = JSON.stringify(postdata);

                alert(dataString);

                $.ajax({
                  type: "POST",
                  dataType: "json",
                  async: false,
                  url: "${home}profile/update",
                  data: dataString,
                  contentType: "application/json; charset=utf-8",
                   success: function(data,status){     
                    if(status=="success")
                     {
                    	alert("Address change Success");    
                   	}
                     
                     },
                       error: function(e){
                        console.log(e.message);
                      }
                    });
              }




function checkPasswordMatch() {
    var password = $("#new_password").val();
    var confirmPassword = $("#confirmpassword").val();

    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    else
        $("#divCheckPasswordMatch").html("Passwords match.");
}




		window.onload=getdetails;


            </script>


</head>

<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
    				<li class="sidebar-brand">
						C55 Bank
    				</li>
    				<li>
    					<a href="${home}accounts">Account Information</a>
    				</li>
    				<li>
    					<a href="${home}transfercash">Transfer Cash</a>
    				</li>
    				<li>
    					<a href="${home}balanceinfo">Balance Statement</a>
    				</li>
    				<li>
    					<a href="${home}request">Requests</a>
    				</li>
    				<li>
    					<a href="${home}viewprofile">View Profile</a>
    				</li>
    				<li>
    					<a href="${home}editprofile">Edit Profile</a>
    				</li>
    				<li>
    					<a href="${home}creditcard">Credit Card</a>
    				</li>
    				<li>
    					<a href="${home}logout">Logout</a>
    				</li>

			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
		<!--
saurabh start
-->

		<!-- Page Content -->
		<div class="container-fluid">
			<ul class="nav nav-tabs nav-justified" role="tablist">

				<li><a data-toggle="tab" href="#changefirstName">Change
						First Name</a></li>
				<li><a data-toggle="tab" href="#changelastName">Change Last
						Name</a></li>
				<%--<li><a data-toggle="tab" href="#changePhone">Change Phone Number</a></li>--%>
				<li><a data-toggle="tab" href="#changePassword">Change
						Password</a></li>
				<li><a data-toggle="tab" href="#changeAddress">Change
						Address</a></li>
			</ul>
			<div class="tab-content">

				<!-- ###################################### email tab-->
				<div id="changelastName" class="tab-pane fade ">
					<div class="container">
						<h1>Edit Last Name</h1>
						<hr>
						<div class="row">

							<div class="col-md-12 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i> <strong>Change Last Name
										Status:</strong>
									<div id="c_lname"></div>
								</div>

								<form class="form-horizontal" role="form" method="POST"
									onsubmit="changelastname()">



									<div class="form-group">
										<label class="col-lg-3 control-label">Last Name:</label>
										<div class="col-lg-8">
											<input class="form-control" id="lastname" required>
										</div>
									</div>


									<div class="form-group">
										<label class="col-md-3 control-label"></label>
										<div class="col-md-8">

											<input class="btn btn-primary" value="Save Changes"
												type="submit"> <span></span> <input
												class="btn btn-default" value="Cancel" type="reset">

										</div>
									</div>

								</form>

							</div>
						</div>
					</div>
				</div>
				<!-- ######################################-->



				<!-- ###################################### Phone no tab-->
				<!--  <div id="changePhone" class="tab-pane fade ">
      <div class="container">
        <h1>Edit Phone Number</h1>
        <hr>
        <div class="row">
       
          <div class="col-md-12 personal-info">
            <div class="alert alert-info alert-dismissable">
              <a class="panel-close close" data-dismiss="alert">×</a> 
              <i class="fa fa-coffee"></i><div id="c_phone"></div>
              <strong>Change Phone Status:</strong><div id="c_phone"></div>
            </div>

            <form class="form-horizontal" role="form"  method="POST" onsubmit="changephone()">


              <div class="form-group">
                <label class="col-md-3 control-label">New Phone number:</label>
                <div class="col-md-8">
                  <input class="form-control" id="new_phone" type="text">
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-3 control-label">Mobile Carrier:</label>
                <div class="col-md-8">
                  <div class="radio">
                    <label><input type="radio" name="carrier">ATT</label>
                  </div>
                  <div class="radio">
                    <label><input type="radio" name="carrier">T-Mobile</label>
                  </div>
                </div>

              </div>



              <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-8">

                  <input class="btn btn-primary" value="Save Changes" type="submit">
                  <span></span>
                  <input class="btn btn-default" value="Cancel" type="reset">

                </div>
              </div>

            </form>

          </div>
        </div>
      </div>
    </div>-->
				<!-- ######################################-->

				<!-- ###################################### Password tab-->
				<div id="changePassword" class="tab-pane fade ">
					<div class="container">
						<h1>Edit Password</h1>
						<hr>
						<div class="row">
							<!-- left column -->


							<!-- edit form column -->
							<div class="col-md-12 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i> <strong> Change Password
										Status:</strong>
									<div id="c_password"></div>
								</div>

								<form class="form-horizontal" role="form" method="POST"
									onsubmit="changepassword()">



									<div class="form-group">
										<label class="col-md-3 control-label">New Password:</label>
										<div class="col-md-8">
											<input class="form-control" name="password" id="new_password"
												type="password">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">Confirm
											password:</label>
										<div class="col-md-8">
											<input class="form-control" name="confrim_password"
												id="confirmpassword" onkeyup="checkPasswordMatch()"
												type="password">
										</div>
									</div>
									<div id="divCheckPasswordMatch"></div>




									<div class="form-group">
										<label class="col-md-3 control-label"></label>
										<div class="col-md-8">

											<input class="btn btn-primary" value="Save Changes"
												type="submit"> <span></span> <input
												class="btn btn-default" value="Cancel" type="reset">

										</div>
									</div>

								</form>

							</div>
						</div>
					</div>
				</div>
				<!-- ######################################-->

				<!-- ###################################### Username tab-->
				<div id="changeAddress" class="tab-pane fade ">
					<div class="container">
						<h1>Edit Address</h1>
						<hr>
						<div class="row">
							<!-- left column -->


							<!-- edit form column -->
							<div class="col-md-12 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i> <strong>Change Address
										Status:</strong>
									<div id="c_address"></div>
								</div>

								<form class="form-horizontal" role="form" method="POST"
									onsubmit="changeaddress()">


									<div class="form-group">
										<label class="col-md-3 control-label">New Address:</label>
										<div class="col-md-8">
											<input class="form-control" id="new_address" type="text"
										>
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label"></label>
										<div class="col-md-8">

											<input class="btn btn-primary" value="Save Changes"
												type="submit"> <span></span> <input
												class="btn btn-default" value="Cancel" type="reset">

										</div>
									</div>

								</form>

							</div>
						</div>
					</div>
				</div>
				<!-- ######################################-->


				<!-- ###################################### Nameab-->
				<div id="changefirstName" class="tab-pane fade in active">
					<div class="container">
						<h1>Edit First Name</h1>
						<hr>
						<div class="row">

							<div class="col-md-12 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i> <strong>Change First Name
										Status:</strong>
									<div id="c_fname"></div>
								</div>

								<form class="form-horizontal" role="form" method="POST"
									onsubmit="changefirstname()">

									<div class="form-group">
										<label class="col-lg-3 control-label">First name:</label>
										<div class="col-lg-8">
											<input class="form-control" id="firstname" type="text">
										</div>
									</div>


									<div class="form-group">
										<label class="col-md-3 control-label"></label>
										<div class="col-md-8">

											<input class="btn btn-primary" value="Save Changes"
												type="submit"> <span></span> <input
												class="btn btn-default" value="Cancel" type="reset">

										</div>
									</div>

								</form>

							</div>
						</div>
					</div>
				</div>
				<!-- ######################################-->


			</div>
			<!--end of tabbed content-->
		</div>


		<!--
saurabh end
-->


	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->


	<!-- Menu Toggle Script -->
	<script>
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });
</script>

</body>

</html>
