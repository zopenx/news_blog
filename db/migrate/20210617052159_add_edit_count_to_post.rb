class AddEditCountToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :edit_count, :integer, :default=>0
  end
end
