<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,org.bson.Document" %>
<%@ page import="com.mongodb.MongoClient,com.mongodb.client.*,com.mongodb.client.model.Filters" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
MongoClient mongo = new MongoClient( "localhost" , 27017 ); 
MongoDatabase database = mongo.getDatabase("Mongo3_productdb"); 
MongoCollection<Document> collection = database.getCollection("products"); 

collection.deleteOne(Filters.eq("name", name)); 
response.sendRedirect("list.jsp");
%>
</body>
</html>