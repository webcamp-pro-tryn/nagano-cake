class ChangeColumnNullToCartItem < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cart_items, :quantity, false, 0
  end
end
