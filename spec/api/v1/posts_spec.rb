require 'rails_helper'

describe 'Request API' do

  describe 'GET /index' do

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
      last_created_at_id = Post.last.id

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

  describe 'GET /show' do

    let!(:user) { create(:user) }
    let!(:post) { create(:post, user: user) }

    it 'returns 200 status code' do
      get "/api/v1/posts/#{post.id}"
      expect(response).to be_success
    end

    %w(id title body published_at author_nickname).each do |attr|
      it "does contain #{attr}" do
        get "/api/v1/posts/#{post.id}"
        expect(response.body).to have_json_path("#{attr}")
      end
    end

    it "give non exist post" do
      get "/api/v1/posts/999"

      error = { error: "Not found" }
      expect(response.body).to eq error.to_json
    end

  end

  describe 'POST /create' do
    let(:user) { create(:user) }
    # let(:post) { attributes_for(:post, user: user) }

    context 'with valid attributes' do
      # it 'creates a new question' do
      #   expect { post "/api/v1/questions/#{question.id}/answers", answer: attributes_for(:answer), format: :json, access_token: access_token.token }.to change(me.answers, :count).by(1)
      # end

      it 'returns success code ' do
        post "/api/v1/posts", post: attributes_for(:post)
        expect(response).to be_success
      end
    end

    context 'with invalid attributes' do
    #   it 'does not create a new question' do
    #     expect { post "/api/v1/questions/#{question.id}/answers", answer: attributes_for(:invalid_answer), format: :json, access_token: access_token.token }.to_not change(Answer, :count)
    #   end
      it 'returns 422 code' do
        # binding.pry
        # post "/api/v1/posts.json", format: :json
        # post "/api/v1/questions/#{question.id}/answers", answer: attributes_for(:invalid_answer), format: :json, access_token: access_token.token
        # expect(response.status).to eq 422
      end


    end
  end



end

