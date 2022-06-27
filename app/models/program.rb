class Program < ApplicationRecord
  belongs_to :country, optional: true
  has_many :residences, dependent: :destroy
  has_one_attached :image
  has_rich_text :content
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :kind, presence: true, length: { maximum: 11 }
end
