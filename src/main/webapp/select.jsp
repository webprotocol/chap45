<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select.jsp</title>
<script type="text/javascript">
window.onload = function() {
	let start = document.querySelectorAll('button')[0];
	let select = document.querySelector('select');
	let stop = document.querySelectorAll('button')[1];
	let h2 = document.querySelector('h2');
	
	start.disabled = false;
	select.disabled = false;
	stop.disabled = true;
	
	start.onclick = function() {
		start.disabled = true;
		select.disabled = true;
		stop.disabled = false;
		
		let alpha = select.options[select.selectedIndex].value
		console.log(alpha)
		
		h2.innerText = alpha + " 선택"
		
	}
	
	stop.onclick = function() {
		start.disabled = false;
		select.disabled = false;
		stop.disabled = true;
		
		h2.innerText = "";
	}
	
}

</script>
</head>
<body>
<h1>select option 태그 연습</h1>
<hr>
<button>start</button>
<select>
	<% 
		for (var i=0; i<26; i++) {
	%>
	<option><%=(char)('A'+i)%></option>
	<%
		}
	%>
</select>
<button>stop</button>
<hr>
<h2></h2>
</body>
</html>