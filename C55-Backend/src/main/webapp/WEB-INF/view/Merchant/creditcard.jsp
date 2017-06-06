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


        <script type="text/javascript">
        var c_str;
        	function getdetails()
        	{
          //  var postdata = 
          //  {
          //    "cust_id":session()
            //}
            //var dataString = JSON.stringify(postdata);
            $.ajax({
            	type: "POST",
            	dataType: "json",
            	async: false,
            	url: "${home}creditcard/getDetails",
              //data: {myData:dataString},
              contentType: "application/json; charset=utf-8",
              success: function(responsedata,status){
              	if(status=="success"){

                  // responsedata =  JSON.stringify(postdata)
                  c_str= responsedata['card_no'].toString();
                  var trailingCharsIntactCount = 4;
                  var ccStr = "XXXXXXXXXXXX"+ c_str;
                  
                  document.getElementById("mp_cust_id").innerHTML="Customer ID: "+ responsedata['cust_id'].toString();
                  document.getElementById("mp_cc_number").innerHTML="Card Number: "+ccStr;
                  document.getElementById("mp_cc_value").innerHTML="Amount Spent: $"+responsedata['amount_spent'].toString();
                  document.getElementById("mp_cc_aggregrate").innerHTML="Amount Due: $"+responsedata['amount_used'].toString();
                  //document.getElementById("mp_cc_interest").innerHTML=responsedata['interest_amount'].toString();
                  
                  //document.getElementById("mp_cc_late").innerHTML=responsedata['late_fee'].toString();
       

              }
          },
          error: function(e){
          	console.log(e.message);
          }
      });

        }


    function makepayment()
    {


    	var postdata = 
    	{
            //"cc_id": 123123123123
            //"cust_id":document.getElementById("mp_cust_id").value,
            "t_amt":document.getElementById("amount_t1").value
        }
        var dataString = JSON.stringify(postdata);

                alert(dataString);
                $.ajax({
                	type: "POST",
                	dataType: "json",
                	async: false,
                	url: "${home}creditcard/transaction",
                	data: dataString,
                	contentType: "application/json; charset=utf-8",
                	success: function(status){
                		alert(status);
                		if(status=="success"){
                			alert("Payment success");
                		}
      					else if(status=="error")
      					{
      						alert("Sorry Error occured");
      					}
                	},
                	error: function(e){
                		console.log(e.message);
                	}
                });

            }



            function makepurchase()
            {

            	var postdata = 
            	{
            //"cc_id": 123123123123
            "card_no":document.getElementById("mp_cc_number").value,
            "pay_amount":document.getElementById("amount_t1").value,
            "cvv":document.getElementById("cvv").value,
            "exp_date": document.getElementById("expdate").value,
            "merchant":document.getElementById("merchant").value
        }
        var dataString = JSON.stringify(postdata);

                alert(dataString);
                $.ajax({
                	type: "POST",
                	dataType: "json",
                	url: "${home}card/purchase",
                	data: {myData:dataString},
                	contentType: "application/json; charset=utf-8",
                	success: function(data,status){
                		if(status=="success"){
                			alert("Purchase request has been made ");
                		}
                	},
                	error: function(e){
                		console.log(e.message);
                	}
                });

            }




            window.onload=getdetails;

        </script>


    </head>

    <body>

    	<div id="wrapper">

    		<!-- Sidebar -->
    		<div id="sidebar-wrapper">
    			<ul class="sidebar-nav">
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
					<a href="${home}notification">Requests</a>
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

		<li><a data-toggle="tab" href="#makepayment">Make Payment</a></li>
		<%--  <li><a data-toggle="tab" href="#downloadstatement">Download Statement</a></li>--%>
		<li><a data-toggle="tab" href="#makepurchase">Make Purchase</a></li>
		<%--<li><a data-toggle="tab" href="#dc">Debit/Credit Amount</a></li>--%>
		<!--<li><a data-toggle="tab" href="#changeUserName">Request Purchase</a></li>-->
		<!--<li><a data-toggle="tab" href="#updatecclimit">Update Credit Limit</a></li>-->
	</ul>
	<div class="tab-content">


		<!-- ###################################### Phone no tab-->
				<!-- ######################################-->

		<!-- ###################################### Password tab-->
		<div id="makepurchase" class="tab-pane fade ">
			<div class="container">
				<h1>Make your purchase</h1>
				<hr>
				<div class="row">

					<div class="col-md-12 personal-info">
						<form class="form-horizontal" role="form" method="POST" onsubmit="makepurchase()">

							<div class="form-group">
								<label class="col-lg-3 control-label">Merchant:</label>
								<div class="col-lg-8">
									<select multiple class="form-control" id="merchant">
										<option value="Amazon" > Amazon</option>
										<option value="Flipkart"  >Flipkart</option>
										<option value="Ebay" >Ebay</option>
									</select>

								</div>
							</div>


							<div class="form-group">
								<label class="col-lg-3 control-label">Amount:</label>
								<div class="col-lg-8">
									<input class="form-control" id="amount_t3"  type="number">
								</div>
							</div>

							
							<div class="form-group">
								<label class="col-lg-3 control-label">Expiry date</label>
								<div class="col-lg-8">
									<input class="form-control" id="expdate"  type="number">
								</div>
							</div>
							
							<!--  div class="form-group">
						        <label class="col-lg-3 control-label" for="expiry-month">Expiration Date</label>
						        <div class="col-lg-8">
						          <div class="row">
						            <div class="col-xs-3">
						              <select class="form-control col-sm-2" name="expiry-month" id="expiry-month">
						                <option>Month</option>
						                <option value="01">Jan (01)</option>
						                <option value="02">Feb (02)</option>
						                <option value="03">Mar (03)</option>
						                <option value="04">Apr (04)</option>
						                <option value="05">May (05)</option>
						                <option value="06">June (06)</option>
						                <option value="07">July (07)</option>
						                <option value="08">Aug (08)</option>
						                <option value="09">Sep (09)</option>
						                <option value="10">Oct (10)</option>
						                <option value="11">Nov (11)</option>
						                <option value="12">Dec (12)</option>
						              </select>
						            </div>
						            <div class="col-xs-3">
						              <select class="form-control" name="expiry-year">
						                <option value="13">2013</option>
						                <option value="14">2014</option>
						                <option value="15">2015</option>
						                <option value="16">2016</option>
						                <option value="17">2017</option>
						                <option value="18">2018</option>
						                <option value="19">2019</option>
						                <option value="20">2020</option>
						                <option value="21">2021</option>
						                <option value="22">2022</option>
						                <option value="23">2023</option>
						              </select>
						            </div>
						          </div>
						        </div>
						      </div-->

							<div class="form-group">
								<label class="col-lg-3 control-label">CVV:</label>
								<div class="col-lg-8">
									<input class="form-control" id="cvv"  type="password">
								</div>
							</div>




							<div class="form-group">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-8">

									<input class="btn btn-primary" value="Pay" type="submit">
									<span></span>
									<input class="btn btn-default" value="Cancel" type="reset">

								</div>
							</div>

						</form>







					</div>
				</div>
			</div>
		</div>
		<!-- ######################################-->    

  <!-- ###################################### Username tab
  <div id="updatecclimit" class="tab-pane fade ">
    <div class="container">
      <h1>Update Credit Card limit</h1>
      <hr>
      <div class="row">
       
        <div class="col-md-12 personal-info">


          <form class="form-horizontal" role="form" method="POST" onsubmit="updatecclimit()">


            <div class="form-group">
              <label class="col-md-3 control-label">New Credit Card Limit:</label>
              <div class="col-md-8">
                <input class="form-control" id="new_username"  type="number">
              </div>
            </div>

            <div class="form-group">
              <label class="col-md-3 control-label"></label>
              <div class="col-md-8">

                <input class="btn btn-primary" value="Update" type="submit">
                <span></span>
                <input class="btn btn-default" value="Cancel" type="reset">

              </div>
            </div>

          </form>

        </div>
      </div>
    </div>
  </div>
  ######################################-->  


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
  					<a class="panel-close close" data-dismiss="alert">×</a> 
  					<i class="fa fa-coffee"></i>
  					<strong id="mp_cc_number"></strong><div id="mp_cust_id"></div><div id="mp_cc_value"></div><div id="mp_cc_aggregrate"></div>
  				</div>

  				<form class="form-horizontal" role="form" method="POST" onsubmit="makepayment()">


  					<div class="form-group">
  						<label class="col-lg-3 control-label">Amount:</label>
  						<div class="col-lg-8">
  							<input class="form-control" id="amount_t1"  type="number">
  						</div>
  					</div>

  					<div class="form-group">
  						<label class="col-md-3 control-label"></label>
  						<div class="col-md-8">

  							<input class="btn btn-primary" value="Pay" type="submit">
  							<span></span>
  							<input class="btn btn-default" value="Cancel" type="reset">

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