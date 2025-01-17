<cfcomponent>

    <cffunction name="getProducts" access="public" returntype="query">
    <cftry>
        <cfquery name="productsQuery" datasource="cfshopping_cart">
            SELECT * FROM products
            WHERE featured = "0"
        </cfquery>
     <cfcatch type="database">
        <cfrethrow>
     </cfcatch>
    </cftry>
        <cfreturn productsQuery>
    </cffunction>

    <cffunction name="getProductById" access="public" returntype="query">
        <cfargument name="productId" type="numeric" required="true">
    <cftry>
        <cfquery name="productQuery" datasource="cfshopping_cart">
            SELECT * FROM products
            WHERE product_id = <cfqueryparam value="#arguments.productId#" cfsqltype="cf_sql_integer">
        </cfquery>
    <cfcatch type="database">
        <cfrethrow>
    </cfcatch>
    </cftry>
        <cfreturn productQuery>
    </cffunction>


    <cffunction  name="getSearchItems" access="public" returntype="query">
        <cfargument name="name" type="string" required="true">
    <cftry>
        <cfquery name="ProductSearch" dataSource="cfshopping_cart">
            SELECT * FROM products WHERE (name LIKE '%#name#%' OR description LIKE '%#name#%');
        </cfquery>
    <cfcatch type="database">
        <cfrethrow>
    </cfcatch>
    </cftry>
        <cfreturn ProductSearch>
    </cffunction>


     <cffunction name="getFeatProducts" access="public" returntype="query">
    <cftry>
        <cfquery name="productsQuery" datasource="cfshopping_cart">
            SELECT * FROM products
            WHERE featured = "1"
            LIMIT 4
        </cfquery>
    <cfcatch type="database">
        <cfrethrow>
    </cfcatch>
    </cftry>
        <cfreturn productsQuery>
    </cffunction>

    <!--- Update product Not currently being used--->

    <cffunction name="UpdateProducts" access="public" returntype="query">
    <cftry>
        <cfquery name="updateProds" datasource="cfshopping_cart">
            UPDATE products
            SET stock = <cfqueryparam value="#arguments.stock#" cfsqltype="cf_sql_integer">
            name = <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">
            description = <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_longvarchar">
            price = <cfqueryparam value="#arguments.price#" cfsqltype="cf_sql_decimal">
            productimage = <cfqueryparam value="#arguments.productimage#" cfsqltype="cf_sql_varchar">
            featured = <cfqueryparam value="#arguments.featured#" cfsqltype="cf_sql_tinyint">
            sale_price = <cfqueryparam value="#arguments.sale_price#" cfsqltype="cf_sql_decimal">
            onsale = <cfqueryparam value="#arguments.onsale#" cfsqltype="cf_sql_tinyint">
            WHERE product_id=<cfqueryparam value="#arguments.product_id#" cfsqltype="cf_sql_integer">;
        </cfquery>
    <cfcatch type="database">
        <cfrethrow>
    </cfcatch>
    </cftry>
        <cfreturn updateProds>
    </cffunction>

</cfcomponent>
