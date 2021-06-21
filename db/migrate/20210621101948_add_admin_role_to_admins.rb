class AddAdminRoleToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :amin_role, :bool, :default=>true
  end
end
