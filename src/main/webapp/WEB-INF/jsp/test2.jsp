<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<h2>Cities</h2>
<table>
	<thead>
		<tr>
			<th>#</th>
			<th>name</th>
			<th>country</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${cities}" var="city" >
		<tr>
			<td>${city.id}</td>
			 <td>${city.name }</td>
			<td>${city.country }</td> 
		</tr>
	</c:forEach>
	</tbody>
</table>

