<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div id="headerContainer">
	<div id="logo">
		<a href="PrivateHome.jsp">justfriends</a>
	</div>
	<div id="navLinks">
		<nav>
			<span id="makeFriendsButton"><a href="MakeFriends.jsp">Make
					Friends</a></span> <a href="HowItWorks.jsp">How It Works</a> <a href="FAQ.jsp">FAQ</a>
			<div class="dropdown">
				<div id="profileLink">
					<div id="profileIcon">
						<img src="images/profileIcon.JPG">
					</div>
					<a>${usernameSession}</a> <i class="fa fa-caret-down"></i>
				</div>


				<div class="dropdown-content">
					<a href="PrivateHome.jsp">My Profile</a> <a href="MyFriends.jsp">My Friends List</a> <a
						href="AccountSettings.jsp">Account Settings</a><a id="logout"
						href="LogoutController">Logout</a>
				</div>
			</div>
		</nav>
	</div>
</div>