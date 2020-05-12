<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="Header.jsp"%>

<!--
TO DO:
-fix overall look - have form centered, fix buttons (not working/looking as expected?)
-change errors: inject code if errors exist vs hidden <p> element
  -->


<%
	String loginError = (String) request.getAttribute("loginError");

%>
<div id="loginContainer">
	<div id="loginImg">
		<img src="images/login.png">
		<div id="loginPhone">
			<h3>LOG IN</h3>
			<div id="form">
				<form method="post" action="LoginController">
					<input type="text" name="username" placeholder="username" autofocus
						autocomplete="" size="12"><br> <input type="password"
						name="password" placeholder="password" size="12">
						<p id="loginErr"><%
						if (loginError != null) {
						out.print(loginError); 
						}%></p>
					<p>
						<input class="loginButtons" type="submit" value="LOG IN">
					</p>
					<p class="formText">
						<a href="PasswordReset.jsp">Forgot Password?</a>
					</p>
					<p class="formText">
						Don't have an account?<br>Click below to create a profile.
					</p>
					<p>
						<button class="loginButtons"><a href="SignUp.jsp">SIGN UP</a></button>
						</form>
					</p>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="Footer.jsp"%>
