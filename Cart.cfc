<cfcomponent>

    <cffunction name="addToCart" access="public" returntype="boolean">
        <cfargument name="userId" type="numeric" required="true">
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
        
        <cfset success = true>
        <cfreturn success>
    </cffunction>

    <cffunction name="getCartTotals" access="public" returntype="query">
        <cfargument name="userId" type="numeric" required="true">
        <cfquery name="cartItemsTotalQuery" datasource="cfshopping_cart">
            SELECT SUM(c.quantity) AS TotalItemsOrdered
            FROM cart_items c
            JOIN products p ON c.product_id = p.product_id
            WHERE c.user_id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn cartItemsTotalQuery>
    </cffunction>

    <cffunction name="getCartItems" access="public" returntype="query">
        <cfargument name="userId" type="numeric" required="true">
        <cfquery name="cartItemsQuery" datasource="cfshopping_cart">
            SELECT p.name, p.description, p.onsale, p.price, p.sale_price, p.stock, p.productimage, c.quantity, c.product_id, c.cart_item_id
            FROM cart_items c
            JOIN products p ON c.product_id = p.product_id
            WHERE c.user_id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn cartItemsQuery>
    </cffunction>


    <cffunction name="updateProducts" access="remote">
    <cfargument name="product_id" type="integer" required="no">
    <cfargument name="quantity" type="integer" required="no">

        <cfquery name="cartQuery" datasource="cfshopping_cart">
            SELECT p.name, p.price, p.description, p.price, p.stock, p.productimage, c.quantity, c.product_id, c.cart_item_id
            FROM cart_items c
            JOIN products p ON c.product_id = p.product_id
            WHERE c.user_id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
        </cfquery>

    <cfif quantity eq 0>
        <cfquery name="RemoveFromCart" datasource="cfshopping_cart">
            DELETE FROM cart_items WHERE cart_item_id=<cfqueryparam value="#cartQuery.cart_item_id#" cfsqltype="cf_sql_integer">;
        </cfquery>

    <cfelse>

    <cfquery name="updateCart" datasource="cfshopping_cart">
        UPDATE cart_items
        SET quantity = <cfqueryparam value="#quantity#" cfsqltype="cf_sql_integer">
        WHERE product_id=<cfqueryparam value="#product_id#" cfsqltype="cf_sql_integer">;
    </cfquery>
    </cfif>

    <cfif NOT structKeyExists(cookie, "user")>
        <!--- Redirect to login page if not authenticated --->
        <cflocation url="login.cfm">
        </cfif>
        <cflocation url="cart.cfm">
    </cffunction>
</cfcomponent>
