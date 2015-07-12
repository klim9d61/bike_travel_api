class AlterUsers < ActiveRecord::Migration

  def up
    change_column("users", "email", :string, :limit => 100, :default => "", :null => false)
    remove_column "users", "password"
    add_column "users", "password_digest", :string, :after => :last_name
    add_column "users", "auth_token", :text, :after => :password_digest
    puts "*** Adding indexes is next ***"
    add_index("users", "username")
  end

  def down
    remove_index("users", "username")
    remove_column "users", "auth_token"
    remove_column "users", "password_digest"
    add_column "users", "password", :string, :limit => 40
    change_column("users", "email", :string, :default => "", :null => false)
  end
end
