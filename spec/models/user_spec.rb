require 'rails_helper'

describe User do

  it { should have_many(:comments) }
  it { should have_many(:posts) }

  describe "send_report" do

    # it "success" do
    #   user = create(:user)
    #   start_date = Time.now - 10.hours
    #   end_date = Time.now + 10.hours
    #   email = "test@test.com"

    #   user.send_report(start_date, end_date, email)


    # end

    # it "fail" do

    # end

  end

  it "sort_by_rating" do
    user1 = create(:user)
    create(:post,    user: user1)
    create(:comment, user: user1)

    user2 = create(:user)
    create(:post,            user: user2)
    create_list(:comment, 5, user: user2)

    user3 = create(:user)
    create_list(:post,    2, user: user3)
    create_list(:comment, 5, user: user3)

    expect(User.sort_by_rating).to eq [user1, user2, user3]

  end

end
