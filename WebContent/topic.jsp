<%@page import="java.util.ArrayList"%>

<%@page import="com.mongodb.BasicDBObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${topic}" var="item">
	 <c:out value="${item.description}"/>
	 <c:out value="${item.creatorid}"/>
	 <c:set var="topicid" scope="session" value="${item.Topicid}"/>
</c:forEach>
<c:forEach items="${comments}" var="item">
	 <c:out value="${item.Description}"/>
	 <c:out value="${item.creatorid}"/>
</c:forEach>


 <form method="get" action="./AddComment">
 <label>Leave your comment</label>
 <input type="hidden" name="id" id = "id" value="${topicid}"/>
 <textarea rows="4" cols="12" placeholder="Add your comment" name="comment" id="comment"></textarea>
 <input type="submit" value="comment" placeholder="Post Comment" id="submit"/>
 </form>

<!-- <script type="text/javascript">
// var x,y,z;
// function sendRequest()
// {
// 	alert("hello");
// 	var a = new XMLHttpRequest();
// 	a.onreadystatechange=function(){
// 		console.log(a.readyState);
// 		if(a.status == 200 && a.readyState == 4){
// 			x = document.getElementById('id').value;
// 			y = document.getElementById('comment').value;
// 			console.log(x);
// 			console.log(y);
		   
// 		}
// 	}
  	 z = './AddComment?id=2&comment=Comment Stub';  
// 	console.log(z);
// 	a.open('GET',z,true);
// 	a.send();
// }
// var el = document.getElementById('submit');
// el.addEventListener('click',sendRequest);
  </script> -->
</body>
</html>