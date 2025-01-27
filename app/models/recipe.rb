class Recipe < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 255}
  validates :model, presence: true, length: {maximum: 255}
  validates :time, presence: true
  validates :temperature, presence: true
  validates :point, length: { maximum: 65_535 }
end
