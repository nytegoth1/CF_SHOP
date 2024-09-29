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

<cfinclude  template="header.cfm">

<cfif NOT structKeyExists(cookie, "user")>
    <!--- Redirect to login page if not authenticated --->
    <cflocation url="login.cfm">
</cfif>
<cfset cartService = createObject("component", "Cart")>

<cfif structKeyExists(cookie, "user")>
        <cfquery name="userQuery" datasource="cfshopping_cart">
            SELECT user_id FROM users
            WHERE username = <cfqueryparam value="#cookie.user#" cfsqltype="cf_sql_varchar">
        </cfquery>
<!--- <cfdump var="#userQuery.user_id#"> --->
<cfset userId = userQuery.user_id> <!-- Replace with logged-in user ID -->
</cfif>

<cfset cartItems = cartService.getCartItems(userQuery.user_id)>

<cfoutput>
 <div class="container">
    <h1>Shopping Cart    <cfset total = 0>
<cfloop query="cartItems">
    <cfset total = total + (price * quantity)>
</cfloop>

<cfif total eq 0>
</br> <h2>Your cart is empty</h2>
<cfelse>
Total: $ #total#
</cfif></h1>
    <p><a href="index.cfm">HOME</a></p>


        <cfloop query="cartItems">
<form action="Cart.cfc?method=updateProducts" method="post">
         <table class="table table-hover table-cart">
  <thead>
    <tr>
      <th><img src="#cartItems.productimage#" class="img-thumbnail rounded float-start" alt="...">
      <input type="hidden" name="product_id" id="product_id" value="#cartItems.product_id#">
      <input type="hidden" name="userId" id="userId" value="#userQuery.user_id#">
      </th>
      <th>Price: $#cartItems.price#</th>
      <th><span>Quantity: <input type="text" class="" id="inputGroupFile01" value="#cartItems.quantity#" size="1" name="quantity"> <div class="spinner-border text-light visually-hidden" role="status">
  <span class="visually-hidden">Loading...</span></div> </span></th>
      <th><button type="submit" class="btn btn-primary">Update</button></th>
    </tr>
  </thead>
  <tbody class="cart-items">
    
     
  </tbody>
</table>
</form> 
        </cfloop>
    </div>

<!---  <cfinclude  template="footer.cfm">    --->
</cfoutput>
<!---  <cfdump var="#userQuery.user_id#"> --->

</body>
</html>




