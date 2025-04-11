class UserMailerPreview < ActionMailer::Preview
  def password_reset
    user = User.first || User.create!(email_address: "demo@example.com", password: "demo123")
    UserMailer.with(user: user).password_reset
  end
end
