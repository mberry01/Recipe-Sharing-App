FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5..8, separators: %w(_)) }
    email_address { Faker::Internet.email }
    password_user = Faker::Internet.password(min_length: 6)
    password { password_user }
    password_confirmation { password_user }
  end
end
