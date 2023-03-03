class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.boolean :sale
      t.integer :quantity
      t.decimal :total

      t.timestamps
    end
  end
end
