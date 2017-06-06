<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>C55 Bank</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/simple-sidebar.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<script type="text/javascript">

         function getcreditdetails()
         {
        var postdata = 
                {
                    "cc_id": 123123123123
                    "account_number": 123123123123
                }
                var dataString = JSON.stringify(postdata);

                alert(dataString);
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "credit",
                    data: {myData:dataString},
                    contentType: "application/json; charset=utf-8",
                    success: function(data, textStatus, xhr){
                            if(xhr.status==200){

                          document.getElementById("mp_cc_value").innerHTML=data['amount'];
                          document.getElementById("mp_cc_number").innerHTML=data['cc_number'];
                          document.getElementById("cc_purchase").innerHTML=data['cc_number'];
                        }

                         //variables needs to be checked from the backend
                    },
                    error: function(jqXHR, exception){
                       error: function(jqXHR, exception) {
                             var msg = '';
                        if (jqXHR.status === 0) {
                            msg = 'Not connect.\n Verify Network.';
                        } else if (jqXHR.status == 404) {
                            msg = 'Requested page not found. [404]';
                        } else if (jqXHR.status == 500) {
                            msg = 'Internal Server Error [500].';
                        } else if (exception === 'parsererror') {
                            msg = 'Requested JSON parse failed.';
                        } else if (exception === 'timeout') {
                            msg = 'Time out error.';
                        } else if (exception === 'abort') {
                            msg = 'Ajax request aborted.';
                        } else {
                            msg = 'Uncaught Error.\n' + jqXHR.responseText;
                        }

                        alert(msg);

                        }

                    }
                });

            }

         
function makepayment()
            {

                

                var postdata = 
                {
                    "cc_id": 123123123123
                    "credit_number":document.getElementById("creditcardno").value,
                    "credit_value":document.getElementById("credit_amount").value
                }
                var dataString = JSON.stringify(postdata);

                //alert(dataString);
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "credit",
                    data: {myData:dataString},
                    contentType: "application/json; charset=utf-8",
                    success: function(data, textStatus, xhr){
                             
                         //console.log(data);
                         document.getElementById("mp_cc_value").innerHTML=data['amount'];
                         //variables needs to be checked from the backend
                    },
                    error: function(jqXHR, exception){
                       error: function(jqXHR, exception) {
                             var msg = '';
                        if (jqXHR.status === 0) {
                            msg = 'Not connect.\n Verify Network.';
                        } else if (jqXHR.status == 404) {
                            msg = 'Requested page not found. [404]';
                        } else if (jqXHR.status == 500) {
                            msg = 'Internal Server Error [500].';
                        } else if (exception === 'parsererror') {
                            msg = 'Requested JSON parse failed.';
                        } else if (exception === 'timeout') {
                            msg = 'Time out error.';
                        } else if (exception === 'abort') {
                            msg = 'Ajax request aborted.';
                        } else {
                            msg = 'Uncaught Error.\n' + jqXHR.responseText;
                        }

                        alert(msg);

                        }

                    }
                });

            }

          window.onload=getcreditdetails;

        </script>


</head>

<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"></li>
				<li><a href="<c:url value="/customer/accounts"/>">Account
						Information</a></li>
				<li><a href="<c:url value="/customer/transfercash"/>">Transfer Cash</a>
				</li>
				<li><a href="<c:url value="/customer/balanceinfo"/>">Balance
						Statement</a></li>
				<li><a href="<c:url value="/customer/notification"/>">Notification</a></li>
				<li><a href="<c:url value="/customer/editprofile"/>">Edit Profile</a></li>
				<li><a href="<c:url value="/customer/creditcard"/>">Credit Card</a></li>
				<li><a href="<c:url value="/customer/logout"/>">Logout</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
		<!--
