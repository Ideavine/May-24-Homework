class User < ActiveRecord::Base
has_one :profile
has_many :posts
end

class Post < ActiveRecord::Base 
belongs_to :user
has_one :profile
end

class Profile < ActiveRecord::Base 
belongs_to :user
has_one :profile
end

class UsersPost < ActiveRecord::Base 
belongs_to :user
has_one :profile
end

class Followers < ActiveRecord::Base 
belongs_to :user
end

class UsersFollowers < ActiveRecord::Base 
belongs_to :user
has_many :user
end

# class UsersController < ApplicationController   
#     def create
#         @user = User.create(params[:user])

        
#WORK ON ADDING ALL THE ASSOCIATIONS
#THEN CREATE RECORDS IN EACH
#THEN ASSOCIATE A SPECIFIC ROOM WITH USERS 
#Users.room.create
#then test associations in irb 
