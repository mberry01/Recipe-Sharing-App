FactoryBot.define do
  factory :recipe do
    title { "Spaghetti Bolognese" }
    ingredients { "Spaghetti, ground beef, tomato sauce" }  # ✅ Add this line
    instructions { "Boil water, add pasta, mix with sauce." }
    association :user
  end
end
