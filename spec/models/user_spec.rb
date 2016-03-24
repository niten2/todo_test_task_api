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

  describe "rating_for_sort" do
    it "start_date or end_date = nil" do
      user     = create(:user)
      posts    = create_list(:post, 5, user: user)
      comments = create_list(:comment, 5, user: user)
      expect(user.rating).to eq 5.5
    end

    it "if post not range" do
      user     = create(:user)
      posts    = create_list(:post, 5, user: user, published_at: Time.now.utc - 11.hours)
      comments = create_list(:comment, 5, user: user, published_at: Time.now.utc)

      start_date = Time.now.utc - 10.hours
      end_date   = Time.now.utc + 10.hours

      expect(user.rating(start_date, end_date)).to eq 0.5
    end

    it "if comments not range" do
      user     = create(:user)
      posts    = create_list(:post, 5, user: user, published_at: Time.now.utc)
      comments = create_list(:comment, 5, user: user, published_at: Time.now.utc + 11.hours)

      start_date = Time.now.utc - 10.hours
      end_date   = Time.now.utc + 10.hours

      expect(user.rating(start_date, end_date)).to eq 5
    end

  end


end
