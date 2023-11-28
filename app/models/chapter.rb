class Chapter < ApplicationRecord
  belongs_to :product
  has_one_attached :photo
end
