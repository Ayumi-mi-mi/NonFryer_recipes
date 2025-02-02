class Embed < ApplicationRecord
  belongs_to :recipe

  enum kind: { website: 0, youtube: 1, twitter: 2, instagram: 3 }
end
