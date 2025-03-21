require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe, user: user) }

  describe "GET /recipes/:id" do
    it "レシピ詳細画面にアクセスできること" do
      get recipe_path(recipe)
      expect(response).to have_http_status(200)
    end

    it "存在しないレシピの場合、エラーになること" do
      get recipe_path(9999)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET /recipes/new" do
    it "レシピ作成画面にアクセスできること" do
      post login_path, params: { email: user.email, password: "password" }
      get new_recipe_path
      expect(response).to have_http_status(200)
    end

    context "ログインしていない場合" do
      it "レシピ作成画面のアクセスに失敗すること" do
        get new_recipe_path
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "POST /recipes" do
    it "レシピが作成できること" do
      post login_path, params: { email: user.email, password: "password" }

      get new_recipe_path
      post recipes_path, params: {
        recipe: {
          title: "recipe_title",
          model: "model",
          status: "unpublished",
          time: "3",
          temperature: "180"
        }
      }

      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(200)
    end

    context "入力必須項目が空の場合" do
      it "レシピの作成に失敗すること" do
        post login_path, params: { email: user.email, password: "password" }

        get new_recipe_path
        post recipes_path, params: {
          recipe: {
            title: "",
            model: "model",
            status: "unpublished",
            time: "10",
            temperature: "180"
          }
        }

        expect(flash.now[:alert]).to eq("タイトルを入力してください")
      end
    end
  end

  describe "GET /recipes/:id/edit" do
    it "レシピの編集画面にアクセスできること" do
      post login_path, params: { email: user.email, password: "password" }
      get recipe_path(recipe)
      get edit_recipe_path(recipe)
      expect(response).to have_http_status(200)
    end

    context "ログインしていない場合" do
      it "レシピ編集画面へのアクセスに失敗すること" do
        get edit_recipe_path(recipe)
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "GET /recipes/:id/edit" do
    it "レシピが編集できること" do
      post login_path, params: { email: user.email, password: "password" }

      get recipe_path(recipe)
      patch recipe_path, params: {
        recipe: {
          title: "edit_recipe_title",
          model: "edit_model",
          status: "published",
          time: "3",
          temperature: "180"
        }
      }

      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(200)
    end

    context "入力必須項目が空の場合" do
      it "レシピの編集に失敗すること" do
        post login_path, params: { email: user.email, password: "password" }

        get new_recipe_path
        post recipes_path, params: {
          recipe: {
            title: "",
            model: "model",
            status: "unpublished",
            time: "10",
            temperature: "180"
          }
        }

        expect(flash.now[:alert]).to eq("タイトルを入力してください")
      end
    end
  end

  describe "DELETE /recipes/:id" do
    it "レシピが削除できること" do
      post login_path, params: { email: user.email, password: "password" }
      delete recipe_path(recipe)

      expect(response).to have_http_status(303)
      follow_redirect!
      expect(response).to have_http_status(200)
    end

    context "ログインしていない場合" do
      it "レシピの削除に失敗すること" do
        delete recipe_path(recipe)
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
