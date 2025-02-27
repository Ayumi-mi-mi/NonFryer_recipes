class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :recipes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_recipes, through: :bookmarks, source: :recipe

  validates :password, presence: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  def bookmark(recipe)
    bookmark_recipes << recipe
  end

  def unbookmark(recipe)
    bookmark_recipes.destroy(recipe)
  end

  def bookmark?(recipe)
    bookmark_recipes.include?(recipe)
  end

  def own?(object)
    id == object&.user_id
  end

  before_update :setup_activation, if: -> { will_save_change_to_unconfirmed_email? }

  def setup_activation
    self.activation_token = SecureRandom.urlsafe_base64
    self.activation_state = "pending"
  end

  def activate!
    update(email: unconfirmed_email, unconfirmed_email: nil, activation_state: "active", activation_token: nil)
  end
end
