class Residence < ApplicationRecord
  belongs_to :country
  belongs_to :program
  has_many :orders, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many_attached :images
end