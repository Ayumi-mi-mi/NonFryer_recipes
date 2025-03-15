require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /pages" do
    it "利用規約ページにアクセスできること" do
      get "/pages/rule"
      expect(response).to have_http_status(200)
    end

    it "プライバシーポリシーページにアクセスできること" do
      get "/pages/policy"
      expect(response).to have_http_status(200)
    end
  end
end
