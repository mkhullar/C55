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

<script>

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
                    var select = document.getElementById("myaccounts");
                    select.appendChild(option);
                }
                for (var i =0 ; i< Object.keys(data["Checkingaccount"]).length ; i++)
                { var option = document.createElement("option");
                  option.text = data["Checkingaccount"][i]["Accountnumber"];
                    option.value = data["Checkingaccount"][i]["Accountnumber"];
                    var select = document.getElementById("myaccounts");
                    select.appendChild(option);
                }

            }
        }
        
    }
    rawFile.send(null);
}
    window.onload=readfile;

</script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
    
    <script type="text/javascript">
    	function testpdf(){
    		var pdf = new jsPDF();
            pdf.text(30, 30, 'Hello world!');
            pdf.save('hello_world.pdf');	
    	}
    	window.onload=testpdf();
 	</script>
	
</head>




<body>
	<script type="text/javascript">
          

       </script>



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

		<!-- Page Content -->
		<div id="banner">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner">
							<div class="logo">
								<span class="icon fa-diamond"></span>
							</div>
							<h1>Account Statement</h1>



							<form:form class="form-horizontal" role="form" method="post"
								modelAttribute="account_number" action="/balance">
								<label for="self">From Account Number:</label>

								<form:select path="" class="form-control" id="myaccounts">
									<form:options value="${accountList}" />
								</form:select>
								<input type="submit" class="btn btn-default" value="Transfer" />
							</form:form>

							<div id="f1">
								<table class="table table-striped">
									<thead class="thead-inverse">
										<tr>
											<th>#</th>
											<th>Date</th>
											<th>Trasaction Name</th>
											<th>Value</th>
											<th>Balance</th>
										</tr>

										<!-- THE JSON STRING HAS TO BE OF THE FORM OF THE TABLE HEADING MENTIONED ABOVE SO THAT IT CAN BE EASILY DISPLAYED IN THE UI  -->
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>




						</div>

						<div>
							<button type="submit">Download</button>
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
