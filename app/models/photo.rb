class Photo < ApplicationRecord
  belongs_to :user
  # belongs_to :album
  has_many :comments
  has_one_attached :image
end
