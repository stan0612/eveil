class Product < ApplicationRecord
  mount_uploader :image, PhotoUploader


  belongs_to :seller, class_name: "User", foreign_key: :user_id
  has_many :orders
  has_many :reviews, through: :orders


  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :initial_stock, presence: true
end
