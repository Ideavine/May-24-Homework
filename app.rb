require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'
# require 'bundler/setup'
# require 'sinatra/base'

enable :sessions
use Rack::Flash, :sweep => true
set :sessions => true

configure(:development){set :database, "sqlite3:test.sqlite3"}

require './models'


get '/' do
  flash[:notice] = 'Welcome to the homepage'
  erb :home
end

get '/user_area' do
  erb :user_area  
end

get '/posts' do
  erb :posts
end

get '/new' do
  erb :new
end

post '/sign-up' do
     @user = User.create(params[:user])
	erb :user_area
end


#The following code *should* take the info entered in the form on home.erb and create a user record in the database that can be used to sign in/out (create a session).
#The following code should lookup user/password combos and redirect to posts.erb if successful. 

post '/sign-in' do
  #check that the user's password is correct
  # params
  # {user: {username: "zachfeldmna", password: "pass"}}
  @user = User.where(username: params[:user][:username]).first
  if @user.password == params[:user][:password]
    session[:user_id] = @user.id
    flash[:notice] = "You were logged in successfully."
    redirect "/user_area"
    erb :user_area
  else
   flash[:alert] = "There was a problem logging you in"
    redirect "/error"
    erb :home
  end
end
  #if so, sign them in

def current_user
     if session[:user_id]
       @current_user = User.find(session[:user_id])
     end
   end

helpers do
  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end
  def display_one
    "1"
  end
end

get '/signout' do
    session.clear
    flash[:notice] = "You were logged out successfully."
end

# post '/posts/new' do
#     @post = Post.create(params[:post])
#   	  flash[:notice] = "Your post was created."
#     erb :user_area
# end



post "/posts/new" do
  @post = Post.new(params[:post])
  if @post.save
     flash[:notice] = "Your post was created."
     redirect "/new"
     erb :new
  else
    erb :user_area
  end
end

get '/new' do
  # get the latest 10 posts
  @posts = Post.all
  erb :new
end


# post '/posts/follow' do
#   @post = Post.new(title: params[:title], text: params[:text])
# end











