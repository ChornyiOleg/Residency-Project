class Post < ActiveRecord::Base
  has_rich_text :content
  has_one_attached :image
  validates :name, presence: true, length: { minimum: 3, maximum: 200 }
  validates :content, presence: true, length: { minimum: 10 }
end