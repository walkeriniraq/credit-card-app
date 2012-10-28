credit-card-app
===============
This is just a small application I've put together to test javascript TDD using jasmine and coffeescript. There is a
small sinatra application mostly existing to automatically compile my coffeescript into javascript.

Since "application" has two meanings in this case, I'm calling the credit card application object a "form"

I'm using rspec to test the server script and jasmine to test the javascript app. The app is constructed using
Ember, a fairly new MVC framework that runs on jquery and uses "handlebars" for templating.

Notes - 10/28/2012
------------------
Ember turned out to be way overkill for this project. Most of what was done could have been done with jQuery and
simple coffeescript, and Ember added complexity that really wasn't needed. I was hoping that it would be
"rails simple" but it really didn't seem to be. (or I don't remember how complex rails was then I started)

Instructions
============
Run bundle install

Test the server with "rspec spec"

Run the server with "ruby server.rb" or "jruby server.rb" (only tested with jruby)

Run the [jasmine tests](http://localhost:4567/test)

Run the [demo](http://localhost:4567/demo)

Included code
=============
* [Jasny-bootstrap 2.1.1-j2](http://jasny.github.com/bootstrap/index.html)
* [jQuery 1.8.1](http://jquery.com/)
* [Ember JS 1.0.0-PRE.2](http://emberjs.com/)
* [Datepicker for bootstrap](http://www.eyecon.ro/bootstrap-datepicker/)
* [Jasmine 1.2.0](http://pivotal.github.com/jasmine/)
* [Handlebars 1.0rc1](http://handlebarsjs.com/)

Ruby Gems
---------
* [Sinatra](http://www.sinatrarb.com/)
* [Coffee-Script](https://github.com/josh/ruby-coffee-script)
* [RSpec](http://rspec.info/)
* [awesome-print](https://github.com/michaeldv/awesome_print)

Useful stuff & Links
====================
[Javascript frameworks list](http://codebrief.com/2012/01/the-top-10-javascript-mvc-frameworks-reviewed/)
[Jasmine testing ajax](http://damaneice.blogspot.com/2011/11/using-jasmine-to-test-jquery-ajax.html)
[Ember js objects](http://www.cerebris.com/blog/2012/03/06/understanding-ember-object/)
[Testing ember views](http://shairez.com/2012/07/ember-js-tdd-how-to-test-your-ember-views/)