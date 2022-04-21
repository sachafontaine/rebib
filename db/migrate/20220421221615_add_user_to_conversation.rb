class AddUserToConversation < ActiveRecord::Migration[6.1]
  def change
    add_column :conversations, :sender_id, :integer
    add_column :conversations, :recipient_id, :integer
  end
end
