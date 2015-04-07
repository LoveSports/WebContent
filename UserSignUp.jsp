
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="edu.neu.lovesports.entity.*, edu.neu.lovesports.dao.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up I Love Sports</title>
</head>

<!-- 
SignUp page (4/7)
A user enter username, password, email to sign up. Insert a record to user table.
Support username check, password confirm. username and password are * field
Don't support:
Character set and size constraint of username and password
Dynamic check username and password confirm.
Unfinished:
After successfully sign up, jump to Profile(HomePage?)
 -->

<body>
	<h1>Sign Up</h1>
	 <%
    	UserDAO dao = new UserDAO();
    
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String email = request.getParameter("email");
        
        if("create".equals(action))
        {
        	if (username == "")
        	{
        		%>
    			<p style="color:red">Please enter username!</p>
    			<%
        	}
        	else if (dao.readUserByUsername(username) != null)
        	{
        		%>
        			<p style="color:red">Username exists!</p>
        		<%
        	}
            else if (password == "")
            {
            	%>
    			<p style="color:red">Please enter password!</p>
    			<%
            }
        	else if(!password.equals(repassword))
        	{
        		%>
        		<p style="color:red">Password is not consistent!</p>
        		<%
        	}
        	else
        	{
	        	User user = new User(username, password, null, null, email);
	        	dao.createUser(user);
	        	%>
	        		<p style="color:green">SignUp successfully!</p>
	        	<%
	        	String redirect = "/LoveSports/UserProfile.jsp?username="+username;
	        	response.sendRedirect(redirect);
        	}
        }
    %>
	
	<form action="UserSignUp.jsp">
	<table>
		<tr>
			<td>Username</td>
			<td><input name="username" class="form-control"/></td>
			<td>*</td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="password" class="form-control"/></td>
			<td>*</td>
		</tr>
		<tr>
			<td>Re-enter password</td>
			<td><input type="password" name="repassword" class="form-control"/></td>
			<td>*</td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input name="email" class="form-control"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<button type="submit" name="action" value="create">Create</button>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>