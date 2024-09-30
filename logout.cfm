<!--- Clear cookie data --->
<cfif structKeyExists(cookie, "user")>
        <cfquery name="setLogin" datasource="cfshopping_cart">
            UPDATE users
                SET is_logged_in = 0
            WHERE username = <cfqueryparam value="#cookie.user#" cfsqltype="cf_sql_varchar">;
        </cfquery>


<cfcookie name="user" expires="now">


<!--- <cfoutput>You have been logged out. <a href="login.cfm">Login again</a>.</cfoutput> --->
<cflocation url="index.cfm">
</cfif>
