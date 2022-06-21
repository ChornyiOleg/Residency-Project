class Program < ApplicationRecord
  has_many :residences, dependent: :destroy
  
end