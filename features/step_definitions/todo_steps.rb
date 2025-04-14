Given('I am on the “Sign Up” page') do
  visit new_user_path
end

When('I input my information for username, e-mail, and password') do
  fill_in "user_username", with: "user1"
  fill_in "user_email_address", with: "user1@example.com"
  fill_in "user_password", with: "user1password"
  fill_in "user_password_confirmation", with: "user1password"
end

When('I click the “Sign Up” button') do
  click_on "Sign Up"
end

Then('my account should be created using that information') do
  expect(page).to have_content("Logout")
end

Given('a user exists with email {string} and password {string}') do |email, password|
  User.create!(
    username: "user1",
    email_address: email,
    password: password,
    password_confirmation: password
  )
end

When('I log in as {string} with password {string}') do |email, password|
  visit new_session_path
  fill_in "email_address", with: email
  fill_in "password", with: password
  click_on "Log In"
end

When('I input my username and password') do
  fill_in "email_address", with: "user1@example.com"
  fill_in "password", with: "user1password"
end

When('I click the “Log In” button') do
  click_on "Log in"
end

Then('I should be logged into my account') do
  expect(page).to have_content("Logout")
end

Given("I have a user, 2 recipes") do
  User.where(email_address: "user1@example.com").destroy_all

  user = User.create!(
    username: "user1",
    email_address: "user1@example.com",
    password: "secret123"
  )

  Recipe.create!(
    title: "Recipe A",
    ingredients: "Eggs, Cheese, Toast",
    instructions: "Mix and cook.",
    user: user
  )

  Recipe.create!(
    title: "Recipe B",
    ingredients: "Tomatoes, Pasta",
    instructions: "Boil pasta and mix with sauce.",
    user: user
  )
end

When('I go to the recipes page') do
  visit recipes_path
end

When('I click on "Create Recipe" button') do
  click_on "Create Recipe"
end

When('add information such as description, ingredients, and title') do
  fill_in "recipe_title", with: "Test Recipe"
  fill_in "recipe_ingredients", with: "Eggs, Cheese, Toast"
  fill_in "recipe_instructions", with: "Toast the bread. Add cheese. Add eggs."
end

When('click on "Post Recipe" button') do
  click_on "Post Recipe"
end

Then("the recipe using my information should be posted and viewable to other users") do
  expect(page).to have_content("Test Recipe")
end

Given("I am on a recipe page") do
  user = User.create!(email_address: "user@example.com", username: "user1", password: "password", password_confirmation: "password")
  recipe = Recipe.create!(title: "Test Dish", ingredients: "Eggs, Cheese", instructions: "Mix and cook", user: user)
  visit recipe_path(recipe)
end

When('I type a rating') do
  fill_in "rating", with: "4"
end

Then('that rating should be applied to the recipe') do
  expect(page).to have_content("Rated 4 stars")
end

When('I type out a comment in the section') do
  fill_in "comment", with: "Example comment"
end

When('I click the “Add Comment” button') do
  click_on "Add Comment"
end

Then('my comment should be visible on the recipe page') do
  expect(page).to have_content("Example comment")
end

When('I click on the “Save Recipe” button') do
  click_on "Save Recipe"
end

Then('that recipe should be added to my account’s “Favorites” list of recipes') do
  visit favorites_path
  expect(page).to have_content(@recipe.title)
end

When("I click on the search bar") do
  find("input[name='search']").click
end

When('I type in keywords') do
  fill_in "search", with: "Steak"
end

When('I click "Search" button') do
  find("input[name='search']").click
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
  user = User.find_or_create_by!(email_address: "viewer@example.com") do |u|
    u.username = "viewer"
    u.password = "viewerpass"
    u.password_confirmation = "viewerpass"
  end

  @recipe = Recipe.find_or_create_by!(title: "Ham Sandwich", user: user) do |r|
    r.description = "Delicious ham sandwich recipe"
    r.ingredients = "Ham, Bread, Cheese"
    r.instructions = "Stack ingredients and serve."
  end

  visit recipe_path(@recipe)
end

When('I click on the recipe title') do
  click_on "Ham Sandwich"
end

Then('I should be taken to that recipe page') do
  expect(current_path).to eq(recipe_path(@recipe))
end

Then('I should be able to view all its information') do
  expect(page).to have_content("Ham Sandwich")
  expect(page).to have_content("User4 recipe")
  expect(page).to have_content("Ham, Bread, Cheese")
end

Given('I am on the {string} page') do |string|
  case string
  when "Sign Up"
    visit new_user_path
  when "Log In"
    visit new_session_path
  when "Main"
    visit root_path
  end
end

When('I click the {string} button') do |string|
  click_on string
end

When('I visit the login page') do
  visit new_session_path
end

When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value
end

When('I press {string}') do |string|
  click_button string
end

Then('I should be on the main page') do
  expect(current_path).to eq(root_path)
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

Then('I should be on the login page') do
  expect(current_path).to eq(new_session_path)
end

Then("my comment should be visible on the recipe's page") do
  expect(page).to have_css(".comments", text: "Example comment")
end

Given("there are posted recipes") do
  User.where(email_address: "user1@example.com").destroy_all

  @user = User.create!(
    username: "user1",
    email_address: "user1@example.com",
    password: "user1password",
    password_confirmation: "user1password"
  )

  visit new_session_path
  fill_in "email_address", with: "user1@example.com"
  fill_in "password", with: "user1password"
  click_on "Log In"

  Recipe.create!(
    title: "Recipe 1",
    ingredients: "Ingredient list 1",
    instructions: "Instructions 1",
    user: @user
  )

  Recipe.create!(
    title: "Recipe 2",
    ingredients: "Ingredient list 2",
    instructions: "Instructions 2",
    user: @user
  )
end


When('I click on the recipe') do
  click_on @recipe.title
end

Then("I should be taken to that recipe's page") do
  expect(current_path).to eq(recipe_path(@recipe))
end

Then("that recipe should be added to my account's {string} list of recipes") do |list|
  visit favorites_path
  expect(page).to have_content(@recipe.title)
end

When('I click on the {string} button') do |string|
  click_on string
end