<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>;

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Blog</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <style>
            input[type="text"]::placeholder {
                text-align: center;
            }
            textarea::placeholder {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./navbar.jsp"></jsp:include>  
        
        <%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			if (session.getAttribute("email") == null || session.getAttribute("id") == null) {
				response.sendRedirect("login.jsp");
			}
		%>   
        
<%! int created_by; %>
<%! String title, blog, blogid; %>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogapplication", "root", "");

blogid = request.getParameter("id");

Statement ctmt = cn.createStatement();
ResultSet rs = ctmt.executeQuery("SELECT * FROM blogs where id='"+ Integer.parseInt(blogid) +"'");

rs.next();

title = rs.getString(2);
blog = rs.getString(3);
created_by = Integer.parseInt(rs.getString(4));

%>
        <div class="container" style="width: 1000px;">
	        <div class="addblog-body mt-5">
	            <div class="d-flex justify-content-center">
	                <h1>Update Blog</h1>
	            </div>
	            <br/>
                <form action="updated.jsp" class="addblog-form" method="post">
                    <div class="form-group">
                        <label class="d-flex justify-content-center" for="title">
                            <h3>Title</h3>
                        </label>
                        <input type="text" value="<% out.println(title); %>" class="form-control addblog-input" placeholder="Add Your Title" name="title">
                    </div>
                    <br/>
                    <div class="form-group">
                        <label class="d-flex justify-content-center" for="content">
                            <h3>Blog</h3>
                        </label>
                        <textarea class="form-control addblog-input" name="blog" placeholder="Add Your Content" rows="12" name="content"><% out.println(blog); %></textarea>
                    </div>
                    <br/>
                    <input type="hidden" name="id" id="id" value="<% out.println(blogid); %>">
                    <div class="form-group mt-2 d-flex justify-content-center">
                        <input type="submit" class="btn btn-primary mb-2" value="Update"/>
                    </div>
                </form>
	        </div>
        </div>
        <jsp:include page="./footer.jsp"></jsp:include>
    </body>
</html>