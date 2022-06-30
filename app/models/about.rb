class About < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true, length: { minimum: 2, maximum: 200 }
  validates :subtitle, presence: true, length: { minimum: 2, maximum: 200 }
  validates :advantages, presence: true
  validates :benefits, presence: true
end
