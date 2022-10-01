FactoryBot.define do
  factory :question do
    sequence(:body) { |n| "Какая страна для тебя на месте #{n}?" }

    sequence(:answer) { |n| "Страна #{n}"}

    association :user
    association :author, factory: :user
  end

  factory :question_without_user, class: Question do
    sequence(:body) { |n| "Сколько ты собрал наборов Лего из серии #{n}?" }

    sequence(:answer) { |n| "#{n} наборов"}

    association :user
  end
end
