class Country < ApplicationRecord
  translates :name, :content
  globalize_accessors locales: I18n.available_locales, attributes: %i[name content]

  has_one_attached :image
  has_one_attached :flag
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  has_many :residences, dependent: :destroy
  has_many :programs, dependent: :destroy
end
