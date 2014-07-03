class CreateFollowersUsersTable < ActiveRecord::Migration
  def change
  	create_table :followers_users do |t|
  		t.integer :post_id
  		t.integer :user_id
  		t.integer :follower_id
  	end
  end
end
