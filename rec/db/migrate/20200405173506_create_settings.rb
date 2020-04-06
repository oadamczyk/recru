class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.decimal :special, null: false, precision: 5, scale: 4
    end
  end
end
