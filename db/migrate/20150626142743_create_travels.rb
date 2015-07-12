class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.integer "user_id"
      t.integer "travel_category_id"
      t.string "name"
      t.integer "position"
      t.text "content"
      t.boolean "visible", :default => false

      t.timestamps null: false
    end
    add_index("travels", "user_id")
    add_index("travels", "travel_category_id")
  end
end