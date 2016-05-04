class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.references :category, foreign_key: true
      t.boolean  :discontinued, default: false, null: false

      t.timestamps
    end
  end
end