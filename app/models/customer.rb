class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  with_options presence: true do
    validates :family_name
    validates :family_name_kana
    validates :first_name
    validates :first_name_kana
    validates :postal_code
    validates :address
    validates :phone_number
    validates :email
  end

  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy

  has_many :cart_items, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
