class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.integer :post_id
  		t.text :post
  		t.datetime :created_at
  		t.integer :user_id
<<<<<<< HEAD
  		t.string :post_title
=======
>>>>>>> 2573121049c3bac3608823db882d629e26c34cd9
  	end
  end
end



<<<<<<< HEAD

=======
>>>>>>> 2573121049c3bac3608823db882d629e26c34cd9
