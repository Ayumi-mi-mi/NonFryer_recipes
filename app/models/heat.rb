class Heat < ApplicationRecord
  belongs_to :recipe

  validates :time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :temperature, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
