require File.join(File.dirname(__FILE__), '..', 'credit_card_app.rb')

require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'rspec'
require 'awesome_print'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

RSpec.configure do |config|
  config.include Rack::Test::Methods

end

def app
  CreditCardApp
end
