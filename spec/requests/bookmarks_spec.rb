require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe) }

  before do
    post login_path, params: { email: user.email, password: "password" }
    get recipe_path(recipe)
  end

  describe "GET /bookmarks" do
    it "レシピ保存ページにアクセスできること" do
      get bookmarks_path
      expect(response).to have_http_status(200)
    end

    context "ログインしていない場合" do
      it "レシピ保存ページのアクセスに失敗すること" do
        delete logout_path
        get bookmarks_path
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "POST /bookmarks" do
    it "レシピをブックマークできること" do
      post bookmarks_path, params: { recipe_id: recipe.id }, as: :turbo_stream

      expect(response).to have_http_status(:success)
      expect(response.content_type).to include("text/vnd.turbo-stream.html")
      expect(response.body).to include("<turbo-stream action=\"replace\" target=\"bookmark_#{recipe.id}\">")
    end
  end

  describe "DELETE /bookmarks/:id" do
    before do
      user.bookmark(recipe)
    end

    it "レシピのブックマークを解除できること" do
      delete bookmark_path(recipe), as: :turbo_stream

      expect(response).to have_http_status(:success)
      expect(response.content_type).to include("text/vnd.turbo-stream.html")
      expect(response.body).to include("turbo-stream action=\"replace\" target=\"bookmark_#{recipe.id}\">")
    end
  end
end
