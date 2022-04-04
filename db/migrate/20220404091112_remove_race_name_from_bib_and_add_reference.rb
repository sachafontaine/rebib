class RemoveRaceNameFromBibAndAddReference < ActiveRecord::Migration[6.1]
  def change
    remove_column :bibs, :race
    add_reference :bibs, :race, null: false, foreign_key: true
  end
end
