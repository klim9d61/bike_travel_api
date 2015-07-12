class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.integer "user_id"
      t.integer "guide_category_id"
      t.string "name"
      t.integer "position"
      t.text "content"
      t.boolean "visible", :default => false

      t.timestamps null: false
    end
    add_index("guides", "user_id")
    add_index("guides", "guide_category_id")
  end
end
