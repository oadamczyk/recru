class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.integer :price, null: true
      t.integer :price_type, null: false, limit: 1
      t.references :product, index: true, foreign_key: true, null: false
      t.integer :unit_gross, null: false
      t.integer :unit_net, null: false
    end
  end
end
