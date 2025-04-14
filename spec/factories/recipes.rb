FactoryBot.define do
  factory :recipe do
    title { "Spaghetti Bolognese" }
    steps { "Boil water, add pasta, mix with sauce." }
    association :user
  end
end
