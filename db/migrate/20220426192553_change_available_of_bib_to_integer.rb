class ChangeAvailableOfBibToInteger < ActiveRecord::Migration[6.1]
  def change
    remove_column :bibs, :available, :string, default: "1"
    add_column :bibs, :available, :integer, default: 1
  end
end
