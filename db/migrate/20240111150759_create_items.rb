class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :condition
      t.string :shipping_fee_burden
      t.string :shipping_from
      t.string :shipping_days
      t.integer :price

      t.timestamps
    end
  end
end
