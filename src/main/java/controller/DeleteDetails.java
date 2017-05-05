package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DatabaseConnection;

public class DeleteDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		int Id = Integer.parseInt(id);
		try {
			Connection connection = DatabaseConnection.getConnection();

			Statement stmt = connection.createStatement();

			String query = "delete from tech_talks where tech_id=" + Id;
			int i = stmt.executeUpdate(query);
			if (i > 0) {
				out.println("deletion succeful");
				RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
				rd.forward(request, response);
			} else {
				out.println("deletion unsucceful,please try again");
				RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
				rd.include(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
