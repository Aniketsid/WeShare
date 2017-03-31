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
<form class="form-label-left" action="./AddTopic" method="post">
<label>Select Thread</label>

 <select name="thread" id="thread" class="form-control"  required>
	 <option value="">Choose a Thread..</option>
	 <jsp:include page="/Threads" />
	 <c:forEach items="${message}" var="item">
	 <option value="${item.Threadid}">${item.Threadname}</option>
	  </c:forEach>
 </select>

<a href="addThread.jsp">Add a new thread</a></br>
 <label>Description</label>
<textarea rows="4" cols="50" name="description" placeholder="please enter the topic here" required></textarea></br>
<input type="submit" class="btn btn-primary" value="Post topic"/>


</form>


</body>
</html>