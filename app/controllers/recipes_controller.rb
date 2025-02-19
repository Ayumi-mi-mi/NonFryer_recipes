class RecipesController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  before_action :set_recipe, only: %i[show edit update status_change destroy]

  def new
    @recipe = Recipe.new
    [ @recipe.heats, @recipe.ingredients, @recipe.instructions, @recipe.embeds ].each { |collection| collection.build }
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      @recipe.embeds.each do |embed|
        embed.embed_type
      end
      flash[:notice] = "レシピを作成しました"
      redirect_to recipe_path(@recipe)
    else
      [ @recipe.ingredients, @recipe.instructions, @recipe.embeds ].each { |collection| collection.build if collection.blank? }
      flash.now[:alert] = @recipe.errors.full_messages.join("、")
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    [ @recipe.ingredients, @recipe.instructions, @recipe.embeds ].each { |collection| collection.build if collection.blank? }
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = "レシピを編集しました"
      redirect_to recipe_path(@recipe)
    else
      flash.now[:alert] = @recipe.errors.full_messages.join("、")
      render :edit, status: :unprocessable_entity
    end
  end

  def status_change
    if @recipe.unpublished?
      @recipe.update(status: :published)
      flash[:notice] = "レシピを公開しました"
    else
      @recipe.update(status: :unpublished)
      flash[:notice] = "レシピを未公開にしました"
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy!
    flash[:notice] = "レシピを削除しました"
    redirect_to my_recipes_path, status: :see_other
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(
      :title, :model, :preheat_time, :preheat_temperature, :point, :main_image, :tag_list, :status,
      heats_attributes: [ :id, :time, :temperature, :_destroy ],
      ingredients_attributes: [ :id, :name, :quantity, :_destroy ],
      instructions_attributes: [ :id, :step_number, :description, :image, :_destroy ],
      embeds_attributes: [ :id, :kind, :url, :ogp_title, :ogp_description, :ogp_image_url, :ogp_site_name, :_destroy ]
    )
  end

  def not_authenticated
    redirect_to login_path
  end
end
