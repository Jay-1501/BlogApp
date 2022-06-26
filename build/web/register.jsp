<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>

<body class="d-flex flex-column min-vh-100">
	<jsp:include page="./navbar.jsp"></jsp:include>
    <div class="container-sm mt-5" style="width: 600px;">
        <h1>Register Form</h1>
        <form class="mt-3" method="POST" action="register">
          <div class="mb-3">
		    <label for="name" class="form-label">Name</label>
		    <input type="text" name="name" class="form-control" id="name">
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Email address</label>
		    <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp">
		    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">Password</label>
		    <input type="password" class="form-control" name="pass" id="exampleInputPassword1">
		  </div>
		  <button type="submit" class="btn btn-primary">Register</button>
		</form>
		<p class="mt-3">Have an account ?  <a href="login.jsp" class="text-primary">Back to Login</a></p>
    </div>
    <jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>