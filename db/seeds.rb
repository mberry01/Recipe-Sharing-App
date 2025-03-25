# db/seeds.rb

# Clear existing records (if needed)
Recipe.destroy_all

# Create sample recipes
Recipe.create!(
  title: "Spaghetti Bolognese",
  description: "A classic Italian pasta dish with a rich meat sauce.",
  ingredients: "Spaghetti, ground beef, tomatoes, onion, garlic, olive oil, basil, salt, pepper",
  instructions: "1. Cook the spaghetti. 2. Prepare the bolognese sauce. 3. Combine and serve.",
  image: "https://www.recipetineats.com/tachyon/2018/07/Spaghetti-Bolognese.jpg"
)

Recipe.create!(
  title: "Chicken Tikka Masala",
  description: "A flavorful Indian curry made with marinated chicken in a spiced tomato sauce.",
  ingredients: "Chicken, yogurt, tomato paste, onions, garlic, ginger, spices",
  instructions: "1. Marinate the chicken. 2. Cook the chicken in the sauce. 3. Serve with rice.",
  image: "https://www.seriouseats.com/thmb/DbQHUK2yNCALBnZE-H1M2AKLkok=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/chicken-tikka-masala-for-the-grill-recipe-hero-2_1-cb493f49e30140efbffec162d5f2d1d7.JPG"
)

Recipe.create!(
  title: "Chocolate Chip Cookies",
  description: "Soft and chewy chocolate chip cookies, perfect for dessert.",
  ingredients: "Flour, sugar, butter, eggs, chocolate chips, baking soda, vanilla extract",
  instructions: "1. Preheat the oven. 2. Mix ingredients. 3. Bake the cookies.",
  image: "https://media.tenor.com/pbNAvUre4KEAAAAe/costco-guys-costco.png"
)

