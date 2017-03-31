<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="./AddThread" method="post">
<input type="text" name="tname" placeholder="Thread Name"/>
<textarea rows="3" cols="21" name="description" placeholder="Description of thread"></textarea>
<textarea rows="3" cols="21" name="tag" placeholder="Add some tags that are relevant to this thread (comma separated)"></textarea>
<input type="submit" placeholder="Add Thread" value="Add Thread"/>
</form>
</body>
</html>