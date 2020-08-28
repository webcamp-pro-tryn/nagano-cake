class Delivery < ApplicationRecord
  belongs_to :customer

  # 登録配送先の表示用メソッド
  def view_register_address
    postal_code + " " + address + ' ' + name
  end
end
