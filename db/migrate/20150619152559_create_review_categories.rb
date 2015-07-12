class CreateReviewCategories < ActiveRecord::Migration
  def change
    create_table :review_categories do |t|
      t.string "name"
      t.integer "position"
      t.boolean "visible", :default => false

      t.timestamps null: false
    end
  end
end
