require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a username, email, and password" do
    user = User.new(
      username: "user1",
      email_address: "user1@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid with a bad email" do
    user = User.new(email_address: "bademail")
    user.valid?
    expect(user.errors[:email_address]).to include("Must be a valid email")
  end

  it "requires password of at least 6 characters" do
    user = User.new(password: "123", password_confirmation: "123")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end
end
