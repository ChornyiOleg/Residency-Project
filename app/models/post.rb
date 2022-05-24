class Post < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
end