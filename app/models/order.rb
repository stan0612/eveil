class Order < ApplicationRecord
  belongs_to :buyer, class_name: "User", foreign_key: :user_id
  belongs_to :product
  validates :quantity, presence: true
  # validates :paid, default: false
end
