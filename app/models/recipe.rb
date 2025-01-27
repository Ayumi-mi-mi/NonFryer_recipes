class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy

  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true, length: {maximum: 255}
  validates :model, presence: true, length: {maximum: 255}
  validates :time, presence: true
  validates :temperature, presence: true
  validates :point, length: { maximum: 65_535 }
end
