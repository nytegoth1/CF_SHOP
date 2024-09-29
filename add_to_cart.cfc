<cfcomponent output="true">

    <cfif NOT structKeyExists(cookie, "user")>
        <!--- Redirect to login page if not authenticated --->
        <cflocation url="login.cfm">
    </cfif>
    <cffunction name="addToCart" access="remote">
        <cfargument name="userId" type="integer" required="true">
        <cfargument name="productId" type="numeric" required="true">
        <cfargument name="quantity" type="numeric" required="true">
        
        <cfset var success = false>
        <cfquery datasource="cfshopping_cart">
            INSERT INTO cart_items (user_id, product_id, quantity)
            VALUES (
                <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.productId#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.quantity#" cfsqltype="cf_sql_integer">
            )
        </cfquery>

                <cfif NOT structKeyExists(cookie, "user")>
        <!--- Redirect to login page if not authenticated --->
        <cflocation url="login.cfm">
        </cfif>
        <cflocation url="index.cfm">
        
        <cfset success = true>
        <cfreturn success>
    </cffunction>

    <cffunction name="getCartItems" access="remote" returntype="query">
        <cfargument name="userId" type="integer" required="true">
        <cfquery name="cartItemsQuery" datasource="cfshopping_cart">
            SELECT p.name, p.price, c.quantity
            FROM cart_items c
            JOIN products p ON c.product_id = p.product_id
            WHERE c.user_id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn cartItemsQuery>
    </cffunction>
</cfcomponent>

