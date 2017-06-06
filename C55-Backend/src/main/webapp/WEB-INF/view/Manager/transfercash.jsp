<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="home" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <c:url var="home" value="/" scope="request" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>-
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    function otheraccount()
    {


    	var postdata = 
    	{
    		//cust_id: session;
    		"from_acc":document.getElementById("from_t2").value,
    		"to_acc":document.getElementById("to_t2").value,
    		"t_amount":document.getElementById("amount_t2").value,
    		"remarks":document.getElementById("remark_t2").value
    	}
    	var dataString = JSON.stringify(postdata);
    	alert(dataString);
    	$.ajax({
    		type: 'POST',
    		async: false,
    		dataType: "json",
    		url: "${home}transfer/initiate",
    		data: dataString,
    		contentType: "application/json; charset=utf-8",
    		success: function(responsedata,status){
    			if(responsedata.status=="success"){
    				console.log(responsedata);
    			alert(responsedata);
    			}
    			else
    				alert("Insufficient funds");
    		},
    		error: function(e){
    			console.log(e.message);
    		}
    	});

    }
      
    </script>
  </head>
  <body>
    <div id="wrapper">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
      <ul class="sidebar-nav">
          <li>
          <a href="${home}register">Create Account</a>
        </li>
        <li>
          <a href="${home}transfercash">Transactions</a>
        </li>
        <li>
          <a href="${home}editprofile">Edit Profile</a>
        </li>
        <li>
          <a href="${home}deleteprofile">Delete Account</a>
        </li>
        <li>
          <a href="${home}request">Requests</a>
        </li>
        <li>
			<a href="${home}logout">Logout</a>
		</li>
      </ul>
    </div>
    <!-- /#sidebar-wrapper -->
    <!-- Page Content -->
    <div class="container-fluid">
    <!--<ul class="nav nav-tabs nav-justified" role="tablist">
      <li><a data-toggle="tab" href="#self">Between your accounts</a></li>
      <li><a data-toggle="tab" href="#other">To others accounts</a></li>
    </ul>-->
					<div>
					<h2>
						Transfer Cash
					</h2>



					<form role="form" class="form-horizontal" onsubmit="otheraccount()">


						
							<div class="form-group">
								<div class="col-sm-6"><label for="self">Pay from Account Number:</label>
									<input type="number" class="form-control" id="from_t2"  required></div>
									<div class="col-sm-6"><label>To Account Number:</label><input type="number" class="form-control" id="to_t2"  required></div>

								</div>


								<div class="form-group">
									<div class="col-sm-6"><label>Amount</label><input class="form-control" id="amount_t2"  type="number" pattern="[0-9]" min="1" max="99999" required></div>
									<div class="col-sm-6"><label>Remark</label><input class="form-control" id="remark_t2"  type="text"  required></div>

								</div>


								<button type="submit" class="btn btn-default">Pay</button>
							</form>
						</div>
      <!--end of tabbed content-->
    </div>
    <!-- /#page-content-wrapper -->
  </body>
</html>