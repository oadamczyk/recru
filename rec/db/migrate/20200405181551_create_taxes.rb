class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.references :price, index: true, foreign_key: true, null: false
      t.integer :value, null: false
    end
  end
end
