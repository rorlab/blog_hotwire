class Post < ApplicationRecord
  validates :title, presence: true

  broadcasts_to ->(_post) { :posts }, inserts_by: :prepend
end
