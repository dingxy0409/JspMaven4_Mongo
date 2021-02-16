<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,org.bson.Document"%>
<%@ page import="com.mongodb.MongoClient,com.mongodb.client.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
//read the data from index form
String name = request.getParameter("pname");
double cost = Double.parseDouble(request.getParameter("pcost"));
String desc= request.getParameter("pdesc");

//connect MongoDB,database,collection,document
MongoClient mongo = new MongoClient( "localhost" , 27017 ); 
MongoDatabase database = mongo.getDatabase("Mongo3_productdb"); 
MongoCollection<Document> collection = database.getCollection("products"); 

//this case is for insert new document to collection, so need create new Document
Document document = new Document("name", name)
.append("cost", cost)
.append("desc", desc);

//Inserting document into the collection
collection.insertOne(document);
out.println("Document inserted successfully");




%>
</body>
</html>