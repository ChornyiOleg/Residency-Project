class About < ApplicationRecord
  translates :title, :subtitle, :advantages, :benefits
  globalize_accessors locales: I18n.available_locales, attributes: %i[title subtitle advantages benefits]

  has_one_attached :image
  validates :title, presence: true, length: { minimum: 2, maximum: 200 }
  validates :subtitle, presence: true, length: { minimum: 2, maximum: 200 }
  validates :advantages, presence: true
  validates :benefits, presence: true
end
