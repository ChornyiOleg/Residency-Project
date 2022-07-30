class User < ApplicationRecord
  include UserOath
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github facebook google_oauth2]

  has_many :authorizations
  has_many :views, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :compares, dependent: :destroy
  validates :email, presence: true
  validates_format_of :email, with: /(^[+A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$)/i

  PASSWORD_ERROR_MESSAGE = 'must be between 6 and 18 characters,
    must contain letters in mixed case, must contain numbers'.freeze

  validates :password, presence: true, format: {
    with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{6,18}\z/,
    message: PASSWORD_ERROR_MESSAGE
  }

  def self.create_from_omniauth(params)
    send(params.provider, params)
  end
end
