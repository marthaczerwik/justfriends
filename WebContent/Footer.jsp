<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!--
TO DO:
-fix chatbot styling/functionality + ensure bot/user input is separated like typicalchats (on left vs. right side, etc.)
-add more advanced responses into chatbot.rive file
-move all js to external file
  -->

</div>
</div>

<img src="images/help.png" class="open-button" onclick="openForm()">
<div class="chat-popup" id="myForm">
	<form class="form-container">
		<h1>Have a question?</h1>

		<label for="msg"><b>We can help!</b></label>
		<div id="textarea">
			<div id="output">Hello! How can I help you today?</div>
		</div>
		<input type="text" placeholder="Type your question here.."
			id="user_input">
		<button id="submit" class="btn">Send</button>
		<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
	</form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/rivescript@latest/dist/rivescript.min.js"></script>

<script>

//CHATBOT FUNCTIONS - https://github.com/aichaos/rivescript-js
function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}

let bot = new RiveScript();
bot.loadFile("chatbot.rive").then(loading_done).catch(loading_error);

function loading_done() {
	  console.log("Bot has finished loading!");

	  bot.sortReplies();
	}
function loading_error(error, filename, lineno) {
	  console.log("Error when loading files: " + error);
	}

function chatbotReady(){
	console.log("chatbot ready");

}

function chatbotError() {
	console.log("chatbot error");
}


let button = $("#submit");
let user_input = $("#user_input");
let output = $("#output");

button.click(chat);

function chat(e) {
	e.preventDefault();
	let input = user_input.val();
	output.append("Me: " + input);
	let username = "JSFR Support: ";
	let reply = bot.reply(username, input).then(function(reply) {
	    output.append(username + reply);
	  }); 

}

//HOW IT WORKS PAGE ELEMENTS
document.addEventListener("DOMContentLoaded", function(){
	console.log("Loaded DOM");
	$("#howItCard2").css("visibility", "hidden");
	$("#howItCard3").css("visibility", "hidden");
});

$("#howItBtn1").click(function(){
	$("#howItCard2").css("visibility", "visible");
});
$("#howItBtn2").click(function(){
	$("#howItCard3").css("visibility", "visible");
});

//  TO LOAD CALENDAR ON PRIVATE HOME DASHBOARD - https://fullcalendar.io/
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');

	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins : [ 'dayGrid', 'interaction' ],
		aspectRatio: 2,
	});
	calendar.render();
});

//FORGOT PASSWORD
document.addEventListener("DOMContentLoaded", function() {
	$("#pwReset").css("display", "none");
});

$("#resetBtn").click(function() {
	$("#pwReset").css("display", "flex");
});

</script>


<footer>
	<div id="footerContainer">
		<div id="footerLogo">
			<h1>JSFR</h1>
			<h6>&copy; 2020 JSFR DEMO SITE. INTENDED ONLY AS DEMONSTRATION.</h6>
		</div>
		<div id="footerLinks">
			<h5>
				<a href="AboutUs.jsp">ABOUT US</a> | <a href="Careers.jsp">CAREERS</a>
				| <a href="Contact.jsp">CONTACT</a>
			</h5>
		</div>
	</div>

</footer>
</body>
</html>