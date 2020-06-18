class RemoveRememberCreatedUFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :remember_created_u, :datetime
  end
end
