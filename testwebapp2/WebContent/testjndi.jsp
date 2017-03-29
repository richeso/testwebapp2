<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/persondb">
select * from Person
</sql:query>

<html>
  <head>
    <title>DB Test</title>
  </head>
  <body>

<h2>Jndi test results -  select * from Person</h2>

<table border="1">
<tr align="left">
<th>Id</th>
<th>Name</th>
<th>Surname</th>
<th>Address</th>
</tr>
<c:forEach var="row" items="${rs.rows}">
	<tr align="left">
    <td>${row.id} </td> 
    <td>${row.name}</td>
    <td>${row.surname}</td>
    <td>${row.address}</td>
    </tr>
</c:forEach>
</table>

  </body>
</html>