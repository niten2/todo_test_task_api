require 'rails_helper'

describe 'Index' do

  describe 'GET /api/v1/posts' do

    let!(:user) { create(:user) }
    let!(:posts) { create_list(:post, 5, user: user) }

    it "count per_page" do
      per_page = rand(1...5)
      get '/api/v1/posts', page: 1, per_page: per_page
      expect(response.body).to have_json_size(per_page)
    end

    it "sort published_at DESC" do
      get '/api/v1/posts'

      first_object_id = JSON.parse(response.body).first["id"]
      last_created_at_id = Post.order("published_at").last.id

      expect(first_object_id).to eq last_created_at_id
    end

    it "header count page and recording" do
      get '/api/v1/posts', page: 1, per_page: 2

      expect(response.headers["pages"]).to eq "3"
      expect(response.headers["posts"]).to eq Post.count.to_s
    end

    %w(id title body published_at author_nickname).each do |attr|
      it "does contain #{attr}" do
        get "/api/v1/posts/"
        expect(response.body).to have_json_path("0/#{attr}")
      end
    end

  end

end

