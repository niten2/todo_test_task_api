FactoryGirl.define do

  factory :post, class: Post do

    sequence(:title) { Faker::Name.title }
    sequence(:body) { Faker::Hipster.sentence }
    published_at Time.now

    association :user, factory: :user
  end

end

