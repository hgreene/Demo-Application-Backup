class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  
  	add_index :microposts, :user_id

end

def self.up
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  
  	add_index :microposts, :user_id

end

def self.down
	drop_table :microposts

end
end
