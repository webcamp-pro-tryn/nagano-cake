class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :customer_id
    	t.integer :postage
    	t.string :name
    	t.string :postal_code
    	t.string :address
    	t.integer :payment
    	t.integer :order_status
    	t.integer :price


      t.timestamps
    end
  end
end
