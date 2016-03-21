FactoryGirl.define do

  factory :post, class: Post do

    sequence(:title) { Faker::Lorem.word }
    sequence(:body) { Faker::Lorem.words(5) }

    association :user, factory: :user
  end

end

