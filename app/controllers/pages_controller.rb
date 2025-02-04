class PagesController < ApplicationController
  def home
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).order("created_at desc")
  end
end
