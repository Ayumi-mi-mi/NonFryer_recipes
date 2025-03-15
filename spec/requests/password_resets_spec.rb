require 'rails_helper'

RSpec.describe "PasswordResets", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "/password_resets/" do
    before do
      post login_path, params: { email: user.email, password: "password" }
      get edit_profile_path
    end

    it "パスワードリセット申請ページにアクセスできること" do
      get new_password_reset_path
      expect(response).to have_http_status(200)
    end

    context "存在するメールアドレスを入力した場合" do
      it "パスワードリセットメールが送信されること" do
        get new_password_reset_path
        post password_resets_path, params: { email: user.email }
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include("パスワードリセットのメールを送信しました")
      end
    end

    context "存在しないメールアドレスを入力した場合" do
      it "エラーメッセージが表示されること" do
        post password_resets_path, params: { email: "invalid@example.com" }
        expect(response.body).to include("メールアドレスが見つかりません")
      end
    end
  end

  describe "GET /password_resets/:id/edit" do
    before do
      user.deliver_reset_password_instructions!
    end

    it "パスワードリセットに成功できること" do
      get edit_password_reset_path(user.reset_password_token)
      patch password_reset_path(user.reset_password_token), params: { user: { password: "new_password", password_confirmation: "new_password" } }
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(200)
    end

    context "パスワードと確認パスワードが一致しない場合" do
      it "パスワードリセットに失敗すること" do
        get edit_password_reset_path(user.reset_password_token)
        patch password_reset_path(user.reset_password_token), params: { user: { password: "new_password", password_confirmation: "new_password_confirmation" } }
        expect(response.body).to include("パスワードの変更に失敗しました")
      end
    end
  end
end
