package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DatabaseConnection;

public class UserRegisteration extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String uname = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Connection connection = DatabaseConnection.getConnection();
		
		try {
			Statement stmt = connection.createStatement();

			String query = "select * from register where email_id= '" + email + "'";
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				out.println("email id already exist");
				out.println("Please sign up using different id");
				out.println("<a href='login.jsp'>SignIn</a>");
			}

			else {

				String insert_query = "insert into register(email_id,user_name,password)values(?,?,?)";
				PreparedStatement ps = connection.prepareStatement(insert_query);
				ps.setString(1, email);
				ps.setString(2, uname);
				ps.setString(3, password);
				int i = ps.executeUpdate();
				if (i == 1) {
					out.println("<a href='login.jsp'>SignIn</a>");
					out.println("registered succesfully,sign in to continue");
					
				} else {
					out.println("unsuccesful,please enter details properly");
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
