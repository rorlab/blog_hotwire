class Comment < ApplicationRecord
  belongs_to :post

  validates :content, presence: true

  # broadcasts_to :comments
  broadcasts_to ->(_comment) { :comments }
end
