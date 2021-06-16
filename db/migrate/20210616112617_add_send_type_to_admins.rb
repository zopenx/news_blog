class AddSendTypeToAdmins < ActiveRecord::Migration[6.1]
  def change
    # add_reference :admins, :send_types, index:true, foreign_key: true, :default=>2
  end
end
