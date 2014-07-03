class CreateProfilesTable < ActiveRecord::Migration
  def change
  	create_table :profiles do |t|
  		t.string :city
  		t.string :state
  		t.string :country
  		t.datetime :created_at
  		t.integer :user_id
      t.string :username
      t.string :password
  	end
  end
end