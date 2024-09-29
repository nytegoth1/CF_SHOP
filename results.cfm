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

<cfoutput>
<cfif NOT isDefined('name')>

<cflocation url="index.cfm">

</cfif>
</cfoutput>


<cfset name = trim(name)>
<cfset searchService = createObject("component", "Product")>

<cfset searchItems = searchService.getSearchItems(name)>

<cfif searchItems.getRecordCount() eq 0>
    <div class="container">
        <div style="width:180px; margin:0 auto; margin-top:40px;">No Results Found</div>
    </div>
</cfif>

<cfoutput>
<!--- #searchItems.getRecordCount()# --->
 
<cfloop query="searchItems">
<div class="container-fluid">
<div class="flex-container">     
<div class="row">


<form action="product.cfm" method="post">
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
      <p class="card-text">

       </p>
      <button type="submit" class="btn btn-warning btn-lg btn-block">View Product</button>
   </div>
</div>
</div>
</form>

</div>
</div>
</div>

</cfloop>


<!--- <cfinclude  template="footer.cfm"> --->
</cfoutput>


</body>
</html>