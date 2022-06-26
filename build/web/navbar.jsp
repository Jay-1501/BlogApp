<%! String email=""; %>

<%
Cookie ck[] = request.getCookies();
for(int i=0; i<ck.length; i++) {
	if(ck[i].getName().equals("email")) {
		email = (ck[i].getValue());
		break;
	}
}
%>

<header class="header">
    <h1 class="logo"><a href="index.jsp">Blog Application</a></h1>
    <ul class="main-nav">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="search.jsp">Search</a></li>
        
        <%
			if (session.getAttribute("email") == null || session.getAttribute("id") == null) {
				out.print("<li><a href='register.jsp'>Register</a></li>");
				out.print("<li><a href='login.jsp'>Login</a></li>");
			} else {
				out.print("<li><a href='writeBlog.jsp'>Write Blog</a></li>");
	 	       	out.print("<li><a href='yourblog.jsp'>Your Blog</a></li>");
        		out.print("<li><a href='logout.jsp'>Logout</a></li>");	
			}
		%>
    </ul>
</header>