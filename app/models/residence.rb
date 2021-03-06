class Residence < ApplicationRecord
  translates :name, :main_info, :description, :pros
  globalize_accessors locales: I18n.available_locales, attributes: %i[name main_info description pros]

  belongs_to :country
  belongs_to :program
  has_many :orders, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :compares, dependent: :destroy

  has_many_attached :images

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :address, presence: true, length: { minimum: 2, maximum: 100 }
  validates :main_info, presence: true
  validates :description, presence: true, length: { minimum: 2, maximum: 5000 }
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :pros, presence: true, length: { minimum: 2, maximum: 1000 }
  validates :bedroom, presence: true
  validates :bathroom, presence: true
  validates :squarefeet, presence: true
  validates :rooms, presence: true
  validates :cost, presence: true
end
