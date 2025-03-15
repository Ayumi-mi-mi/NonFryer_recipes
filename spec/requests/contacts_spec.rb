require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /contacts/new" do
    it "お問い合わせページにアクセスできること" do
      get new_contact_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /contacts/new" do
    it "お問い合わせを送信できること" do
      post contacts_path, params: { name: "test_name", email: "test@example.com", message: "test_message" }
      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.body).to include("お問い合わせを送信しました")
    end
  end
end
