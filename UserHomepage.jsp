<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="edu.neu.lovesports.dao.*,edu.neu.lovesports.method.*, edu.neu.lovesports.entity.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.big{
text-align: center;
color: #f60;
background: #666;
}
.little{
text-align: center;
color: red;
background: yellow;
}
</style>
</head>
<body>
	<%
		HandleCookie cookie = new HandleCookie();
		if (cookie.checkCookie(request, response)) {
			UserDAO check = new UserDAO();
			String username = cookie.getUsername(request, response);
			User user = check.readOne(username);
	%>
	<div class="big">
		<h1>
			Hi
			<%=user.getUsername()%>, this is your profile:
		</h1>
		<div class="little">
		<ul>
			<li>First Name: <%=user.getFirstName()%></li>
			<li>Last Name: <%=user.getLastName()%></li>
			<li>Email: <%=user.getEmail()%></li>
		</ul>
		</div>
	<%
		} else
			out.println("<h1>Login Error</h1>");
	%>
	</div>

</body>
</html>