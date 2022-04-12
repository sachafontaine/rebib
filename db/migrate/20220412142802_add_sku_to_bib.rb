class AddSkuToBib < ActiveRecord::Migration[6.1]
  def change
    add_column :bibs, :sku, :string
  end
end
