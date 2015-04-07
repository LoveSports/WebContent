<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
    import="edu.neu.lovesports.dao.*, java.util.*, edu.neu.lovesports.method.*, edu.neu.lovesports.entity.User, java.sql.* "
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h3>User Login</h3>

	<form action="UserLogin.jsp">

		Account: <input name="username" type="text" /><br />
		<br /> Password:<input name="password" type="password" /><br />
		<br />
		<button type="submit" name="action" value="login">Log In</button>
		<button name="action" value="signup">Sign Up</button>
		<%
			UserLogin check = new UserLogin();
			String action = request.getParameter("action");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if ("signup".equals(action))
				response.sendRedirect("/LOVESPORTS/UserSignUp.jsp");
			if ("login".equals(action) && (username == "" || password == ""))
				out.println("Please enter account and password.");
			else {
				if (check.LoginCheck(username, password)) {
					HandleCookie cookie = new HandleCookie();
					cookie.setCookie(request, response);
				} else if (action != null)
					out.println("Username and Password are not matched.");
			}
		%>
	</form>

</body>
</html>