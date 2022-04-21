class ChangeDateOfRaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :races, :date, :string
    add_column :races, :date, :datetime
  end
end
