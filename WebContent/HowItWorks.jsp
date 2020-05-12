<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Header.jsp"%>

<!--
TO DO:
-animate cards
-overall look update
 -->


<div id="howItContainer">
	<div id="howItCard1" class="howItCard">
		<img src="images/howitworks1.jpg">
		<div class="howItText">
			<h3>Step 1</h3>
			&emsp; Enter what you want to do today, or if there's something you'd like to plan ahead 
			for. Want to find someone to grab coffee with today, go to a concert with on Saturday? 
		</div>
		<div id="howItBtn1" class="howItButton">
			NEXT
		</div>
	</div>
	<div id="howItCard2" class="howItCard">
		<img src="images/howitworks2.jpg">
		<div class="howItText">
			<h3>Step 2</h3>
			&emsp; You'll be matched with users in your area, especially those that have shared a similar 
			idea for what they'd like to do! Check out their profile, add them as a friend, and start chatting.
		</div>
		<div id="howItBtn2" class="howItButton">
			NEXT
		</div>
	</div>
	<div id="howItCard3" class="howItCard">
		<img src="images/howitworks3.jpg">
		<div class="howItText">
			<h3>Step 3</h3>
			&emsp; If it feels like a good fit, give it a go! Meet your new friend, or friends!
		</div>
		<div id="howItBtn3" class="howItButton">
			<a href="MakeFriends.jsp">MAKE FRIENDS</a>
		</div>
	</div>
</div>

<%@ include file="Footer.jsp"%>