<cfcomponent>

    <cffunction name="registerUser" access="public" returntype="boolean">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        
        <cfset var success = false>
    <cftry>
        <cfquery datasource="cfshopping_cart">
            INSERT INTO users (username, password, email)
            VALUES (
                <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#hash(arguments.password, 'sha256')#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
    <cfcatch type="database">
        <cfrethrow>
    </cfcatch>
    </cftry>
        
        <cfset success = true>
        <cfreturn success>
    </cffunction>

    <cffunction name="authenticateUser" access="public" returntype="boolean">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        
        <cfset var isAuthenticated = false>
    <cftry>
        <cfquery name="userQuery" datasource="cfshopping_cart">
            SELECT user_id FROM users
            WHERE username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
              AND password = <cfqueryparam value="#hash(arguments.password, 'sha256')#" cfsqltype="cf_sql_varchar">
        </cfquery>
    <cfcatch type="database">
        <cfrethrow>
    </cfcatch>
    </cftry>

    <cftry>
        <cfquery name="setLogin" datasource="cfshopping_cart">
            UPDATE users
                SET is_logged_in = 1
            WHERE username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">;
        </cfquery>
    <cfcatch type="database">
        <cfrethrow>
    </cfcatch>
    </cftry>
        
        <cfif userQuery.recordCount GT 0>
            <cfset isAuthenticated = true>
        </cfif>
        
        <cfreturn isAuthenticated>

    </cffunction>

</cfcomponent>