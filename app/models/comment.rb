class Comment < ApplicationRecord
  belongs_to :post

  # broadcasts_to :comments
  broadcasts_to ->(_comment) { :comments }
end
