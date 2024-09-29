<cfset userService = createObject("component", "User")>
<cfset result = userService.registerUser(
    username = form.username,
    password = form.password,
    email = form.email
)>

<cfif result>
    <p>Registration successful. <a href="login.cfm">Login</a></p>
<cfelse>
    <p>Registration failed. Please try again.</p>
</cfif>
