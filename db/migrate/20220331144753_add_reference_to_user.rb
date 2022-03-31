class AddReferenceToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :bibs, :user, null: false, foreign_key: true
  end
end
