class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.integer :post_id
  		t.text :post
  		t.datetime :created_at
  		t.integer :user_id
  		t.string :post_title
  	end
  end
end




