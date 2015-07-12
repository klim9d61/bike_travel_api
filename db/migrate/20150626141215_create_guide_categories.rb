class CreateGuideCategories < ActiveRecord::Migration
  def up
    create_table :guide_categories do |t|
      t.string "name", :limit => 50
      t.integer "position"
      t.boolean "visible", :default => false

      t.timestamps null: false
    end
  end

  def down
    drop_table :guide_categories
  end
end