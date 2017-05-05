<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet prefetch'	href='http://fonts.googleapis.com/css?family=Open+Sans:600'>
<link rel="stylesheet" href="css/style.css">

< script>
function fun()
{
alert("Data submition successful!");
}
</script>
</head>
<body>
<div class="add-form">
					<form action="./AddTalkServlet" method="post">
						
						
							<div class="group">
								<label for="topic" class="label">Topic</label> <input
									id="topic" type="text" required="true" class="input" name="topic" >
							</div>
							<div class="group">
								<label for="date" class="label">Date</label> <input
									id="date" type="text" required="true" class="input" data-type="text" name="date" > 
									
							</div>
							<div class="group">
								<label for="presentor" class="label">Presentor</label> <input
									id="presentor" type="text" required="true" class="input" data-type="text" 
									name="presentor">
							</div>
							<div class="group">
								<label for="venue" class="label">Venue</label> <input
									id="venue" type="text" required="true" class="input" data-type="text"  
									name="venue">
							</div>
							<div class="group">
								<label for="description" class="label">Description</label> <input
									id="description" type="text" required="true" class="input" data-type="text"  
									name="description">
							</div>
							
							<div class="group">
								<input type="submit" onclick="fun();" class="button" value="Add">
							</div>
							<div class="hr"></div>
					</form>
				
</body>
</html>