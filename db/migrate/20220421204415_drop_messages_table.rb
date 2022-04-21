class DropMessagesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :messages, force: :cascade
  end
end
