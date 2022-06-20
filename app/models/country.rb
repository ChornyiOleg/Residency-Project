class Country < ApplicationRecord
  has_one_attached :image
  has_one_attached :flag
  has_rich_text :content
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  has_many :residences
  has_many :programs
end
