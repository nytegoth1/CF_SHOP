<cfcomponent>

    <cffunction name="registerUser" access="remote" returntype="boolean">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        
        <cfset var success = false>
        <cfquery datasource="cfshopping_cart">
            INSERT INTO users (username, password, email)
            VALUES (
                <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#hash(arguments.password, 'sha256')#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        
        <cfset success = true>
        <cfreturn success>
    </cffunction>

    <cffunction name="authenticateUser" access="remote" returntype="boolean">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        
        <cfset var isAuthenticated = false>
        <cfquery name="userQuery" datasource="cfshopping_cart">
            SELECT user_id FROM users
            WHERE username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
              AND password = <cfqueryparam value="#hash(arguments.password, 'sha256')#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfquery name="setLogin" datasource="cfshopping_cart">
            UPDATE users
                SET is_logged_in = 1
            WHERE username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">;
        </cfquery>
        
        <cfif userQuery.recordCount GT 0>
            <cfset isAuthenticated = true>
        </cfif>
        
        <cfreturn isAuthenticated>

        <cfoutput>
        </cfoutput>
    </cffunction>

</cfcomponent>