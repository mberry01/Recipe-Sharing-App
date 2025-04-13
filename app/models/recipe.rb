class Recipe < ApplicationRecord
has_one_attached :image
belongs_to :user
validates :user, presence: true
end
