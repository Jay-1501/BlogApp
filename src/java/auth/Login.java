package auth;

import java.io.*;
import java.sql.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class Login extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) {
		try {
			String email = req.getParameter("email");
			String pass = req.getParameter("pass");
//			
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogapplication", "root", "");
//			
			Statement ctmt = cn.createStatement();
			ResultSet rs = ctmt.executeQuery("SELECT * FROM users");
			
			PrintWriter out = res.getWriter();

			while(rs.next()) {
				String id_db = rs.getString(1);
				String email_db = rs.getString(3);
				String pass_db = rs.getString(4);
				
				if(email.equals(email_db) && pass.equals(pass_db)) {
					HttpSession session = req.getSession();
					session.setAttribute("email", email);
					session.setAttribute("id", id_db);
					
					Cookie ck1 = new Cookie("email", email);
					res.addCookie(ck1);
					
					Cookie ck2 = new Cookie("id", id_db);
					res.addCookie(ck2);
					
					res.sendRedirect("index.jsp");
				}
			}
			out.println("User Not Exist.");
		} catch(Exception e) {
			System.out.println("Error:- " + e);
		}
	}
}

