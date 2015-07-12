class CreateTravelCategories < ActiveRecord::Migration
  def change
    create_table :travel_categories do |t|
      t.string "name", :limit => 50
      t.integer "position"
      t.boolean "visible", :default => false

      t.timestamps null: false
    end
  end
end
