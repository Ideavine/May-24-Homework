require 'sinatra'
require 'sinatra/activerecord'

configure(:development){set :database, "sqlite3:test.sqlite3"}

require './models'

get '/' do
	"Welcome to my site"
	erb :home
end

post '/sign-up' do
     @user = User.create(params[:user])
end

#The following code *should* take the info entered in the form on home.erb and creat a user record in the database that can be used to sign in/out (create a session).
post '/sign-in' do
     @user = User.where(username: params[:username]).first
	if @user.password == params[:password]
       redirect “/”
     else
       redirect “/login-failed”
   end
end

post '/posts/new' do
	@post = Post.new(params[:post])
end

post '/posts' do
@post = Post.new(title: params[:title], text: params[:text])
end



# def current_user
#      if session[:user_id]
#        @current_user = User.find(session[:user_id)
#      end







