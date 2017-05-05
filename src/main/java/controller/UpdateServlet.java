package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;

import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DatabaseConnection;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String Id = request.getParameter("id");
		String topic = request.getParameter("topic");
		String date = request.getParameter("date");
		String venue = request.getParameter("venue");
		String presentor = request.getParameter("presentor");
		String description = request.getParameter("description");
		System.out.println(date);
		System.out.println(Id);
		System.out.println(topic);
		System.out.println(venue);
		System.out.println(presentor);
		System.out.println(description);
		
		int id = Integer.parseInt(Id);
		

		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
			java.util.Date date_new=formatter.parse(date);
			Date newDate = new Date(date_new.getTime());
			Connection connection = DatabaseConnection.getConnection();
			PreparedStatement ps=null;
			//Date date_new = formatter.parse(date);
			String query = "UPDATE tech_talks SET tech_topic = '"+topic+"',tech_date='"+newDate+"',presentor='"+presentor+"',venue='"+venue+"',description='"+description+"' WHERE tech_id = "+id;
			System.out.println("sql query:"+query);
			/*ps.setString(1, topic);
			ps.setDate(2, newDate);
			ps.setString(3, presentor);
			ps.setString(4, venue);
			ps.setString(5, description);
			ps.setInt(6, id);*/
			
			ps = connection.prepareStatement(query);
			int i = ps.executeUpdate();
			if (i > 0) {
				out.println("Updated succesfully");
				RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
				rd.forward(request, response);
				
			} else {
				out.println("cant be updated");
				RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
				rd.include(request, response);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
