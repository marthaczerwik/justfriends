<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="Header.jsp"%>

<!--
TO DO:
-validate email (if exists in db, allow to send, otherwise prompt to enter different email or create profile
-fix overall look
 -->

<h3>Forgot your password?</h3>
<p>Enter your email address and a new password will be sent to you.</p>
<form>
	<input type="text" placeholder="Email address">
</form>
<button id="resetBtn">Reset Password</button>

<p id="pwReset">Your password is on it's way!</p>

<%@ include file="Footer.jsp"%>
