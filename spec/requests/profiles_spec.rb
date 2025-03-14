require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET /profile/edit" do
    it "プロフィール画面にアクセスできること" do
      post login_path, params: { email: user.email, password: "password" }
      get edit_profile_path
      expect(response).to have_http_status(200)
    end

    context "ログインしていない場合" do
      it "プロフィール画面のアクセスに失敗すること" do
        get edit_profile_path
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "PATCH /profile" do
    before do
      post login_path, params: { email: user.email, password: "password" }
    end

    it "プロフィール画面で名前の変更ができること" do
      get edit_profile_path
      patch profile_path, params: { user: { name: "edit_name" } }
      expect(response).to redirect_to(edit_profile_path)
    end
  end
end
