class RemoveDateToRace < ActiveRecord::Migration[6.1]
  def change
    remove_column :races, :date
    add_column :races, :date, :string
  end
end
