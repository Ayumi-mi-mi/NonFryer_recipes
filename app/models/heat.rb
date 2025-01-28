class Heat < ApplicationRecord
  belongs_to :recipe

  validates :time, presence: true
  validates :temperature, presence: true
end
