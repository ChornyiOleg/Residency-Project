class Residence < ApplicationRecord
  belongs_to :country
  belongs_to :program
  has_many :orders
  has_many :likes

  has_many_attached :images
end