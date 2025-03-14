require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET /login" do
    it "ログイン画面にアクセスできること" do
      get login_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /login" do
    it "ログインに成功すること" do
      post login_path, params: { email: user.email, password: "password" }
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(200)
    end

    context "パスワードが間違っている場合" do
      it "ログインに失敗すること" do
        post login_path, params: { email: user.email, password: "wrong_password" }
        expect(flash.now[:alert]).to eq("ログインに失敗しました")
      end
    end
  end

  describe "GET /oauth/:provider" do
    it "Googleログインに成功すること" do
      get auth_at_provider_path(provider: "google")
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE /logout" do
    before do
      post login_path, params: { email: user.email, password: "password" }
    end

    it "ログアウトに成功すること" do
      delete logout_path
      expect(response).to have_http_status(303)
      follow_redirect!
      expect(response).to have_http_status(200)
    end
  end
end
