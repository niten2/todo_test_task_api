5.times do

  Comment.seed do |post|
    post.body = Faker::Hipster.sentence
    post.user_id = 1
  end

end

15.times do

  Comment.seed do |post|
    post.body = Faker::Hipster.sentence
    post.user_id = 2
  end

end

10.times do

  Comment.seed do |post|
    post.body = Faker::Hipster.sentence
    post.user_id = 3
  end

end

