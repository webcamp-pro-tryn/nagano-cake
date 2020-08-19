class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id, foreign_key: true
      t.string :name
      t.string :address
      t.string :postal_code

      t.timestamps
    end
  end
end
