FactoryBot.define do
  factory :question do
    sequence(:body) { |n| "Какая страна для тебя на месте #{n}?" }

    sequence(:answer) { |n| "Страна #{n}"}

    association :user
    association :author, factory: :user
  end
end
