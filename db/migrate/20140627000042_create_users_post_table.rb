class CreateUsersPostTable < ActiveRecord::Migration
  def change
  	create_table :users_posts do |t|
  		t.integer :post_id
  		t.integer :user_id
  		end
	end
end
