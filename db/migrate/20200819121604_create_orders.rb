class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :customer_id, foreign_key: true
    	t.integer :postage, default: 800
    	t.string :name
    	t.string :postal_code
    	t.string :address
    	t.integer :payment, default: 0
    	t.integer :order_status
    	t.integer :price


      t.timestamps
    end
  end
end
