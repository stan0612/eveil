class Product < ApplicationRecord
  mount_uploader :image, PhotoUploader


  belongs_to :seller, class_name: "User", foreign_key: :user_id

  has_many :reviews, through: :order

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :initial_stock, presence: true

  include PgSearch
    pg_search_scope :search_by_title_and_description,
      against: [ :title, :description ],
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }
end
