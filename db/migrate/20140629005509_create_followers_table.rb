class CreateFollowersTable < ActiveRecord::Migration
  def change
  	create_table :followers do |t|
  		t.integer :post_id
  		t.integer :user_id
  		t.integer :follower_id
  	end
  end
end
