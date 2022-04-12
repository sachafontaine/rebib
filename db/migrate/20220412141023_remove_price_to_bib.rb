class RemovePriceToBib < ActiveRecord::Migration[6.1]
  def change
    remove_column :bibs, :price
    add_monetize :bibs, :price, currency: { present: false }
  end
end
