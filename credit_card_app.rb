require 'sinatra/base'
require 'coffee-script'

class CreditCardApp < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/static'

  get '/test' do
    send_file File.join(settings.public_folder, 'test-runner.html')
  end

  get '/demo' do
    send_file File.join(settings.public_folder, 'demo.html')
  end

  get '/lib/:filename.js' do
    CoffeeScript.compile File.read(File.join("lib", params[:filename] + ".coffee"))
  end
end