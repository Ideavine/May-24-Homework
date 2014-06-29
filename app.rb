require 'sinatra'
require 'sinatra/activerecord'

configure(:development){set :database, "sqlite3:test.sqlite3"}

require './models'

get '/' do
	"Welcome to my site"
	erb :home
end

# post '/sign-up' do
#      puts “my params are” + params.inspect
# end

post '/sign-up' do
     @user = User.where(username: params[:username]).first
     if @user.password == params[:password]
       redirect “/”
     else
       redirect “/login-failed”
   end
end







