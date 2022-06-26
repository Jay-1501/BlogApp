<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Write Your Blog</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if (session.getAttribute("email") == null || session.getAttribute("id") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<jsp:include page="./navbar.jsp"></jsp:include>
	<div class="container" style="width: 1000px;">
		<div class="addblog-body mt-5">
			  <div class="d-flex justify-content-center">
	            <h1>Add Blog</h1>
	        	</div>
	        	<br/>
			<form action="writeblog" class="addblog-form" method="POST">
	          <div class="form-group">
	              <label class="d-flex justify-content-center" for="title">
	                  <h3>Title</h3>
	              </label>
	              <input type="text" name="title" class="form-control addblog-input" placeholder="Add Your Title" name="title">
	          </div>
	          <br/>
			  <div class="form-group">
	              <label class="d-flex justify-content-center" for="content">
	                  <h3>Body</h3>
	              </label>
	              <textarea class="form-control addblog-input" placeholder="Add Your Content" rows="12" name="blog"></textarea>
	          </div>
	          <br/>
				<div class="form-group mt-2 d-flex justify-content-center ">
	                  <input type="submit" class="btn btn-primary mb-2" value="Submit"/>
	                </div>		
	           </form>	
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		</div>
	</div>
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>