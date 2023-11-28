class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one_attached :photo
end
