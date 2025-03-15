require 'rails_helper'

RSpec.describe "MyRecipes", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET /my_recipes" do
    it "マイレシピページにアクセスできること" do
      post login_path, params: { email: user.email, password: "password" }
      get my_recipes_path
      expect(response).to have_http_status(200)
    end

    context "ログインしていない場合" do
      it "マイレシピページのアクセスに失敗すること" do
        get my_recipes_path
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
