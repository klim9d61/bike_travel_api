class CreateContactInformations < ActiveRecord::Migration
  def change
    create_table :contact_informations do |t|
      t.integer "user_id"
      # same as: t.references :subject
      t.string "phone_number", :limit => 50
      t.string "address_1", :limit => 255
      t.string "address_2", :limit => 255
      t.string "city", :limit => 50
      t.string "country", :limit => 50
      t.string "state", :limit => 50
      t.integer "zip", :limit => 6
      t.boolean "visible", :default => false

      t.timestamps null: false
    end
    add_index("contact_informations", "user_id")
  end
end