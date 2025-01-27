class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:notice] = 'レシピを作成しました'
      redirect_to root_path
    else
      flash.now[:alert] = @recipe.errors.full_messages.join("、")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title, :model, :preheat_time, :preheat_temperature, :time, :temperature, :point,
      ingredients_attributes: [:id, :name, :quantity, :_destroy]
    )
  end
end
