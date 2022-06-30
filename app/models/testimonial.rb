class Testimonial < ApplicationRecord
  translates :name_of_user, :content
  globalize_accessors locales: I18n.available_locales, attributes: %i[name_of_user content]

  validates :name_of_user, presence: true
  validates :content, presence: true, length: { minimum: 2, maximum: 500 }
end
