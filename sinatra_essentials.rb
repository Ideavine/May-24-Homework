#Essentials to building a basic Sinatra app: beyond migrations

#Setting up a flash in Sinatra
#Gemfile
gem 'rack-flash3', :git => "git://github.com/treeder/rack-flash.git"

#app.rb file

require 'bundler/setup'
require 'sinatra/base'
require 'rack-flash'

enable :sessions
use Rack::Flash, :sweep => true
set :sessions => true

#setting a flash message in a route

get '/' do
  flash[:notice] = 'Welcome to the homepage'
end

post '/some_form_submit_route' do
  flash[:alert] = "There was a problem with that."
end

#displaying a flash inside of a view
-if !flash[:notice].nil?
  =flash[:notice]



#Helpers
#To define a helper method to use inside of any view:
#inside of your app.rb file

helpers do
  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end
  def display_one
    "1"
  end
end

#inside of your view
=current_user
=display_one



#Using sessions
#Ensure all of the flash code above is setup first
#You can store anything inside of the session hash, for instance, a user id.
#inside app.rb

post '/sign_in' do
  @user = User.where(params[:user])
  if @user.empty?
    flash[:alert] = "Sorry, that user doesn't exist. Feel free to sign up."
    session[:user_id] = @user.first.id
    redirect '/sign_up'
  else
    flash[:notice] = "You've successfully signed in."
    redirect '/'
  end
end



#Using forms
#inside of any view
#the form action is the Sinatra route (in app.rb) that the form data will be posted to.

%form{action: "/sign_in", method: "POST"}
  %label Email
  %input{type: "text", name: "[user]email"}
  %label Password
  %input{type: "password", name: "[user]password"}
  %input{type: "submit", value: "submit"}

#the action attribute on the form is the HTTP verb. So for the above, you'd need a route like this to process the information:
post '/sign_up' do
  #some code here to process any incoming params
end


