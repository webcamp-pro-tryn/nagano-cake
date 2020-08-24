class CreateItem < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :genre, foreign_key: true
      t.string :name, null: false, index: true
      t.text :description
      t.integer :non_tax_price, null: false
      t.string :image_id
      t.boolean :is_active, null: false, default: true

      
    end
  end
end
