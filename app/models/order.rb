class Order < ApplicationRecord
  belongs_to :residence, optional: true
  belongs_to :user

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :phone, presence: true
  validates :info, presence: true, length: { minimum: 2, maximum: 100 }

  enum status: %i[new_request completed]

  enum messenger: %i[telegram viber messenger]
end
