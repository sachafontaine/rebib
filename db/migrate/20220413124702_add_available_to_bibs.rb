class AddAvailableToBibs < ActiveRecord::Migration[6.1]
  def change
    add_column :bibs, :available, :boolean, default: true
  end
end
