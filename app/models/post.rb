class Post < ActiveRecord::Base
  translates :name, :content
  globalize_accessors locales: I18n.available_locales, attributes: %i[name content]

  has_one_attached :image
  validates :name, presence: true, length: { minimum: 3, maximum: 200 }
  validates :content, presence: true, length: { minimum: 10 }
end
