FactoryGirl.define do

  factory :comment, class: Comment do

    sequence(:body) { Faker::Hipster.sentence }

    association :user, factory: :user

  end

end

