class BookmarksController < ApplicationController
  before_action :require_login
  def index
    keywords = params.dig(:q, :tags_name_or_title_cont_any).to_s.split(/[[:space:]]/)
    @q = current_user.bookmark_recipes.ransack(tags_name_or_title_cont_any: keywords)
    @recipes = @q.result(distinct: true).includes(main_image_attachment: :blob).order("created_at desc")
  end

  def autocomplete
    query = params[:q].to_s.split(/[[:space:]]/)
    @recipes = current_user.bookmark_recipes.ransack(title_or_tags_name_cont_any: query).result(distinct: true).limit(10)

    render json: @recipes.map { |recipe| { label: recipe.title, value: recipe.title } }
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.bookmark(recipe)

    render turbo_stream: turbo_stream.replace(
      "bookmark_#{recipe.id}",
      partial: "bookmarks/bookmark",
      locals: { recipe: recipe }
    )
  end

  def destroy
    recipe = Recipe.find(params[:id])
    current_user.unbookmark(recipe)

    render turbo_stream: turbo_stream.replace(
      "bookmark_#{recipe.id}",
      partial: "bookmarks/bookmark",
      locals: { recipe: recipe }
    )
  end

  private

  def not_authenticated
    redirect_to login_path
  end
end
