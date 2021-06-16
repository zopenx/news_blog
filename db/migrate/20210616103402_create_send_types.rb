class CreateSendTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :send_types do |t|
      t.string :info
      t.timestamps
    end
  end
end
