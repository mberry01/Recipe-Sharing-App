class Recipe < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  validates :user, presence: true
end
