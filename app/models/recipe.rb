class Recipe < ApplicationRecord
  belongs_to :user
  has_many :heats, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy
  has_many :embeds, dependent: :destroy

  has_one_attached :main_image

  acts_as_taggable_on :tags

  accepts_nested_attributes_for :heats, allow_destroy: true
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :embeds, allow_destroy: true, reject_if: :all_blank

  enum status: { unpublished: 0, published: 1 }

  validates :title, presence: true, length: { maximum: 255 }
  validates :model, presence: true, length: { maximum: 255 }
  validates :point, length: { maximum: 65_535 }
  validates :heats, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :preheat_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :preheat_temperature, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :main_image, blob: { content_type: [ "image/png", "image/jpg", "image/jpeg" ], size_range: 0..(5.megabytes) }

  def self.ransackable_attributes(auth_object = nil)
    [ "title" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "tags" ]
  end
end
