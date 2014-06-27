class CreateProfilesTable < ActiveRecord::Migration
  def change
  	create_table :profiles do |t|
  		t.string :profile_name
  		t.string :city
  		t.string :state
  		t.string :country
  		t.datetime :created_at
  		t.integer :user_id
  	end
  end
end
