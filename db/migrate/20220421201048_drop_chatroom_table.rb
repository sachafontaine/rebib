class DropChatroomTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :chatrooms, force: :cascade
    drop_table :messages, force: :cascade
  end
end
