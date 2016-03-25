require 'rails_helper'

describe Comment do

  it { should validate_presence_of(:body) }
  it { should belong_to(:user) }

  describe "set_published_at_if_empty" do

    it "send published_at nil" do
      time_now = Time.now
      allow(Time).to receive(:now).and_return(time_now)
      comment  = create(:comment, published_at: nil)

      expect(comment.published_at).to eq time_now
    end

    it "send published_at" do
      time_now = Time.now.utc + 10.hours
      comment  = create(:comment, published_at: time_now)

      expect(comment.published_at).to eq time_now
    end

  end

end
