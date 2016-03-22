FactoryGirl.define do

  factory :comment, class: Comment do

    sequence(:body) { Faker::Hipster.sentence }
    published_at Time.now

    association :user, factory: :user

  end

end

