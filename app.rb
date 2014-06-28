require 'sinatra'
require 'sinatra/activerecord'

configure(:development){set :database, "sqlite3:test.sqlite3"}

require './models'

get '/' do
	"Hello World! Welcome to my MicroBlogging Site"
end

get '/home' do
	"Register Here"
	erb :home
end




