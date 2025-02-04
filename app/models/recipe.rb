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

  validates :title, presence: true, length: { maximum: 255 }
  validates :model, presence: true, length: { maximum: 255 }
  validates :point, length: { maximum: 65_535 }

  validates :main_image, blob: { content_type: [ "image/png", "image/jpg", "image/jpeg" ], size_range: 0..(5.megabytes) }

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["tags"]
  end

  def self.ransackable_scopes(auth_object = nil)
    [:tagged_with]
  end
end
