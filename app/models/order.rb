class Order < ApplicationRecord
  belongs_to :residence, optional: true
  belongs_to :user
  
  enum status: %i[new_request completed]

  enum messenger: %i[telegram viber messenger]
end