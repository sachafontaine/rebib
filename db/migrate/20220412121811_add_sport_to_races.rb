class AddSportToRaces < ActiveRecord::Migration[6.1]
  def change
    add_column :races, :sport, :integer
  end
end
