class Residence < ApplicationRecord
  belongs_to :country
  belongs_to :program
  has_many :orders
  
end