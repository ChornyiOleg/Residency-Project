class Testimonial < ApplicationRecord
  validates :name_of_user, presence: true
  validates :content, presence: true, length: { minimum: 2, maximum: 500 }
end
