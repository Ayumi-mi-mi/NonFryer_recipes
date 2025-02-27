require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "reset_password_email" do
    user = users(:example_user)
    user.reset_password_token = "dummy_token"
    user.save!
    mail = UserMailer.reset_password_email(user)
    assert_equal "パスワードリセットのお知らせ", mail.subject
    assert_equal [ "example@example.com" ], mail.to
  end
end
