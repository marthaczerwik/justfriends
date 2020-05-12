<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="Header.jsp"%>

<!-- 
TO DO:
-add valid FAQ and answers
-fix FAQ container so data does not bleed over general container 
when accordion opens, or have only one panel open at a time 
-->


<div id="faqContainer">
	<div id="faqTextContainer">
		<div id="faqText">
		<button class="accordion">Question</button>
		<div class="panel">
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat.</p>
		</div>

		<button class="accordion">Question</button>
		<div class="panel">
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat.</p>
		</div>

		<button class="accordion">Question</button>
		<div class="panel">
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat.</p>
		</div>


</div>
	</div>
		<div id="faqImage">
		<img src="images/faq.jpg">
	</div>
</div>


<script>
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight) {
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		});
	}
</script>
<%@ include file="Footer.jsp"%>
