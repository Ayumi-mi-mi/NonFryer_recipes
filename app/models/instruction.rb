class Instruction < ApplicationRecord
  belongs_to :recipe
  has_one_attached :image

  after_create :set_step_number

  validates :image, blob: { content_type: [ "image/png", "image/jpg", "image/jpeg" ], size_range: 1..(5.megabytes) }

  private

  def set_step_number
    update_column(:step_number, recipe.instructions.count)
  end
end
