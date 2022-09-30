FactoryBot.define do
  factory :user do
    name { "Жора_#{rand(999)}" }
    nickname { "Cool_guy_#{rand(999)}" }

    sequence(:email) { |n| "someguy_#{n}@example.com" }

    after(:build) { |u| u.password_confirmation = u.password = "123456"}
  end
end
