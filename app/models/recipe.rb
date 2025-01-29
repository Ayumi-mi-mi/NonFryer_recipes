class Recipe < ApplicationRecord
  belongs_to :user
  has_many :heats, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy

  has_one_attached :main_image

  accepts_nested_attributes_for :heats, allow_destroy: true
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true, length: { maximum: 255 }
  validates :model, presence: true, length: { maximum: 255 }
  validates :point, length: { maximum: 65_535 }

  validates :main_image, blob: { content_type: [ "image/png", "image/jpg", "image/jpeg" ], size_range: 1..(5.megabytes) }
end
