class Program < ApplicationRecord
  translates :name, :content
  globalize_accessors locales: I18n.available_locales, attributes: %i[name content]
  
  belongs_to :country, optional: true
  has_many :residences, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :kind, presence: true, length: { maximum: 11 }
end
