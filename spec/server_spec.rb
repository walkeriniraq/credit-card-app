require 'spec_helper'

describe 'Server' do
  it 'should serve up the spec runner at /test' do
    get '/test'
    last_response.should be_ok
    last_response.body.should include "<title>Jasmine Spec Runner</title>"
    #ap last_response, :raw => true
  end

  it 'should serve up the demo at /demo' do
    get '/demo'
    last_response.should be_ok
  end

  it 'should return compiled coffeescript when javascript is requested' do
    get '/lib/cc_application.js'
    last_response.should be_ok
  end
end