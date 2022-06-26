<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Blog</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
    </head>
    <body class="d-flex flex-column min-vh-100">
        <jsp:include page="./navbar.jsp"></jsp:include>
    
    	<div class="container" style="width: 600px;">
	        <div class="addblog-body mt-5">
	            <div class="d-flex justify-content-center">
	                <h1>Search Blog</h1>
	            </div>
	            <div class="mt-5">
	                <form action="result.jsp" class="addblog-form" method="get">
	                    <div class="form-group">
	                        <label class="d-flex justify-content-center" for="title">
	                            <h3>Title</h3>
	                        </label>
	                        <input type="text" class="form-control addblog-input" placeholder="Add Your Title" name="title">
	                    </div>
	                    <div class="form-group mt-3 d-flex justify-content-center ">
	                        <input type="submit" class="btn btn-primary mb-2" value="Search"/>
	                    </div>
	                </form>
	            </div>
	        </div>
        </div>
        <jsp:include page="./footer.jsp"></jsp:include>
    </body>
</html>