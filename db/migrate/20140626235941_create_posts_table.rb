class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.integer :post_id
  		t.text :post
  		t.datetime :created_at
  	end
  end
end
