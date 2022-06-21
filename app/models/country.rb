class Country < ApplicationRecord
  has_many :residences, dependent: :destroy

  
  
end