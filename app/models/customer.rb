class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders,dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy

  has_many :cart_items, dependent: :destroy


  def active_for_authentication?
  	super && (self.is_deleted == false)
  end
end
