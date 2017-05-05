<!DOCTYPE html>
<html>
<head>
<script>
function fun2()
{
	alert("Login successful");
	}
	
	function fun3()
	{
		alert("Registration successfully done!")
	}
	
</script>
<meta charset="UTF-8">
<title>Day 001 Login Form</title>


<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

<link rel="stylesheet" href="css/style.css">

<script>

</script>
</head>

<body>
	<div class="container" height="100%" width="100%">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
					for="tab-1" class="tab">Sign In</label> <input id="tab-2"
					type="radio" name="tab" class="sign-up"><label for="tab-2"
					class="tab">Sign Up</label>
				<div class="login-form">
					<form action="./UserLogin" method="post">
						<div class="sign-in-htm">
							<div class="group">
								<label for="user" class="label">Username</label> <input
									id="user" type="text" required="true" maxlength="10" class="input" name="username">
							</div>
							<div class="group">
								<label for="pass" class="label">Password</label> <input
									id="pass" type="password" required="true" minlength="8" class="input" data-type="password"
									name="password">
							</div>
							
							<div class="group">
								<input type="submit" onclick="fun2();" class="button" value="Sign In">
							</div>
							<div class="hr"></div>
					</form>
				</div>
				<div class="sign-up-htm">
					<form action="UserRegisteration" method="post">
						<div class="group">
							<label for="user" class="label">Username</label> <input id="user"
								type="text" required="true" maxlength=10 class="input" name="username">
						</div>
						<div class="group">
							<label for="pass" class="label">Password</label> <input id="pass"
								type="password" required="true" maxlength=8 class="input" data-type="password"
								name="password">
						</div>

						<div class="group">
							<label for="pass" class="label">Email Address</label> <input
								id="pass" type="email" class="input" name="email">
						</div>
						<div class="group">
							<input type="submit" onclick="fun3();" class="button" value="Sign Up">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<label for="tab-1">Already Member?</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	</div>
</body>
</html>
