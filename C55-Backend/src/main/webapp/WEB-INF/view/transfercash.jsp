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
<!--[if lt IE 9]>-
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
<script type="text/javascript">

        	function readfile(file)
        	{
        		var rawFile = new XMLHttpRequest();
        		rawFile.open("GET", "empdetails.json", true);
        		rawFile.onreadystatechange = function ()
        		{
        			if(rawFile.readyState === 4)
        			{
        				if(rawFile.status === 200 || rawFile.status == 0)
        				{
        					var allText = rawFile.responseText;
        					var data  =  JSON.parse(allText);
                //var select = document.getElementById("myaccounts");
                for (var i =0 ; i< Object.keys(data["Savingsaccount"]).length ; i++)
                	{ var option = document.createElement("option");
                option.text = data["Savingsaccount"][i]["Accountnumber"];
                option.value = data["Savingsaccount"][i]["Accountnumber"];
                var select1 = document.getElementById("toself");
                select1.appendChild(option);

            }
            for (var i =0 ; i< Object.keys(data["Checkingaccount"]).length ; i++)
            	{ var option = document.createElement("option");
            option.text = data["Checkingaccount"][i]["Accountnumber"];
            option.value = data["Checkingaccount"][i]["Accountnumber"];
            var select1 = document.getElementById("toself");
            select1.appendChild(option);                    
        }


        for (var i =0 ; i< Object.keys(data["Savingsaccount"]).length ; i++)
        	{ var option = document.createElement("option");
        option.text = data["Savingsaccount"][i]["Accountnumber"];
        option.value = data["Savingsaccount"][i]["Accountnumber"];
        var select2 = document.getElementById("fromself");
        select2.appendChild(option);

    }
    for (var i =0 ; i< Object.keys(data["Checkingaccount"]).length ; i++)
    	{ var option = document.createElement("option");
    option.text = data["Checkingaccount"][i]["Accountnumber"];
    option.value = data["Checkingaccount"][i]["Accountnumber"];
    var select2= document.getElementById("fromself");
    select2.appendChild(option);

}

}
}

}
rawFile.send(null);
}
window.onload=readfile;

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

		<!-- Page Content -->
		<div class="container-fluid">
			<ul class="nav nav-tabs nav-justified" role="tablist">

				<li><a data-toggle="tab" href="#self">Between your accounts</a></li>
				<li><a data-toggle="tab" href="#other">To others accounts</a></li>
			</ul>
			<div class="tab-content">
				<div id="other" class="tab-pane fade ">

					<div class="alert alert-info alert-dismissable">
						<a class="panel-close close" data-dismiss="alert">×</a> <i
							class="fa fa-coffee"></i> <strong>Transaction Status</strong>
						<div id="st_status"></div>
					</div>


					<h2>Transfer your money to someone else account</h2>


					<form:form class="form-horizontal" role="form" method="post"
						modelAttribute="other_account" action="/transfer">



						<div class="form-group">
							<div class="col-sm-4">
								<label>Recipient Full name</label><input class="form-control"
									type="text" id="fullname" required>
							</div>
							<div class="col-sm-4">
								<label for="self">Email/Phone Number</label>
								<script>
									function chooseOption(){
										element_selected = document.getElementById("fromaccount").options[document.getElementById("fromaccount").selectedIndex].text;
										if(element_selected === 'Email') {
											parent = document.getElementById("fromaccount").parentNode;
											parent.innerHTML = "<label>Email</label><input class=\"form-control\"  type=\"email\" id=\"email\" required>";
											parent.nextElementSibling.innerHTML = "<label>Confirm Email</label><input class=\"form-control\"  type=\"email\" id=\"confirmemail\" required>";
										};
										if(element_selected === 'Phone Number') {
											parent = document.getElementById("fromaccount").parentNode;
											parent.innerHTML = "<label>Phone Number</label><input class=\"form-control\"  type=\"number\" id=\"number\" required>";
											parent.nextElementSibling.innerHTML = "<label>Confirm Phone Number</label><input class=\"form-control\"  type=\"number\" id=\"confirmphnumber\" required>";
										};
									}
								</script>
								<select class="form-control" id="fromaccount"
									onchange="chooseOption()" required>
									<option></option>
									<option>Email</option>
									<option>Phone Number</option>
								</select>
							</div>

							<div class="col-sm-4">
								<label>Confirm Email/Phone Number:</label><input type="email"
									class="form-control" id="confirmemail" required>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-6">
								<label for="self">Pay from Account Number:</label> <select
									class="form-control" id="fromaccount" required>
									<option></option>
								</select>
							</div>
							<div class="col-sm-6">
								<label>To Account Number:</label><input type="number"
									class="form-control" id="toaccount" required>
							</div>

						</div>


						<div class="form-group">
							<div class="col-sm-6">
								<label>Amount</label><input class="form-control" id="payamount"
									type="number" pattern="[0-9]" min="1" max="99999" required>
							</div>
							<div class="col-sm-6">
								<label>Routing No</label><input class="form-control"
									id="routing" type="number">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-6">
								<label>Remark</label><input class="form-control"
									id="other_remark" type="text" required>
							</div>
						</div>


						<button type="submit" class="btn btn-default">Pay</button>

					</form:form>
				</div>






				<div id="self" class="tab-pane fade in active">

					<div class="alert alert-info alert-dismissable">
						<a class="panel-close close" data-dismiss="alert">×</a> <i
							class="fa fa-coffee"></i> <strong>Transaction Status:</strong>
						<div id="ot_status"></div>
					</div>



					<h2>Transfer your money within your own accounts</h2>

					<form:form class="form-horizontal" role="form" method="post"
						modelAttribute="self_account" action="/transfer">


						<div class="form-group">
							<div class="col-sm-6">
								<label for="self">From Account Number:</label> <select
									class="form-control" id="fromself" required>
									<option></option>

								</select>
							</div>



							<div class="col-sm-6">
								<label for="sel1">To Account Number:</label> <select
									class="form-control" id="toself" required>
									<option></option>

								</select>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-6">
								<label>Amount</label><input class="form-control"
									id="transferamount" type="number" pattern="[0-9]" min="1"
									max="99999" required>
							</div>

							<div class="col-sm-6">
								<label>Remark</label><input class="form-control"
									id="self_remark" required>
							</div>


						</div>


						<button type="submit" class="btn btn-default">Transfer</button>
						<script>

								}
							</script>
						<button type="button" class="btn btn-default"
							onclick="openVKeyboard">Virtual Keyboard</button>




					</form:form>



				</div>

			</div>
			<!--end of tabbed content-->
		</div>

		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>


</body>

</html>
