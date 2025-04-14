require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "is valid with a user" do
    user = User.create(
      username: "user1",
      email_address: "user1@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    recipe = Recipe.new(user: user)
    expect(recipe).to be_valid
  end

  it "is invalid without a user" do
    recipe = Recipe.new(user: nil)
    recipe.valid?
    expect(recipe.errors[:user]).to include("can't be blank")
  end
end
