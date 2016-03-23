FactoryGirl.define do

  factory :post, class: Post do

    sequence(:title) { Faker::Name.title }
    sequence(:body) { Faker::Hipster.sentence }
    sequence(:published_at) { Faker::Date.between(2.days.ago, Date.today) }

    association :user, factory: :user
  end

end

