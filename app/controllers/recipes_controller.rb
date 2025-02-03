class RecipesController < ApplicationController
  before_action :require_login, only: %i[new create update destroy]

  def new
    @recipe = Recipe.new
    @recipe.heats.build
    @recipe.ingredients.build
    @recipe.instructions.build
    @recipe.embeds.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      @recipe.embeds.each do |embed|
        embed.embed_type
      end
      flash[:notice] = "レシピを作成しました"
      redirect_to root_path
    else
      flash.now[:alert] = @recipe.errors.full_messages.join("、")
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)           # 確認
      flash[:notice] = "レシピを編集しました"
      redirect_to recipe_path(@recipe)
    else
      flash.now[:alert] = @recipe.errors.full_messages.join("、")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    flash[:notice] = "レシピを削除しました"
    redirect_to root_path, status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title, :model, :preheat_time, :preheat_temperature, :point, :main_image,
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
