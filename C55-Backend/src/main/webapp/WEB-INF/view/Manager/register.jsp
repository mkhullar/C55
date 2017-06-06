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
        <script src="/C55-Backend/assets/js/validator.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="/C55-Backend/assets/js/bootstrap.min.js"></script>
        
        

    <!-- Bootstrap Core CSS -->
    <link href="/C55-Backend/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/C55-Backend/assets/css/simple-sidebar.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>-
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
  <script type="text/javascript">

		
function addnewaccount(){
	var acc_type = document.getElementById("account_type");
	var acc_type_text = acc_type.options[acc_type.selectedIndex].text;
	var postdata = '{"cust_id":"'+document.getElementById("custid").value+'","type": "'+acc_type_text+'","acc_balance":"'+document.getElementById("credit").value+'"}';
          
	// alert(document.getElementById("new_phone").value)
        	alert(postdata);

        	$.ajax({
            type: "POST",
            async: false,
            dataType: "json",
            url: "${home}account/create",  
            data: postdata,
            contentType: "application/json; charset=utf-8",
            success: function(data,status){
            	if(status=="success")
            		{
              console.log(data);
              alert("Account Created");
                //window.location.assign("otp.html");
            		}
            	else
            		alert(status);
            },
            error: function(jqXHR, exception){
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

        });
     return true;
	
}


function addNewUserAccount(custid){
			var acc_type = document.getElementById("new_account_type");
			var acc_type_text = acc_type.options[acc_type.selectedIndex].text;
			var postdata = '{"cust_id":"'+custid+'","type": "'+acc_type_text+'","acc_balance":"'+document.getElementById("new_credit").value+'"}';
            
			//lert(document.getElementById("new_phone").value)
          	alert(postdata);

          	$.ajax({
              type: "POST",
              async: false,
              dataType: "json",
              url: "${home}account/create",  
              data: postdata,
              contentType: "application/json; charset=utf-8",
              success: function(data,status){
            	if(status=="success")
        		{
          console.log(data);
          alert("Account has been created for "+ custid.toString());
            //window.location.assign("otp.html");
        		}
        	else
        		alert(status);
              },
              error: function(jqXHR, exception){
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
			}
          });
	      return true;
			
		}		
		
function createUserAccount(){

	
	var user_type = document.getElementById("user_type");
	var user_type_text = user_type.options[user_type.selectedIndex].text;
	var mob_carrier = document.getElementById("carrier");
	var mob_carrier_text = mob_carrier.options[mob_carrier.selectedIndex].text;
	var gender_type = document.getElementById("gender_type");
	var gender_type_text = gender_type.options[gender_type.selectedIndex].text;
	
			
			var postdata = '{  "username": "'+document.getElementById("user_name").value+'", \
					"password": "'+document.getElementById("pass").value+'", \
					"user_type": "'+document.getElementById("user_type").value+'",\
					"f_name": "'+document.getElementById("f_name").value+'",\
					"l_name": "'+document.getElementById("l_name").value+'",\
					"email": "'+document.getElementById("email").value+'",\
					"mobile_carrier": "'+mob_carrier_text+'",\
					"gender": "'+gender_type_text+'",\
					"address": "'+document.getElementById("address").value+'",\
					"ssn": "'+document.getElementById("ssn").value+'",\
					"mobile": "'+document.getElementById("mobile").value+'",\
					"dob": "'+document.getElementById("dob").value+'"}';
            
          	alert(postdata);

          	$.ajax({
              type: "POST",
              async: false,
              dataType: "json",
              url: "${home}externaluser/create",  
              data: postdata,
              contentType: "application/json; charset=utf-8",
              success: function(data,status){
            	  if(status == "success"){
                		alert("Profile creation success! Your customer id is "+ data.data.cust_id + ".");
                        addNewUserAccount(data.data.cust_id);
            	  }
            	  else
            		  {
            		  alert(data.status);
            		  }
              },
              error: function(jqXHR, exception){
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
              }

          });
	      return true;
			
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
        
        
        
        
        <div class="container-fluid">
            
            
            <ul class="nav nav-tabs nav-justified" role="tablist">

                    <li><a data-toggle="tab" href="#createuser">Create User</a></li>
                    <li><a data-toggle="tab" href="#addaccount">Add Account</a></li>
                </ul>
        
            
            <div class="tab-content">
            <div id="createuser" class="tab-pane fade in active">
                        <div class="container">
                    
            
            
            
		<h2>Personal Bank Account Initial Application</h2>
		<form role="form" data-toggle="validator" class="form-horizontal" onsubmit="createUserAccount()">
			<fieldset>
				<div class="form-group">
				<label for="User Type">User Type:</label>
					<select class="form-control" id="user_type" required>
           			  <option value="person" >Customer</option>
           			 </select>
				</div>
			</fieldset>

			<fieldset>
				<legend>Gender</legend>
				<div class="form-group">
				<select class="form-control" id="gender_type" required>
                      <option value="male" id="male" title="checkid">Male</option>
           			  <option value="female" id="female" title="savingid">Female</option>
                  </select>
				</div>

				<div class="form-group">
      				<div class="col-sm-6"><label>First name</label><input id="f_name"class="form-control" pattern="[A-Za-z]{1,15}"placeholder="First Name" type="text"></div>
      				<div class="col-sm-6"><label>Last name</label><input id="l_name"class="form-control" pattern="[A-Za-z]{1,15}" placeholder="Last Name" type="text"></div>
    			
    			</div>
				
				<div class="form-group">
					<label>UserName</label>
					<input type="text" class="form-control" id="user_name" placeholder="Enter Username" pattern="[A-Za-z0-9]{0,13}" data-error="Only Alphanumeric characters allowed" required>
				</div>
				<div class="form-group">
					<label>Date of Birth</label>
					<input class="form-control" id="dob" placeholder="Date of Birth" type="date" required>
				</div>

				<div class="form-group">
					<label for="email">Email address:</label>
					<input type="email" class="form-control" id="email" placeholder="Enter email-id" data-error="Bruh, that email address is invalid" required>
				</div>
				
				<div class="form-group">
					<label for="password">Password (Alphanumeric and @#$% allowed)</label>
					<input type="password" class="form-control" id="pass"  pattern="[A-Za-z0-9@#$%]{6,12}" data-error="6-12 characters, special characters allowed are @#$%" required>
				</div>
				
				<div class="form-group">
					<label for="ssn">SSN (9 Digit US SSN)</label>
					<input type="number" class="form-control" pattern="[0-9]{0,9}" id="ssn">
				</div>
				
				<div class="form-group">
					<label for="mobile">Mobile No: (10 Digit US Mobile Number)</label>
					<input type="number" class="form-control" pattern="[0-9]{10}" data-error="10 digit number only" id="mobile">
				</div>
				
				<div class="form-group">
					<label for="carrier">Mobile Carrier:</label>
					 <select class="form-control" id="carrier" required>
                              <option value="checking" id="at&t">AT&T</option>
           					  <option value="saving" id="tm">T-Mobile</option>
           					  <option value="Sprint" id="sp">Sprint</option>
           					  	  <option value="Verizona" id="vz">Verizon</option>
           					  <option value="uscellular" id="us">Us Cellular</option>
           				
                           </select>
				</div>

				

			</fieldset>


			<fieldset>
	

				<div class="form-group">
					<label for="Apt name">Address:</label>
					<input type="text" class="form-control" id="address" required>
				</div>
				


			</fieldset>

			

			
			

		
			<fieldset>
			<div class="form-group">
           <label for="customerid">Credit Amount</label>
           <input type="number" class="form-control" id="new_credit" placeholder="Enter Amount">
            </div>
           <div class="form-group">
           <label for="sel1">Account Type:</label>
           <select class="form-control" id="new_account_type">
                              <option value="checking" title="checkid">Checking</option>
           <option value="saving" title="savingid">Savings</option>
                           </select>
            </div>
			</fieldset>
		

			<fieldset>
			<div class="form-group">
				<legend>Terms And Conditions</legend>
				<label><input type="checkbox" required> I/We confirm having read and understood the account rules of The C55  Corporation Limited ('the C55 Bank'), and hereby agree to be bound by the terms and conditions and amendments governing the account(s) issued by the Bank from time-to-time.</label>
			</div>
			</fieldset>


			<input class="btn btn-primary" value="Save Changes" type="submit" >
		</form>
                </div>
                
                </div>
                
                
                <div id="addaccount" class="tab-pane fade" onsubmit="addnewaccount()">
                        <div class="container-fluid">
                    
                            <form role="form" class="form-horizontal">
                                
                                <div class="form-group">
					               <label for="sel1">Customer ID:</label>
					            	<input type="number" class="form-control" id="custid" >   
                                </div>
                                
                                
                                
                                <div class="form-group">
                                <label for="customerid">Credit Amount</label>
                                <input type="text" class="form-control" id="credit" placeholder="Enter Amount">
                                 </div>
                                 
                                  
                                 
                                <div class="form-group">
					               <label for="sel1">Account Type:</label>
					               <select class="form-control" id="account_type">
                                       <option value="checking" title="checkid">Checking</option>
						              <option value="saving" title="savingid">Savings</option>
                                    </select>
                                </div>
                               <input class="btn btn-primary" value="Save Changes" type="submit" >
                            </form>
                                
                           
                    </div>
                </div>
                
                
            </div>
	</div>
<!-- /#wrapper -->



</body>

</html>