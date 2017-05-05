package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DatabaseConnection;

public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String uname = request.getParameter("username");
		String password = request.getParameter("password");
		Connection connection = DatabaseConnection.getConnection();
		

		   HttpSession session=request.getSession();  
		        session.setAttribute("uname",uname);
		        
		try {
			Statement stmt = connection.createStatement();
			if (uname.equals("deenal") && password.equals("12345678")) {
				RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
				rd.forward(request, response);
				out.println("welcome admin");
				//System.out.println("Welcome to console0");
				
			} else {
				String query = "select * from register where user_name= '" + uname + "'";
				ResultSet rs = stmt.executeQuery(query);
				if (rs.next()) {
					RequestDispatcher rd = request.getRequestDispatcher("Employee.jsp");
					rd.forward(request, response);
					out.println("welcome user");
					//System.out.println("Welcome to console");
					

				} else {
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.include(request, response);
					out.println("invalid username/password combination.try again");
					//System.out.println("Welcome to console2");
				}
			}
		}

		catch (SQLException e) {
		
			e.printStackTrace();
		}

	}

}
