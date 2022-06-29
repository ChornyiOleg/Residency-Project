class Contact < ApplicationRecord
  validates :location, presence: true, length: { minimum: 2, maximum: 150 }
  validates_format_of :email, with: /@/, on: :create
  validates :phone, presence: true, length: { maximum: 20 }
end
