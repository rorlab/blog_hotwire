class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true

  broadcasts_to ->(_post) { :posts }, inserts_by: :prepend
end
