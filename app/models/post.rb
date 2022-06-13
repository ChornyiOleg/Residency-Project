class Post < ActiveRecord::Base
  has_rich_text :content
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }

  has_one_attached :image

end