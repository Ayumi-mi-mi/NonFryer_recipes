class MyRecipesController < ApplicationController
  before_action :require_login

  def index
    keywords = params.dig(:q, :tags_name_or_title_cont_any).to_s.split(/[[:space:]]/)
    @q = current_user.recipes.ransack(tags_name_or_title_cont_any: keywords)
    @recipes = @q.result(distinct: true).order("created_at desc")
  end

  def autocomplete
    query = params[:q].to_s.split(/[[:space:]]/)
    @recipes = current_user.recipes.ransack(title_or_tags_name_cont_any: query).result(distinct: true).limit(10)

    render json: @recipes.map { |recipe| { label: recipe.title, value: recipe.title } }
  end

  private

  def not_authenticated
    redirect_to login_path
  end
end
