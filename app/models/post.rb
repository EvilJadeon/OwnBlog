class Post < ApplicationRecord
  has_rich_text :body
  mount_uploader :image, ImageUploader
  validates :title, :summary, :body, presence: true
end
