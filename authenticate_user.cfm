<cfset userService = createObject("component", "User")>
<cfset isAuthenticated = userService.authenticateUser(
    username = form.username,
    password = form.password
)>

<cfif isAuthenticated>
<!---     <cfset session.userId = 1> --->

    <cfset session.username = username> <!-- Replace with actual user ID -->
<!---     <cfdump var="#session#"> --->
<cfcookie name="user" value="#username#" expires="#createTimeSpan( 0, 4, 0, 0 )#" httponly="yes" encodevalue="yes" />
    <p>Login successful. <a href="products.cfm">Shop Now</a></p>
<cfelse>
    <p>Login failed. Please try again.</p
</cfif>