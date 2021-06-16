class AddNewRowsIntoSendType < ActiveRecord::Migration[6.1]
  def change
    SendType.create info:"Ежедневно"
    SendType.create info:"Еженедельно"
    SendType.create info:"Отказ"
  end
end
