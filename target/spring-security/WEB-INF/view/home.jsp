<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    
    <head>
        <title>Home Page</title>
    </head>
    
    <body>
        <h2>Home Page!</h2>
        <hr>
        <p>
        Welcome to home page !!!
        </p>
        
        <hr>
        
        <!-- display username and role -->
        <p>
            User : <security:authentication property="principal.username" />
            <br><br>
            Role (s) : <security:authentication property="principal.authorities" />
        </p>
        
        
        <security:authorize access="hasRole('MANAGER')">
            <!-- add link to point to /leaders ... only for mangers -->
            <p>
                <a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
                (only for Managers ..)
            </p>
        </security:authorize>        
        
        <security:authorize access="hasRole('ADMIN')">
            <!-- add a link to point to systems .. this is for admins only -->
            <p>
                <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
                (only for Admins)
            </p>
        </security:authorize>
        
        <hr>
        
        <!-- add logout button -->
        <form:form action="${pageContext.request.contextPath}/logout"
                   method="POST">
            
            <input type="submit" value="Logout" />
            
        </form:form>
    </body>
    
</html>
