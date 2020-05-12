<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="Header.jsp"%>

<!--This serves as the user's dashboard/profile. Their profile info
is on the left, preview of their friends list to go on top,
and below will be a section to display recent chats with friends
as well as their calendar - here users will be able to create
events with other users, or create events to invite users to
(currently does not function as intended, will be adding on
features day by day 
TO DO:
-add functions to calendar to add and edit events
-fix how calendar looks
-add chat feature to site and link recent chats here
-fix display of friends and create function to display most recently added 4
-->

UNDER CONSTRUCTION
<div id="dashboardContainer">

	<div id="dashColumn">
		<div id="dashImg">
			<img src="images/${photo}">
		</div>
		<div id="dashName" class="dashColItem">${firstName} ${lastName}</div>
		<div class="dashColItem">
			<a href="EditProfile.jsp">Edit profile</a>
			<p>${gender}</p>
			<p>Birthday:</p>
			<p>${city}, ${provOrState}</p>
			<p>${country}</p>
			<p>
		</div>
		<div></div>
	</div>

	<div id="dashRows">
		<div id="dashFriends">
			<div class="dashFriend">
				<img src="images/profileImage01.jpeg"> <span>Jacob
					Wester</span>
			</div>
			<div class="dashFriend">
				<img src="images/profileImage01.jpeg"> <span>Stacey
					Rosewells</span>
			</div>
			<div class="dashFriend">
				<img src="images/profileImage01.jpeg"> <span>Jake
					Hammer</span>
			</div>
			<div class="dashFriend">
				<img src="images/profileImage01.jpeg"> <span><a
					href="MyFriends.jsp">See all...</a></span>
			</div>
		</div>
		<div id="dashRowTwo">
			<div id="dashChat">
				<span>Chat:</span>
				<p>Recent chats will be here.</p>
			</div>
			<div id="dashCal">
				<div id="calendar"></div>
			</div>
		</div>
	</div>

</div>



<%@ include file="Footer.jsp"%>
