class Instruction < ApplicationRecord
  belongs_to :recipe

  after_create :set_step_number

  private

  def set_step_number
    update_column(:step_number, recipe.instructions.count)
  end
end