saurabh start
-->

		<!-- Page Content -->
		<div class="container-fluid">
			<ul class="nav nav-tabs nav-justified" role="tablist">

				<li><a data-toggle="tab" href="#makepayment">Make Payment</a></li>
				<li><a data-toggle="tab" href="#downloadstatement">Download
						Statement</a></li>
				<li><a data-toggle="tab" href="#makepurchase">Make Purchase</a></li>
				<!--<li><a data-toggle="tab" href="#changeUserName">Request Purchase</a></li>-->
				<li><a data-toggle="tab" href="#updatecclimit">Update
						Credit Limit</a></li>
			</ul>
			<div class="tab-content">


				<!-- ###################################### Phone no tab-->
				<div id="downloadstatement" class="tab-pane fade ">
					<div class="container">
						<h1>Credit Card Statements</h1>
						<hr>
						<div class="row">
							<!-- left column -->


							<!-- edit form column -->
							<div class="col-md-12 personal-info">

								<div id="f1">
									<table class="table table-striped">
										<thead class="thead-inverse">
											<tr>
												<th>#</th>
												<th>Date</th>
												<th>Credit Card Number</th>
												<th>Credit Value</th>
												<th>Credit Balance</th>
											</tr>

											<!-- THE JSON STRING HAS TO BE OF THE FORM OF THE TABLE HEADING MENTIONED ABOVE SO THAT IT CAN BE EASILY DISPLAYED IN THE UI  -->
										</thead>
										<tbody>

										</tbody>
									</table>
								</div>

								<div>
									<button type="submit">Download</button>
								</div>



							</div>
						</div>
					</div>
				</div>
				<!-- ######################################-->

				<!-- ###################################### Password tab-->
				<div id="makepurchase" class="tab-pane fade ">
					<div class="container">
						<h1>Make Purchase</h1>
						<hr>
						<div class="row">
							<!-- left column -->


							<!-- edit form column -->
							<div class="col-md-12 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i> <strong id="cc_purchase"></strong>
								</div>


								<form:form class="form-horizontal" role="form" method="post"
									modelAttribute="change_password" action="/credit">

									<div class="form-group">
										<label class="col-md-3 control-label">Merchant Name:</label>
										<div class="col-md-8">
											<input class="form-control" value="Amazon">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">Amount:</label>
										<div class="col-md-8">
											<input class="form-control" id="new_password" type="number">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">CVV:</label>
										<div class="col-md-8">
											<input class="form-control" type="password">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label"></label>
										<div class="col-md-8">

											<input class="btn btn-primary" value="Make Purchase"
												type="submit"> <span></span> <input
												class="btn btn-default" value="Cancel" type="reset">

										</div>
									</div>

								</form:form>

							</div>
						</div>
					</div>
				</div>
				<!-- ######################################-->

				<!-- ###################################### Username tab-->
				<div id="updatecclimit" class="tab-pane fade ">
					<div class="container">
						<h1>Update Credit Card limit</h1>
						<hr>
						<div class="row">
							<!-- left column -->


							<!-- edit form column -->
							<div class="col-md-12 personal-info">



								<form:form class="form-horizontal" role="form" method="post"
									modelAttribute="update_cclimit" action="/credit">


									<div class="form-group">
										<label class="col-md-3 control-label">New Credit Card
											Limit:</label>
										<div class="col-md-8">
											<input class="form-control" id="new_username" type="number">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label"></label>
										<div class="col-md-8">

											<input class="btn btn-primary" value="Update" type="submit">
											<span></span> <input class="btn btn-default" value="Cancel"
												type="reset">

										</div>
									</div>

								</form:form>

							</div>
						</div>
					</div>
				</div>
				<!-- ######################################-->


				<!-- ###################################### Nameab-->
				<div id="makepayment" class="tab-pane fade in active">
					<div class="container">
						<h1>Make Payment</h1>
						<hr>
						<div class="row">
							<!-- left column -->


							<!-- edit form column -->
							<div class="col-md-12 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i> <strong id="mp_cc_number"></strong>
									<div id="mp_cc_value"></div>
								</div>


								<form:form class="form-horizontal" role="form" method="post"
									modelAttribute="make_payment" action="/credit">


									<div class="form-group">
										<label class="col-lg-3 control-label">Amount:</label>
										<div class="col-lg-8">
											<input class="form-control" id="credit_amount" type="number">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label"></label>
										<div class="col-md-8">

											<input class="btn btn-primary" value="Pay" type="submit">
											<span></span> <input class="btn btn-default" value="Cancel"
												type="reset">

										</div>
									</div>

								</form:form>

							</div>
						</div>
					</div>
				</div>
				<!-- ######################################-->


			</div>
			<!--end of tabbed content-->
		</div>




	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
          $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
          });
        </script>

</body>

</html>
