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


<cfinclude  template="header.cfm">


<cfset productId = trim(form.productId)>

<cfset ProductService = createObject("component", "Product")>


<cfset ProductItem = ProductService.getProductById(productId)>

<cfif structKeyExists(cookie, "user")>
        <cfquery name="userQuery" datasource="cfshopping_cart">
            SELECT user_id FROM users
            WHERE username = <cfqueryparam value="#cookie.user#" cfsqltype="cf_sql_varchar">
        </cfquery>
<!--- <cfdump var="#userQuery.user_id#"> --->
<cfset userId = userQuery.user_id> <!-- Replace with logged-in user ID -->
</cfif>

<cfoutput query="ProductItem">

<!--- <cfdump  var="#CGI.HTTP_REFERER#"> --->



<form action="add_to_cart.cfc?method=addToCart" method="post">
<div class="container-fluid">
  <div class="row">
    <div class="col-sm">
      <div><img class="card-img-top" src="#productimage#" alt="Card image cap"></div>
    </div>
    <div class="col-sm">
      <h5 class="card-title">#name#</h5>
    </div>
    <div class="col-sm">
      <h5 class="card-title">#description#</h5>
      <cfif onsale gt 0>
      <span>Sale Price: $#sale_price#     was <strike>$#price#</strike> </span>
        <cfelse>
      <span>Price: $#price#</span>
      </cfif>

      <hr class="solid">
      <input type="hidden" name="productId" value="#product_id#">
      <cfif structKeyExists(cookie, "user")>
            <input type="hidden" name="userId" id="userId" value="#userId#">
    </cfif>
      <span><input class="p-inputtext form-contrrol" type="number" name="quantity" value="1" min="1"></span>
      <span><button type="submit" class="btn btn-warning btn-lg btn-block">Add to Cart</button></span>
    </div>
  </div>
</div>
</form>  

  
<!--- <cfinclude  template="footer.cfm"> --->
</cfoutput>




</body>
</html>