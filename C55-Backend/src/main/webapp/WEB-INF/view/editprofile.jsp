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
				<li><a href="<c:url value="/customer/transfercash"/>">Transfer
						Cash</a></li>
				<li><a href="<c:url value="/customer/balanceinfo"/>">Balance
						Statement</a></li>
				<li><a href="<c:url value="/customer/notification"/>">Notification</a></li>
				<li><a href="<c:url value="/customer/editprofile"/>">Edit
						Profile</a></li>
				<li><a href="<c:url value="/customer/creditcard"/>">Credit
						Card</a></li>
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

				<li><a data-toggle="tab" href="#changeName">Change Name</a></li>
				<li><a data-toggle="tab" href="#changeEmail">Change Email
						id</a></li>
				<li><a data-toggle="tab" href="#changePhone">Change Phone
						Number</a></li>
				<li><a data-toggle="tab" href="#changePassword">Change
						Password</a></li>
				<li><a data-toggle="tab" href="#changeUserName">Change
						UserName</a></li>
			</ul>
			<div class="tab-content">

				<!-- ###################################### email tab-->
				<div id="changeEmail" class="tab-pane fade ">
					<div class="container">
						<h1>Edit Email ID</h1>
						<hr>
						<div class="row">
							<!-- left column -->


							<!-- edit form column -->
							<div class="col-md-12 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i> <strong>Change Email
										Status:</strong>
									<div id="c_email"></div>
								</div>


								<form:form class="form-horizontal" role="form" method="post"
									modelAttribute="edit_email" action="/edit">


									<div class="form-group">
										<label class="col-lg-3 control-label">New Email:</label>
										<div class="col-lg-8">
											<input class="form-control" id="new_email" required>
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


								</form:form>

							</div>
						</div>
					</div>
				</div>
				<!-- ######################################-->



				<!-- ###################################### Phone no tab-->
				<div id="changePhone" class="tab-pane fade ">
					<div class="container">
						<h1>Edit Phone Number</h1>
						<hr>
						<div class="row">
							<!-- left column -->


							<!-- edit form column -->
							<div class="col-md-12 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i>
									<div id="c_phone"></div>
									<strong>Change Phone Status:</strong>
									<div id="c_phone"></div>
								</div>

								<form:form class="form-horizontal" role="form" method="post"
									modelAttribute="edit_phone" action="/edit">

									<div class="form-group">
										<label class="col-md-3 control-label">New Phone
											number:</label>
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

											<input class="btn btn-primary" value="Save Changes"
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



								<form:form class="form-horizontal" role="form" method="post"
									modelAttribute="edit_password" action="/edit">

									<div class="form-group">
										<label class="col-md-3 control-label">Old Password:</label>
										<div class="col-md-8">
											<input class="form-control" id="old_password" type="password">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">New Password:</label>
										<div class="col-md-8">
											<input class="form-control" id="new_password" type="password">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">Confirm
											password:</label>
										<div class="col-md-8">
											<input class="form-control" type="password">
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


								</form:form>

							</div>
						</div>
					</div>
				</div>
				<!-- ######################################-->

				<!-- ###################################### Username tab-->
				<div id="changeUserName" class="tab-pane fade ">
					<div class="container">
						<h1>Edit UserName</h1>
						<hr>
						<div class="row">
							<!-- left column -->


							<!-- edit form column -->
							<div class="col-md-12 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i> <strong>Change Username
										Status:</strong>
									<div id="c_username"></div>
								</div>


								<form:form class="form-horizontal" role="form" method="post"
									modelAttribute="edit_username" action="/edit">

									<div class="form-group">
										<label class="col-md-3 control-label">New Username:</label>
										<div class="col-md-8">
											<input class="form-control" id="new_username" type="text"
												pattern="[A-Za-z]{3}">
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


								</form:form>

							</div>
						</div>
					</div>
				</div>
				<!-- ######################################-->


				<!-- ###################################### Nameab-->
				<div id="changeName" class="tab-pane fade in active">
					<div class="container">
						<h1>Edit Name</h1>
						<hr>
						<div class="row">
							<!-- left column -->


							<!-- edit form column -->
							<div class="col-md-12 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i> <strong>Change Name Status:</strong>
									<div id="c_name"></div>
								</div>


								<form:form class="form-horizontal" role="form" method="post"
									modelAttribute="edit_name" action="/edit">

									<div class="form-group">
										<label class="col-lg-3 control-label">First name:</label>
										<div class="col-lg-8">
											<input class="form-control" id="firstname" type="text">
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-3 control-label">Last name:</label>
										<div class="col-lg-8">
											<input class="form-control" id="lastname" type="text">
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


								</form:form>

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
