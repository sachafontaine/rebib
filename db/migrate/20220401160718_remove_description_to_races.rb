class RemoveDescriptionToRaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :races, :description
    add_column :races, :address, :string
    add_column :races, :date, :date
  end
end
