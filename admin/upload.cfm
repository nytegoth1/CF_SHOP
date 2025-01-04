<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
        <meta charset="UTF-8">
    <!-- Bootstrap CSS-->	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
    li {
    list-style-type: none;
    }

        .p-inputtext {
        padding: 10px;
        border: 1px solid #cbd5e1;
        border-radius: 4px;
        color: #334155;
        margin-left: 4px;
        margin-bottom: 4px;
        margin-top: 28px;
        /*width: -webkit-fill-available;*/

    }


    .p-inputtext:enabled:hover {
    border-color: #94a3b8;
}

    .rounded-lg {
        width: 150px;
    }

    .section {
        width: 800px;
       margin: 0 auto;
    }


    .section {
        position: relative;
        padding-top: 1rem;
        padding-bottom: 1rem;
    }

    .welcome {
        margin-left: 22rem;
    }

    .row {
        float: left;
        margin-left: 24px;
    }

    .flex-container {
  /*display: flex;*/
      display: inline-block;
}

.flex-container > div {
  margin: 10px;
  padding: 20px;
  font-size: 30px;
}
    </style>
</head>


<cfset uploadDir = expandPath('./uploads/')>
<cfif isDefined("Form.FileContents") > 

<cfset category = trim(form.category)>
<cfset description = trim(form.description)>
<cfset name = trim(form.name)>
<cfset price = trim(form.price)>
<cfset stock = trim(form.stock)>
<cfset sale_price = trim(form.sale_price)>
<cfset onsale = trim(form.onsale)>
<cfset featured = trim(form.featured)>
<cffile action = "upload" 
fileField = "FileContents" 
destination = "#uploadDir#" 
accept = "image/png, image/gif, image/jpg, image/jpeg" 
nameConflict = "MakeUnique"> 
<cfelse> 


<div class="container">
<p></p>
<div class="row">
<form method="post" action=<cfoutput>#cgi.script_name#</cfoutput>
name="uploadForm" enctype="multipart/form-data"> 
<input name="FileContents" type="file" id="image"> 
<p></p>



<div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">Category: men / women</span>
  <input name="category" id="category" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>

<div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">Product Name</span>
  <input name="name" id="name" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>

<div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">Product Price</span>
  <input name="price" id="price" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>

<div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">Product is on Sale</span>
  <input name="onsale" id="onsale" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>

<div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">Product Sale Price</span>
  <input name="sale_price" id="sale_price" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>

<div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">Product stock quantity</span>
  <input name="stock" id="stock" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>

<div class="input-group">
  <span class="input-group-text">Description</span>
<textarea id="description" name="description" rows="4" cols="50"></textarea>
</div>
<br>
<div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">Product is Featured</span>
  <input name="featured" id="featured" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>

<br><br>

<input name="submit" type="submit" value="Upload File"> 
</form>
</div>
</div>
</cfif>

<cfif cgi.request_method EQ "post">
    <cfdump var="#form#">
    <cfinclude  template="process_upload.cfm">
    <cflocation url="index.cfm">
</cfif>
