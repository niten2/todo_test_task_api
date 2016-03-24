require 'rails_helper'

describe Post do

  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  describe "author_nickname" do

    it "return name" do
      user = create(:user)
      post = create(:post, user: user)
      expect(post.author_nickname).to eq user.nickname
    end

    it "return nil" do
      post = create(:post, user: nil)
      expect(post.author_nickname).to eq nil
    end

  end

  describe "set_published_at_if_empty" do

    it "send published_at nil" do
      time_now = Time.now
      allow(Time).to receive(:now).and_return(time_now)

      post = create(:post, published_at: nil)
      expect(post.published_at).to eq time_now
    end

    it "send published_at" do
      time_now = Time.now.utc + 10.hours

      post = create(:post, published_at: time_now)
      expect(post.published_at).to eq time_now
    end

  end

  describe "set_author" do
    it "user exist" do
      user = create(:user)
      post = create(:post, user: user)
      expect(post.author).to eq user.id
    end

    it "user non exist" do
      post = create(:post, user: nil)
      expect(post.author).to eq nil
    end
  end


end
