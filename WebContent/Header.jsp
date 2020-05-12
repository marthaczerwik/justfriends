<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>JSFR</title>
<meta charset="ISO-8859-1">
<link href='style.css' rel='stylesheet' />

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@300;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
<link href='fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='fullcalendar/packages/daygrid/main.css' rel='stylesheet' />

<script src='fullcalendar/packages/core/main.js'></script>
<script src='fullcalendar/packages/daygrid/main.js'></script>
<script src='fullcalendar/interaction/main.js'></script>

</head>
<body>
	<div id="bodyContainer">
		<div id="contentContainer">

			<%
				if (session.getAttribute("usernameSession") == null) {
			%>
			<%@ include file="PublicNav.jsp"%>

			<%
				} else {
			%>
			<%@ include file="PrivateNav.jsp"%>
			
			<%
				}
			%>