FactoryGirl.define do

  factory :comment, class: Comment do

    sequence(:body) { Faker::Hipster.sentence }
    sequence(:published_at) { Faker::Date.between(2.days.ago, Date.today) }

    association :user, factory: :user

  end

end

