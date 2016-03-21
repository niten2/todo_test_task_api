FactoryGirl.define do

  factory :comment, class: Comment do

    sequence(:body) { Faker::Lorem.words(5) }

    association :user, factory: :user

  end

end

