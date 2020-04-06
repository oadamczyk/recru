class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.boolean :buyable, null: false, default: false
      t.string :description, null: true
      t.string :identifier, null: false
      t.string :name, null: true
    end
  end
end
