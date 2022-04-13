class RemoveAvailableToBib < ActiveRecord::Migration[6.1]
  def change
    remove_column :bibs, :available, :boolean, default: true
    add_column :bibs, :available, :string, default: "1"
  end
end
