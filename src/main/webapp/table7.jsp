<%@page import="util.Alpha"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>table6.jsp</title>
<style type="text/css">
table {
  	font-family: monospace;
	font-size: 3em;
	border-collapse: collapse;
}
</style>
<script type="text/javascript">

class Blink {
	tid = [];
	
	constructor(ch) {
		console.log("생성자 호출..." + Math.random())
	}
	
	run() {
		console.log("run..." + Math.random())
		
		let table = document.querySelector('table')
		for (let tr of table.rows) {
			for (let td of tr.cells) {
				if (td.innerHTML=='A') {
					let id = setInterval(function() {
						if (td.style.visibility=='hidden')
							td.style.visibility = 'visible'
						else
							td.style.visibility = 'hidden'
					}, Math.random()*500 + 10);
					
					this.tid.push(id)
				}
			}			
		}
		
	}
	
	clear() {
		console.log("clear..." + Math.random())
		console.log(this.tid)
		
		for (let id of this.tid)
			clearInterval(id)
	}
	
}


window.onload = function() {
	let start = document.querySelectorAll('button')[0]
	let stop  = document.querySelectorAll('button')[1]
	
	start.disabled = false;
	stop.disabled = true;
	
	let blink;
	
	start.onclick = function() {
		start.disabled = true;
		stop.disabled = false;
		
		blink = new Blink();
		blink.run();
		
		console.log("start..." + Math.random())
	}
	
	stop.onclick = function() {
		start.disabled = false;
		stop.disabled = true;
		
		blink.clear();
		
		console.log("stop..." + Math.random())
	}
	
}

</script>
<script type="text/javascript">
</script>
</head>
<body>
<h1>Table Tag 연습</h1>
<button>start</button>
<select>
	<option>A</option>
</select>
<button>stop</button>
<hr>
<table>
	<tbody>
	<%-- 이것은 JSP 주석입니다. --%>
	<%
		for (var i=0; i<20; i++) {
	%>
	<tr>
		<% 
			for (var j=0; j<40; j++) {
				var a = new Alpha();
		%>
		<td style="color: <%=a.getFg()%>; background: <%=a.getBg()%>" ><%=a.getCh()%></td>
		<%
			}
		%>
	</tr>
	<%
		}
	%>
	</tbody>
</table>

</body>
</html>