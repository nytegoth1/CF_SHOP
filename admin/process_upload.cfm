
<cfset filePath = 'http://' & CGI.HTTP_HOST & '/CF_SHOP/admin/uploads/' & CFFILE.SERVERFILE>

    <cfquery name="insertImage" datasource="cfshopping_cart">
        INSERT INTO products (productimage, name, description, price, stock, featured, sale_price, onsale, category)
        VALUES (<cfqueryparam value="#filePath#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#description#" cfsqltype="cf_sql_longvarchar">,
                <cfqueryparam value="#price#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#stock#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#featured#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#sale_price#" cfsqltype="cf_sql_decimal">,
                <cfqueryparam value="#onsale#" cfsqltype="cf_sql_tinyint">,
                <cfqueryparam value="#category#" cfsqltype="cf_sql_varchar">
                )
    </cfquery>

