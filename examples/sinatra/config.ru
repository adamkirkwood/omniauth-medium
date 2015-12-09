require 'dotenv'
Dotenv.load

require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'omniauth'
require 'omniauth-medium'

get '/' do
  <<-HTML
  	<div>
  		Your credentials are :
  		<ul>
  			<li>client id : #{ENV['MEDIUM_CLIENT_ID']}</li>
  			<li>secret key : #{ENV['MEDIUM_CLIENT_SECRET']}</li>
  		</ul>
  	</div>
    <a href='/auth/medium'>Sign in with Medium</a>
  HTML
end

get '/auth/:provider/callback' do
  content_type 'text/plain'
  request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
end

get '/auth/failure' do
  content_type 'text/plain'
  request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
end

use Rack::Session::Cookie, secret: ENV['RACK_COOKIE_SECRET']

use OmniAuth::Builder do
  provider :medium, ENV['MEDIUM_CLIENT_ID'], ENV['MEDIUM_CLIENT_SECRET'], scope: 'basicProfile,listPublications'
end
