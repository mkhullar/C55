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

		<!-- Page Content -->
		<div id="banner">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-5  toppad  pull-right col-md-offset-3 ">

						<!--<a href="#" >Logout</a>-->
						<br>
						<!--<p class=" text-info">May 05,2014,03:00 pm </p>-->
					</div>
					<class ="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xs-offset-0
						col-sm-offset-0 col-md-offset-3col-lg-offset-0toppad">
				</div>
				<div class="panel-body">
					<div class="row">
						<h2>Notifications</h2>
						<table id="demoTable">
							<tr>
								<td>Description</td>
								<td>To</td>
								<td>Amount</td>
								<td>Accept/Decline</td>
							</tr>
							<script>
								window.onload = readfile()
								function readfile() {
									var rawFile = new XMLHttpRequest();
									rawFile.open("GET", "data.json", true);
									rawFile.onreadystatechange = function() {
										alert("hejfef");
										if (rawFile.readyState === 4) {
											alert("hejfef");
											if (rawFile.status === 200
													|| rawFile.status == 0) {
												alert("hejfef");
												var allText = rawFile.responseText;
												var data2 = JSON.parse(allText);
												//var select = document.getElementById("myaccounts");
												var tr;
												for (var i = 0; i < data.length; i++) {
													console.log('enter');
													tr = $('<tr/>');
													tr
															.append("<td>"
																	+ data[i].description
																	+ "</td>");
													tr.append("<td>"
															+ data[i].from
															+ "</td>");
													tr.append("<td>"
															+ data[i].amount
															+ "</td>");
													tr.append("<td>"
															+ data[i].amount
															+ "</td>");
													$('table').append(tr);
												}
											}
										}
									}
								}
							</script>
						</table>
						<!--<div class=" col-md-12 col-lg-12 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Account Number :</td>
                        <td>Number from database</td>
                      </tr>
                      <tr>
                        <td>Current balance</td>
                        <td>Balance from database</td>
                      </tr>
                      <tr>
                        <td>Date of Birth</td>
                        <td>From DB</td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>Gender</td>
                        <td>From DB</td>
                      </tr>
                        <tr>
                        <td>Home Address</td>
                        <td>From Db</td>
                      </tr>
                      <tr>
                        <td>Email</td>
                        <td><a href="mailto:info@support.com">From Db@gmail.com</a></td>
                      </tr>
                        <td>Phone Number</td>
                        <td>123-4567-890(Landline - From DB)<br><br>555-4567-890(From DB)
                        </td>
                           
                      </tr>
                     
                    </tbody>
                  </table>
                  
                </div>-->
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>
	<!-- /#page-content-wrapper -->

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
