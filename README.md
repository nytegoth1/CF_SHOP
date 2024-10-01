<h1 align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Adobe_ColdFusion_logo_2021.svg/240px-Adobe_ColdFusion_logo_2021.svg.png" width="80" height="80">
<br>ColdFusion Shop<br></h1>

<h1 align="center">Store/shop created with ColdFusion</h1>
Shop/store built with ColdFusion and mysql.
Currently working on the admin section.

## DISCLAIMER

(This would be an intermediate sample of code, Much of the code I have done in the past is much more advanced.)

This code was created to possibly give someone insight on using ColdFusion, specifically on using components via createObject.
The code in no way should be used in a production enviroment unless further code editing be done.
For the sake of time, I used sha256 encryption, and using cookies to remember user. These properties should be changed if someone would use the code in a Prod enviroment.
Some encrypting suggestions are: Argon2 or Bcrypt, combined with salt.

## INSTALLATION

1. Install ColdFusion Developement version.
2. Istall MySQL
3. In the ColdFusion admin, go to Data & Services
4. Add data source named: cfshopping_cart, select valid driver type: MySql. Edit the created data source, and fill in your MySql info. ![alt text](https://github.com/nytegoth1/CF_SHOP/blob/main/cfadminscreen.jpg?raw=true)
5. Use the provided dumped sql to install.
6. Copy files to a directory in your wwwroot.
7. Navigate to the index, and and click signup.
8. To add single products, navigate to /admin. (Note: I am in the process of making this more robust. For now it is a simple process.)

## NOTES

1. This shop was created to show how to build on online store in ColdFusion.
2. If someone were to implement this code, Using a secure encryption is Highly suggested. 
3. This was built using CF, and mysql. If someone wanted to change the DB type, this can easily be done if you know how to do so.
4. Most of the code was done within a week, and is currently using methods that would need to change if implemented in a production environment.

## Todo

Redo the admin section for adding products, and create an Edit product feature.
Fix some other minor issues.
