class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string "name", :limit => 50
      t.integer "parentid"
      t.text "description"

      t.timestamps null: false
    end
  end
end
