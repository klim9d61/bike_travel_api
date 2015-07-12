class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer "user_id"
      t.integer "review_category_id"
      # same as: t.references :subject
      t.string "name"
      t.integer "position"
      t.text "content"
      t.boolean "visible", :default => false

      t.timestamps null: false
    end
    add_index("reviews", "user_id")
    add_index("reviews", "review_category_id")
  end
end
