class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.string :status, null: false
      t.string :judgment, null: false
      t.string :size, null: false
      t.integer :cost,null: false
      t.string :days,null: false
      t.integer :prefecture_code
      t.timestamps
    end
  end
end
