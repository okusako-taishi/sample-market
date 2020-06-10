class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :family_name,        null: false
      t.string :first_name,         null: false
      t.string :family_name_kana,   null: false
      t.string :first_name_kana,    null: false
      t.integer :post_code,          null: false
      t.integer :prefecture_id,     null: false
      t.string :city,               null: false
      t.string :block,              null: false
      t.string :building_name
      t.integer :phone_number
      t.references :user
      t.timestamps
    end
  end
end
