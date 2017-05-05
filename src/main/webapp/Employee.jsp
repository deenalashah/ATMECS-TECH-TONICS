<%@ page import="dao.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<!DOCTYPE HTML>
<html>
<head>
<title>TechTalk  Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Seeking Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style1.css" rel='stylesheet' type='text/css' /> 
<link href='//fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>

<link href="css/font-awesome.css" rel="stylesheet">  
 <link href="css/signup.css" rel="stylesheet"> 
<!----font-Awesome----->
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
	<div class="container">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
	        </button>
	        <a class="navbar-brand" href="index.html"></a>
	    </div>
	    <!--/.navbar-header-->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" style="height: 1px;">
	        <ul class="nav navbar-nav">
		        
		         <li> <a class =" btn btn-primary "href="LogoutServlet">LOGOUT</a> </li>
				</ul>
	    </div>
	    
	    <div class="clearfix"> </div>
	  </div>
	    <!--/.navbar-collapse-->
	</nav>
	
	<br>
	<br>
	<div class="container">
		<div id="search_wrapper">
		 <div id="search_form" class="clearfix">
       
         </div>
		
		 		
		 	<% 
		 	Connection connection = DatabaseConnection.getConnection();
			try {
				Statement stmt = connection.createStatement();
				String query="SELECT * FROM techtalk.`tech_talks`";
				ResultSet rs=stmt.executeQuery(query);
				if(!rs.next())
				{
					out.println("No techtalks present");
				}
				else{
		 	
		 	%>
		 
		 <table style="width:100%"  class="table table-hover">
		 <tr>
    				<th style="font-size:x-large; width:15%">  ID</th>
					<th style="font-size:x-large; width:15%">  Title</th>
					<th style="font-size:x-large; width:15%">  Date</th>
					<th style="font-size:x-large; width:15%">  Presentor</th> 
					<th style="font-size:x-large; width:15%">  Venue</th> 
					<th style="font-size:x-large; width:15%">  Description</th>
					<th style="font-size:x-large; width:15%"> Interested</th> 
		</tr>
		
		 <% 
		 do
			 { %>
		 
      			
        			<tr>        			
        				<td style="font-size:large;width:12% "><%= rs.getInt(1) %> </td>
        				<td style="font-size:large;"><%=rs.getString(2) %> </td>
          				<td style="font-size:large;"><%=rs.getDate(3) %></td>&nbsp
          				<td style="font-size:large;"><%=rs.getString(4) %></td>
          				<td style="font-size:large;"><%=rs.getString(5) %></td>
          				<td style="font-size:large;"><%=rs.getString(6) %></td>
          				<td style="font-size:large;"><a class="btn btn-primary" href="#"><span class="glyphicon glyphicon-ok"></span></a></td>
          				<%-- <td style="font-size:x-large;"> <a href="jobDetails.jsp?jobId=${current.jobId}" >Details</a></td> --%>
          				
      				</tr>
      				<% 
      				
			 }
		 while(rs.next());
				
				}
      				}
      				catch(Exception e)
      				{
      				 System.out.println(e);
      				 }
			%>
      			
    	</table>    
        </div>
            <br><br><br><br>
    </div>
        
 