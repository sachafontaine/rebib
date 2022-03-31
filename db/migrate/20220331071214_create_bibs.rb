class CreateBibs < ActiveRecord::Migration[6.1]
  def change
    create_table :bibs do |t|
      t.string :race
      t.decimal :price
      t.timestamps
    end
  end
end
