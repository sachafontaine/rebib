class AddIndexToChatroom < ActiveRecord::Migration[6.1]
  def change
    add_index :chatrooms, [:sender_id, :receiver_id], unique: true
  end
end
