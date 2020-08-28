class Delivery < ApplicationRecord

  validates :postal_code,presence: true
  validates :address,presence: true
  validates :name,presence: true
  belongs_to :customer


  # 登録配送先の表示用メソッド
  def view_register_address
    postal_code + " " + address + ' ' + name
  end
end
