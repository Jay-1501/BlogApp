package blog;

import java.io.*;
import java.sql.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class WriteBlog extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) {
		try {
			String title = req.getParameter("title");
			String blog = req.getParameter("blog");
			int id = 0;
				
			PrintWriter out = res.getWriter();
			
			Cookie ck[] = req.getCookies();
			for(int i=0; i<ck.length; i++) {
				if(ck[i].getName().equals("id")) {
					id = Integer.parseInt(ck[i].getValue());
					break;
				}
			}
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogapplication", "root", "");
			
			PreparedStatement ps = cn.prepareStatement("INSERT INTO blogs (title, blog, created_by) values(?,?,?)");
			ps.setString(1, title);
			ps.setString(2, blog);
			ps.setInt(3, id);
			
			int i = ps.executeUpdate();
			
			res.sendRedirect("index.jsp");
		} catch(Exception e) {
			System.out.println("Error:- " + e);
		}
	}
}
