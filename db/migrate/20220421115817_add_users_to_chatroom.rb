class AddUsersToChatroom < ActiveRecord::Migration[6.1]
  def change
    add_column :chatrooms, :sender_id, :integer
    add_column :chatrooms, :receiver_id, :integer
  end
end
