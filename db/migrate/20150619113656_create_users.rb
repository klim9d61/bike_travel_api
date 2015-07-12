class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users do |t|
      t.integer "role_id"
      t.string "username", :limit => 50
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40

      t.timestamps null: false
    end
    add_index("users", "role_id")
  end

  def down
    drop_table :users
  end
end
