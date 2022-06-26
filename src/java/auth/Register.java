package auth;

import java.io.*;
import java.sql.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class Register extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) {
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String pass = req.getParameter("pass");
			
//			System.out.println(name);
//			System.out.println(email);
//			System.out.println(pass);
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogapplication", "root", "");
			
			Statement ctmt = cn.createStatement();
			ResultSet rs = ctmt.executeQuery("SELECT COUNT(*) FROM users where email='"+ email +"'");
			
			PrintWriter out = res.getWriter();
			
			rs.next();
			
			if(!rs.getString(1).equals("0")) {
				out.println("User Exists.");
			} else {
				
				PreparedStatement ps = cn.prepareStatement("INSERT INTO users (name, email, password) values(?,?,?)");
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, pass);
				
				int i = ps.executeUpdate();
				
				res.sendRedirect("login.jsp");
			}
		} catch(Exception e) {
			System.out.println("Error:- " + e);
		}
	}
}
