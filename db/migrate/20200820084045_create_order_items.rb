class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
    	t.integer :order_id, foreign_key: true
    	t.integer :item_id, foreign_key: true
    	t.integer :production_status, default: 0
    	t.integer :sub_price

      t.timestamps
    end
  end
end
