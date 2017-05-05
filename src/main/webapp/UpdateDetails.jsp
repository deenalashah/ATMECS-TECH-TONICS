<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<script>
function fun1()
{
	alert("Updation successful");
	}
</script>
<meta charset="UTF-8">
<link rel='stylesheet prefetch'	href='http://fonts.googleapis.com/css?family=Open+Sans:600'>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<%@ page import="dao.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.Date" %>
<% 

String tech_Id=request.getParameter("id"); 

Connection connection = DatabaseConnection.getConnection();
int id;
String topic,presentor,venue,description;
Date date;
Statement stmt = connection.createStatement();
String query="SELECT * FROM techtalk.`tech_talks` where `tech_id`="+tech_Id;
ResultSet rs=stmt.executeQuery(query);

	
	
	
	if(rs.next())
	{
		id=rs.getInt(1);
		System.out.println(id);
		topic=rs.getString(2);
		System.out.println(topic);
		date=rs.getDate(3);
		System.out.println(date);
		presentor=rs.getString(4);
		System.out.println(presentor);
		venue=rs.getString(5);
		System.out.println(venue);
		description=rs.getString(6);
		System.out.println(description);
		
	}

	

%>
<div class="update-form">
					<form action="UpdateServlet" method="post">
						
						<div class="group">
								<label for="id" class="label">Tech-Id</label> <input
									id="id" type="text" required="true" class="input" name="id" value= <%=rs.getInt(1)%> readonly>
							</div>
							<div class="group">
								<label for="topic" class="label">Topic</label> <input
									id="topic" type="text" required="true" class="input" name="topic" value= <%=rs.getString(2)%>>
							</div>
							<div class="group">
								<label for="date" class="label">Date</label> <input
									id="date" type="text" required="true" class="input" data-type="text" value= <%=rs.getDate(3)%> 
									name="date">
							</div>
							<div class="group">
								<label for="presentor" class="label">Presentor</label> <input
									id="presentor" type="text" required="true" class="input" data-type="text" value= <%=rs.getString(4)%> 
									name="presentor">
							</div>
							<div class="group">
								<label for="venue" class="label">Venue</label> <input
									id="venue" type="text" required="true" class="input" data-type="text"  value= <%=rs.getString(5)%> 
									name="venue">
							</div>
							<div class="group">
								<label for="description" class="label">Description</label> <input
									id="description" type="text" required="true" class="input" data-type="text"  value= <%=rs.getString(6)%> 
									name="description">
							</div>
							
							<div class="group">
								<input type="submit" onclick="fun1();" class="button" value="Update">
							</div>
							<div class="hr"></div>
					</form>
				
</body>
</html>