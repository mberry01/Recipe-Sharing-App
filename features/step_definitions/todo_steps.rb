Given('I am on the “Sign Up” page') do
  visit new_session_path
end

When('I input my information for username, e-mail, and password') do
  fill_in "username", with: "user1"
  fill_in "email", with: "user1@example.com"
  fill_in "password", with: "user1password"
end

When('I click the “Sign Up” button') do
  click_on "Sign Up"
end

Then('my account should be created using that information') do
  expect(page).to have_content("Welcome, user1")
end

Given('I am on the “Log In” page') do
  visit new_session_path
end

When('I input my username and password') do
  fill_in "username", with: "user1"
  fill_in "password", with: "user1password"
end

When('I click the “Log In” button') do
  click_on "Log in"
end
Then('I should be logged into my account') do
  expect(page).to have_content("Logged in as user1")
end

Given('I have a user, 2 recipes') do
  @user1 = User.create!(username: "user1", email: "user1@example.com", password: "user1password")
  @recipe1 = Recipe.create!(title: "Recipe 1", description: "First recipe", ingredients: "4, 5, 6", user: @user)
  @recipe2 = Recipe.create!(title: "Recipe 2", description: "Second recipe", ingredients: "1, 2, 3", user: @user)
end

When('I click on "Create Recipe" button') do
  click_on "Create Recipe"
end

When('add information such as description, ingredients, and title') do
  fill_in "title", with: "recipe1"
  fill_in "description", with: "First Recipe"
  fill_in "ingredients", with: "Item1, Item2"
end

When('click on "Post Recipe" button') do
  click_on "Post Recipe"
end

Then('the recipe using my information should be posted and viewable to other users') do
  expect(page).to have_content("recipe1")
  expect(page).to have_content("First Recipe")
  expect(page).to have_content("Item1, Item2")
end

Given('I am on a recipe page') do
  @user = User.create(username: "user1", email: "user1@example.com", password: "user1password")
  @recipe = Recipe.create(title: "Recipe", description: "Example recipe", ingredients: "1, 2, 3", user: @user)
  visit recipe_path(@recipe)
end

When('I type a rating') do
  fill_in "rating", with: "4"
end

Then('that rating should be applied to the recipe') do
  expect(page).to have_content("Rated 4 stars")
end

Given('I am on a recipe page') do
  @user = User.create(username: "user1", email: "user1@example.com", password: "user1password")
  @recipe = Recipe.create(title: "Recipe", description: "Example recipe", ingredients: "1, 2, 3", user: @user)
  visit recipe_path(@recipe)
end

When('I type out a comment in the section') do
  fill_in "comment", with: "Example comment"
end

When('I click the “Add Comment” button') do
  click_on "Add Comment"
end

Then('my comment should be visible on the recipe’s page') do
  expect(page).to have_content("Example comment")
end

When('I click on the “Save Recipe” button') do
  click_on "Save Recipe"
end

Then('that recipe should be added to my account’s “Favorites” list of recipes') do
  visit favorites_path
  expect(page).to have_content(@recipe.title)
end

Given('I click on the search bar') do
  click on "Search Bar"
end

When('I type in keywords') do
  fill_in "search", with: "Steak"
end

When('I click "Search" button') do
  click_on "Search"
end

Then('recipes using those keywords in their titles should appear') do
  expect(page).to have_content("Steak")
end

Given('I click on the "Filters" button') do
  click_on "Filters"
end

When('I click on a filter') do
  check "Vegan"
end

When('I click "Apply Filter" button') do
  click_on "Apply Filter"
end

Then('recipes using those filters should appear') do
  expect(page).to have_content("Vegan")
end

When('I go to the home page') do
  visit root_path
end

Then('I should be able to see all the recipes') do
 expect(page).to have_content("Recipe 1")
 expect(page).to have_content("Recipe 2")
end

Given('I want to view a specific recipe') do
  @user = User.create(username: "user4", email: "user4@example.com", password: "user4password")
  @recipe = Recipe.create(title: "Ham Sandwich", description: "User4 recipe", ingredients: "Ham, Bread, Cheese", user: @user)
  visit root_path
end

When('I click on the recipe title') do
  click_on "Ham Sandwich"
end

Then('I should be taken to that recipe page') do
  expect(current_path).to eq(recipe_path(@recipe))
end

Then('I should be able to view all its information') do
  expect(page).to have_content("Ham Sandwich")
  expect(page).to have_content("User4 Recipe")
  expect(page).to have_content("Ham, Bread, Cheese")
end