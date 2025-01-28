# top page
class PagesController < ApplicationController
  def home
    @recipes = Recipe.order(created_at: :desc)
  end
end
