require 'rails_helper'

RSpec.describe Recipe, type: :model do

  it "is valid with a user, title, ingredients, and instructions" do
    recipe = Recipe.create(
      user: FactoryBot.create(:user),
      title: "Pasta Dish",
      ingredients: "Noodles, Sauce",
      instructions: "Boil noodles and mix with sauce"
    )
    expect(recipe).to be_valid
  end

  it "is not valid without a user" do
    recipe = Recipe.create(
      user: nil,
      title: "Pasta Dish",
      ingredients: "Noodles, Sauce",
      instructions: "Boil noodles and mix with sauce"
    )
    expect(recipe).not_to be_valid
  end

  it "is not valid without a title" do
    recipe = Recipe.create(
      user: FactoryBot.create(:user),
      title: "",
      ingredients: "Noodles, Sauce",
      instructions: "Boil noodles"
    )
    expect(recipe).not_to be_valid
  end

  it "is not valid without ingredients" do
    recipe = Recipe.create(
      user: FactoryBot.create(:user),
      title: "Test",
      ingredients: "",
      instructions: "Cook it"
    )
    expect(recipe).not_to be_valid
  end

  it "is not valid without instructions" do
    recipe = Recipe.create(
      user: FactoryBot.create(:user),
      title: "Test",
      ingredients: "Salt, Pepper",
      instructions: ""
    )
    expect(recipe).not_to be_valid
  end
end
