<cfset cartService = createObject("component", "Cart")>

<cfif structKeyExists(cookie, "user")>
        <cfquery name="userQuery" datasource="cfshopping_cart">
            SELECT user_id FROM users
            WHERE username = <cfqueryparam value="#cookie.user#" cfsqltype="cf_sql_varchar">
        </cfquery>

<cfset userId = userQuery.user_id>

<cfset cartItems = cartService.getCartTotals(userQuery.user_id)>
</cfif>
<cfif structKeyExists(form, "name")>
<cfset name = form.name>
<cfset searchService = createObject("component", "Product")>

<cfset searchItems = searchService.getSearchItems(name)>
</cfif>

<cfoutput>

<nav class="navbar navbar-expand-md sticky-top">
<div class="container-fluid">
  <a class="navbar-brand" href="http://#CGI.HTTP_HOST#/CF_SHOP-main/">WebSiteName</a>
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="##navb" aria-expanded="true">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div id="navb" class="navbar-collapse collapse hide">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="http://#CGI.HTTP_HOST#/CF_SHOP-main/">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="">Women</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="">Men</a>
      </li>
    </ul>

    <ul class="nav navbar-nav ml-auto">
      <li class="nav-item">
        <cfif NOT structKeyExists(cookie, "user")><a class="nav-link" href="register.cfm"><span class="fas fa-user"></span> Sign Up</a></cfif>
      </li>
      <li class="nav-item">
      <cfif structKeyExists(cookie, "user")>
        <a class="nav-link" href="logout.cfm"><span class="fas fa-sign-in-alt"></span> Logout</a>
    <cfelse>
        <a class="nav-link" href="login.cfm"><span class="fas fa-sign-in-alt"></span> Login</a>
        </cfif>
      </li>
    </ul>
    <div class="welcome"><cfif NOT structKeyExists(cookie, "user")>
    Welcome back, Guest!
    <cfelse>
    Welcome back, #cookie.user#!

</cfif></div>
      <div class="nav-item d-flex margleft">
        <cfif structKeyExists(cookie, "user")> <a class="nav-link" href="cart.cfm"><span class="fas fa-shopping-cart"></span> View Cart</a> <cfif cartItems.TotalItemsOrdered GT 0>( #cartItems.TotalItemsOrdered# )</cfif></cfif>
      </div>
    <form action="results.cfm" method="post">
    <div class="row">
  <div class="input-group">
    <input type="text" name="name" id="name" class="form-control" placeholder="Search products..." required>
    <div class="input-group-append">
      <button type="submit" class="searchbutton" type="button">
        <i class="fa fa-search"></i>
      </button>
    </div>
  </div>
  </div>
</form>
  </div>
  </div>
</nav>

</cfoutput>
