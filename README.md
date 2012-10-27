credit-card-app
===============
This is just a small application I've put together to test javascript TDD using jasmine and coffeescript. There is a
small sinatra application mostly existing to automatically compile my coffeescript into javascript.

Since "application" has two meanings in this case, I'm calling the credit card application object a "form"

Instructions
============
Test the server with "rspec spec"

Run the server with "ruby server.rb" or "jruby server.rb" (only tested with jruby)

Run the [jasmine tests](http://localhost:4567/test)

Run the [demo](http://localhost:4567/demo)

Objects
=======
CC_Application
--------------
* first_name
* last_name
* phone_number
* email_address
* street_address
* birth_date
* ssn
* mother_maiden_name
* income_type
* income
	
US_Address
----------
*	street
*	city
*	state
*	zip
	
Employed_Income
---------------
*	employer_name
*	income_per_year

Student_Income
--------------
*	school_name
*	school_level


Useful stuff & Links
====================
[Javascript frameworks list](http://codebrief.com/2012/01/the-top-10-javascript-mvc-frameworks-reviewed/)
[Ember js objects](http://www.cerebris.com/blog/2012/03/06/understanding-ember-object/)