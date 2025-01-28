class Instruction < ApplicationRecord
  belongs_to :recipe
  before_validation :set_step_number, on: :create

  private

  def set_step_number
    # 自動的にステップ番号を設定
    self.step_number ||= recipe.instructions.count + 1
  end
end
