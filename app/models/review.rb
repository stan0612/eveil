class Review < ApplicationRecord
  belongs_to :order
  validates :content, presence: true
  validates :rating, presence: true
end
