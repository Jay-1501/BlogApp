
package tags;
import javax.servlet.jsp.JspException;
import java.io.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;
public class ShowBlogs extends TagSupport {

//    public int blogid;
//    public String title;
//    public String blog;
//
//    //setter
//
//    public void setBlogid(int blogid) {
//        this.blogid = blogid;
//    }
//
//    public void setTitle(String title) {
//        this.title = title;
//    }
//
//    public void setBlog(String blog) {
//        this.blog = blog;
//    }
    
    @Override
    public int doStartTag() throws JspException{
        try{
            JspWriter out = pageContext.getOut();

        Class.forName("com.mysql.jdbc.Driver");
	Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogapplication", "root", "");
	
	Statement ctmt = cn.createStatement();
	ResultSet rs = ctmt.executeQuery("SELECT * FROM blogs");
	
	while(rs.next()){
		int id = Integer.parseInt(rs.getString(1));
		String title = rs.getString(2);
		String blog = rs.getString(3);
		int user = Integer.parseInt(rs.getString(4));
		
		String finalBlog = blog;
		
		if(blog.length() > 240){
			finalBlog = blog.substring(0, 300) + "  ....";
		}
		
		out.print("<div class='container mt-5' style='width: 1200px;'>");
		out.print("<div class='card'>");
		out.print("<h4 class='card-header'>" + title + "</h4>");
		out.print("<div class='card-body'>");
		out.print("<p class='card-text'>" + finalBlog + "</p>");
		out.print("<a href='fullblog.jsp?id=" + id + "'class='btn btn-outline-primary'>Read Full Article</a>");
		out.print("</div>");
		out.print("</div>");
		out.print("</div>");
        }}
        catch(Exception e){
            e.printStackTrace();
        }
        return SKIP_BODY;
    }
}
