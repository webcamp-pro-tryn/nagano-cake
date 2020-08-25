class CreateOrder < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
    	t.integer :postage, default: 800
    	t.string :name, null: false
    	t.string :postal_code, null: false
    	t.string :address, null: false
    	t.integer :payment, default: 0
    	t.integer :order_status, default: 0
      t.integer :price, null: false
      
      t.timestamps
    end
  end
end
