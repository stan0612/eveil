class Product < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: :user_id
  has_many :reviews, through: :order
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :initial_stock, presence: true
end
