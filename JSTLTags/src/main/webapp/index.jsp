<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        h2 {
            color: #333;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #666;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Hello World!</h2>

    <c:set var="userName" value="Shivam" />
    Welcome, <c:out value="${userName}" /><br>

    <c:remove var="userName" />
    <c:out value="Remove value is ${userName}" /><br>

    <c:if test="${empty userName}">
        <p>Variable 'userName' is no longer defined.</p>
    </c:if>

    <c:forEach var="number" begin="1" end="5">
        <p>Number: <c:out value="${number}" /></p>
    </c:forEach>

    <c:choose>
        <c:when test="${4%2 eq 0}">
            <p>Even</p>
        </c:when>
        <c:otherwise>
            <p>Odd</p>
        </c:otherwise>
    </c:choose>

    <%-- Function Tag --%>
    <h4>Functions Tag</h4>
    <c:set var="name" value="Shivam Chauhan"/>
    <h5>Length of <c:out value="${name}"/> is: <c:out value="${fn:length(name)}"/></h5>
    <h5><c:out value="${name}"/> in lower: <c:out value="${fn:toLowerCase(name)}"/></h5>

    <h3 style="text-align: center;">Input for Format tag</h3>

    <!-- Formatting Tag -->
    <form action="format.jsp" method="post">
        <label for="number">Number:</label>
        <input type="number" id="number" name="number" required><br><br>

        <label for="date">Date:</label>
        <input type="date" id="dob" name="dob" required><br><br>

        <input type="submit" value="Submit">
    </form>

    <!--JSTL XML Tags - for accessing Xml file-->
        <h1>JSTL XML Tags -----  </h1>
        <c:import url="citizen.xml" var="inputXml"></c:import>
        <x:parse var="parsed" xml="${inputXml}"/>
        <table border="1">
         <tr>
         <th>Id</th>
         <th>First Name</th>
         <th>Last Name</th>
         <th>Role</th>
         <th>salary</th>
         </tr>
            <x:forEach var="citizen" select="$parsed/citizens/citizen">
                <tr>
              <td><x:out select="id" /></td>
              <td><x:out select="firstname" /></td>
              <td><x:out select="lastname" /></td>
              <td><x:out select="role" /></td>
              <td><x:out select="salary"/></td>
              </tr>
           </x:forEach>
          </table>
          <br>
          <br>
          <br>
           <!--JSTL SQL Tags - for accessing Xml file-->
               <h1>JSTL SQL Tags -----  </h1>
               <sql:setDataSource var="myDs" driver="org.h2.Driver"
                       url="jdbc:h2:file:~/emp" user="atul" password="" />
               <sql:query dataSource="${myDs}" var="employees">
                       SELECT * from emp;
                   </sql:query>
               <table border="1">
                               <tr>
                                    <th>EmpId</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Address</th>
                                    <th>City</th>
                                    <th>Pincode</th>

                                 </tr>
                       <c:forEach var="row" items="${employees.rows}">
                           <tr>
                               <td><c:out value="${row.empId}" /></td>
                               <td><c:out value="${row.first_name}" /></td>
                               <td><c:out value="${row.last_name}" /></td>
                               <td><c:out value="${row.address}" /></td>
                               <td><c:out value="${row.city}" /></td>
                               <td><c:out value="${row.pincode}" /></td>
                           </tr>
                       </c:forEach>

</body>
</html>
