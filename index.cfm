<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
        <meta charset="UTF-8">
    <link href="vendor/font-awsome2/css/all.min.css" rel="stylesheet">
    <link href="vendor/font-awsome2/css/solid.min.css" rel="stylesheet">
    <link href="vendor/font-awsome2/css/solid.min.css" rel="stylesheet">
    
    <link href="style/style.css" rel="stylesheet">
<!---     <script src="https://cdn.tailwindcss.com"></script> --->
      <script>
    // tailwind.config = {
    //   prefix: "tw-",
    //   corePlugins: {
    //      preflight: false,
    //   }
    // }
  </script>
    <!-- Bootstrap CSS-->	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
      <cfinclude template="./style/style.css" />
    </style>
</head>
<body>

<cfset FeaturedproductService = createObject("component", "Product")>
<cfset Featuredproducts = FeaturedproductService.getFeatProducts()>

<cfset productService = createObject("component", "Product")>
<cfset products = productService.getProducts()>

<cfoutput>
<cfinclude  template="header.cfm">

<cfif Featuredproducts.featured gt 0>
<div class="container featuredb"><h4>Featured Products</h4></div>
</cfif>




<cfif structKeyExists(cookie, "user")>
        <cfquery name="userQuery" datasource="cfshopping_cart">
            SELECT user_id FROM users
            WHERE username = <cfqueryparam value="#cookie.user#" cfsqltype="cf_sql_varchar">
        </cfquery>
<!--- <cfdump var="#userQuery.user_id#"> --->
<cfset userId = userQuery.user_id> <!-- Replace with logged-in user ID -->
</cfif>

<cfif Featuredproducts.featured gt 0>
<div class="featured">
<div class="container">
<!---  background: url(#productimage#) no-repeat; --->
<div class="flex-containerx"> 
<cfloop query="Featuredproducts">

<form action="product.cfm" method="post">

 
  <div class="row">
    <div class="col-sm">

<div class="card product_item" style="width: 18rem;">

<cfif onsale gt 0>
      <div class="product_sale">
        <p>On Sale</p>
      </div>
</cfif>

<img class="card-img-top" src="#productimage#" alt="Card image cap">

<input type="hidden" name="productId" value="#product_id#">
  <div class="card-body">
    <h5 class="card-title">#name#</h5>
          <cfif onsale gt 0>
      <span class="spantxt">Sale Price: $#sale_price#     was <strike>$#price#</strike> </span>
        <cfelse>
      <span class="spantxt">Price: $#price#</span>
      </cfif>
    <p class="card-text">#description#</p>
    <button type="submit" class="btn btn-warning btn-lg btn-block">View Product</button>
  </div>
</div>
      




    </div>
  </div>






</form>
</cfloop>
</div>
</div>
</div>
</cfif>
<hr class="solid">

<cfif products.RecordCount() gt 0>

<div class="container-fluidx">
<div class="flex-container">
    <cfloop query="products">
        
            <div class="row">
              <div class="col-sm">
                <!--- <form action="add_to_cart.cfc?method=addToCart" method="post"> --->
                <form action="product.cfm" method="post">
<!---                 #category# --->
                    <div class="card product_item" style="width: 18rem;">
                        <cfif onsale gt 0>
                            <div class="product_sale">
                              <p>On Sale</p>
                            </div>
                          </cfif>
                        <img class="card-img-top" src="#productimage#" alt="Card image cap">
                            <input type="hidden" name="productId" value="#products.product_id#">
                                <div class="card-body">
                                    <h5 class="card-title">#name#</h5>
                                    <cfif onsale gt 0>
                                        <span class="spantxt">Sale Price: $#sale_price#     was
                                            <strike>$#price#</strike>
                                        </span>
                                    <cfelse>
                                        <span class="spantxt">Price: $#price#</span>
                                    </cfif>
                                    <p class="card-text">#description#</p>
                                    <p class="card-text">
                                        <cfif structKeyExists(cookie, "user")>
                                            <input type="hidden" name="userId" id="userId" value="#userId#">
                                            </cfif>
                                        </p>
                                        <button type="submit" class="btn btn-warning btn-lg btn-block">View Product</button>
                                    </div>
                                </div>
                              </div>
                              </div>
                            
                        </form>
                    
                </cfloop>
                </div>
            </div>

          <cfelse>
          #products.RecordCount()# Products
</cfif>
<!--- <cfinclude  template="footer.cfm"> --->

</cfoutput>

</body>
</html>