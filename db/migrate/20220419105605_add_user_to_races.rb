class AddUserToRaces < ActiveRecord::Migration[6.1]
  def change
    add_reference :races, :user, null: false, foreign_key: true
  end
end
