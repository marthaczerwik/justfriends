
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

