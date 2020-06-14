class RemoveItemIdIdFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :item_id_id, :reference
  end
end
