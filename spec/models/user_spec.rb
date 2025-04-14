require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a username, email, and password" do
    user = User.create(
      username: "user123",
      email_address: "user@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    expect(user).to be_valid
  end

  it "is not valid without a username" do
    user = User.create(
      username: "",
      email_address: "user@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    expect(user).not_to be_valid
  end

  it "is not valid with an invalid email format" do
    user = User.create(
      username: "user123",
      email_address: "invalidemail",
      password: "password123",
      password_confirmation: "password123"
    )
    expect(user).not_to be_valid
  end

  it "is not valid with a password shorter than 6 characters" do
    user = User.create(
      username: "user123",
      email_address: "user@example.com",
      password: "123",
      password_confirmation: "123"
    )
    expect(user).not_to be_valid
  end

  it "is not valid if username includes invalid characters" do
    user = User.create(
      username: "user!@#",
      email_address: "user@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    expect(user).not_to be_valid
  end
end
