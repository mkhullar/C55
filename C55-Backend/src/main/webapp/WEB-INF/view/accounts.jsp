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
<link href="/C55-Backend/assets/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/C55-Backend/assets/css/simple-sidebar.css" rel="stylesheet">


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
              document.getElementById("customername").innerHTML=data["Name"];   
                 var txt="";
                 if(data["Savingsaccount"]!="NULL")
               for (var i =0 ; i< Object.keys(data["Savingsaccount"]).length;i++)
                {
                txt+="<div class='row'><div class='col-md-8'><h3>Account Number:</h3><h4>" + data["Savingsaccount"][i]["Accountnumber"]+ "</h4></div><div class='col-md-4'><h3>Balance:</h3><h5>$" + data["Savingsaccount"][i]["Balance"]+ "</h5></div></div>";
              }
              document.getElementById("savaccount").innerHTML=txt;
                

               var txt1="";
               if(data["checkingaccount"]!="NULL")
               for (var i =0 ; i< Object.keys(data["Checkingaccount"]).length;i++)
                {
                txt1+="<div class='row'><div class='col-md-8'><h3>Account Number:</h3><h4>" + data["Checkingaccount"][i]["Accountnumber"]+ "</h4></div><div class='col-md-4'><h3>Balance:</h3><h5>$" + data["Checkingaccount"][i]["Balance"]+ "</h5></div></div>";
              }
              document.getElementById("checkaccount").innerHTML=txt1;
              
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
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"></li>
				<li><a href='<c:url value="/customer/accounts"/>'>Account
						Information</a></li>
				<li><a href='<c:url value="/customer/transfercash"/>'>Transfer Cash</a>
				</li>
				<li><a href='<c:url value="/customer/balanceinfo"/>'>Balance
						Statement</a></li>
				<li><a href='<c:url value="/customer/notification"/>'>Notification</a></li>
				<li><a href='<c:url value="/customer/editprofile"/>'>Edit Profile</a></li>
				<li><a href='<c:url value="/customer/creditcard"/>'>Credit Card</a></li>
				<li><a href='<c:url value="/customer/logout"/>'>Logout</a></li>
			</ul>
		</div>
		<div class="jumbotron">
			<div class="container">
				<h2 id="customername"></h2>
				<h3>Savings Account</h3>
				<div id="savaccount"></div>
				<hr>
				<h3>Checking Account</h3>

				<div id="checkaccount"></div>
			</div>
		</div>
		<script src="/C55-Backend/assets/js/jquery.js"></script>
		<script src="/C55-Backend/assets/js/bootstrap.min.js"></script>
	</div>
</body>

</html>