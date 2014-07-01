require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'

# enable :sessions
# use Rack::Flash, :sweep => true
# set :sessions => true

configure(:development){set :database, "sqlite3:test.sqlite3"}

require './models'

get '/' do
	"Welcome to my site"
	erb :home
end

get '/posts' do
	"Create a new post or follow others"
	erb :posts
end

post '/sign-up' do
     @user = User.create(params[:user])
	erb :posts
end

#The following code *should* take the info entered in the form on home.erb and create a user record in the database that can be used to sign in/out (create a session).
#The following code should lookup user/password combos and redirect to posts.erb if successful. 

# %form{action: "/sign_in", method: "POST"}
#   %label Email
#   %input{type: "text", name: "[user]email"}
#   %label Password
#   %input{type: "password", name: "[user]password"}
#   %input{type: "submit", value: "submit"}

post '/sign-in' do
     @user = User.where(username: params[:username])
     #@password = Password.where(password: params[:password])
	#if @user.password == params[:password]
       redirect “/posts”
       erb :posts
  #    else
  #    	redirect "/login-unsuccessful"
  # #      flash[:alert] = "Whammy! Invalid username and/or password"
  # #   if @user.empty?
  # #   flash[:alert] = "Sorry, that user doesn't exist. Feel free to sign up."
  # #   session[:user_id] = @user.first.id
  # #   redirect '/sign_up'
  # # else
  # #   flash[:notice] = "You've successfully signed in."
  # #   redirect '/'
	 #  end
	  end

post '/posts' do
	@post = Post.new(params[:post])
	erb :posts
end

post '/posts/follow' do
@post = Post.new(title: params[:title], text: params[:text])
end

# helpers do
#   def current_user
#     session[:user_id].nil? ? nil : User.find(session[:user_id])
#   end
#   def display_one
#     "1"
#   end
# end

# def current_user
#      if session[:user_id]
#        @current_user = User.find(session[:user_id)
#      end







