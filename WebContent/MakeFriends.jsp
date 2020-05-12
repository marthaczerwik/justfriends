<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!--
This page will start off with the users entering what they want to do (criteria for being matched)
This along with their location (city for now, can expand using postal code and distance in km), will
be queried to find matches. Then the user will be able to look through the matches, and can choose to
either add friend, send chat, click next, or block the user.User will be redirected accordingly.

TO DO:
1. form: input for users to enter what they want to do
-currently test accounts do not have this data, improvising and using "interests" instead
-will update this + improve styling
-include preset options/search bar with suggestions

2. matches:
-have options to expand distance (i.e., matches with those within 25 km distance, 50km..)
-allow blocking of users (add to list of blocked users on db, ensure these do not show up in future searches
-create chat function between users (popup + site tab)

3. redirect users to chat popup or to view a users profile, or view next match
  -->


<%
	if (session.getAttribute("usernameSession") == null) {
%>
<%@ include file="Login.jsp"%>

<%
	} else {
%>
<%@ include file="Header.jsp"%>
UNDER CONSTRUCTION
<%@ include file="Footer.jsp"%>

<%
	}
%>



