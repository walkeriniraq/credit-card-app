credit-card-app
===============
This is just a small application I've put together to test javascript TDD using jasmine and coffeescript. There is a
small sinatra application mostly existing to automatically compile my coffeescript into javascript.

Since "application" has two meanings in this case, I'm calling the credit card application object a "form"

I'm using rspec to test the server script and jasmine to test the javascript app. The app is constructed using
Ember, a fairly new MVC framework that runs on jquery and uses "handlebars" for templating.

Instructions
============
Run bundle install

Test the server with "rspec spec"

Run the server with "ruby server.rb" or "jruby server.rb" (only tested with jruby)

Run the [jasmine tests](http://localhost:4567/test)

Run the [demo](http://localhost:4567/demo)

Useful stuff & Links
====================
[Javascript frameworks list](http://codebrief.com/2012/01/the-top-10-javascript-mvc-frameworks-reviewed/)
[Ember js objects](http://www.cerebris.com/blog/2012/03/06/understanding-ember-object/)
[Jasmine testing ajax](http://damaneice.blogspot.com/2011/11/using-jasmine-to-test-jquery-ajax.html)
[Testing ember views](http://shairez.com/2012/07/ember-js-tdd-how-to-test-your-ember-views/)