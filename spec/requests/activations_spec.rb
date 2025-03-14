require 'rails_helper'

RSpec.describe "ChangeEmails", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "activations/" do
    before do
      post login_path, params: { email: user.email, password: "password" }
      get edit_profile_path
    end

    it "メールアドレス変更ページにアクセスできること" do
      get new_activation_path
      expect(response).to have_http_status(200)
    end

    it "メールアドレス変更メールが送信されること" do
      get new_activation_path
      patch activation_path(user.id), params: { email: "new_email@example.com" }
      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.body).to include("確認メールを送信しました。メールを確認してください。")
    end
  end

  describe "get activations/new/id" do
    context "ログインしていない場合" do
      it "メールアドレス変更ページのアクセスに失敗すること" do
        get new_activation_path
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "GET /activations/:id/edit" do
    before do
      UserMailer.activation_needed_email(user).deliver_later
    end

    it "メールアドレスの変更に成功すること" do
      get edit_activation_path(user.activation_token)
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(200)
    end

    context "不正なトークンでアクセスした場合" do
      it "メールアドレスの変更に失敗すること" do
        get edit_activation_path(SecureRandom.urlsafe_base64)
        expect(response).to have_http_status(302)
        follow_redirect!
        expect(response).to have_http_status(200)
      end
    end
  end
end
