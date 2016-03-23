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

    context 'authorization' do
      context 'with valid attributes' do

        it 'creates a new post' do
          user = create(:user)
          @auth_headers = user.create_new_auth_token
          expect { post "/api/v1/posts", attributes_for(:post).merge(@auth_headers) }.to change(Post, :count).by(1)
        end

        it 'returns success code' do
          user = create(:user)
          @auth_headers = user.create_new_auth_token
          post "/api/v1/posts", attributes_for(:post).merge(@auth_headers)
          expect(response.status).to eq 200
        end

        %w(id title body published_at author_nickname).each do |attr|
          it "does contain #{attr}" do
            user = create(:user)
            @auth_headers = user.create_new_auth_token
            post "/api/v1/posts", attributes_for(:post).merge(@auth_headers)
            expect(response.body).to have_json_path("#{attr}")
          end
        end

        it 'if published_at nil, published_at = Time.now' do
          user = create(:user)
          @auth_headers = user.create_new_auth_token

          @time_now = Time.now
          allow(Time).to receive(:now).and_return(@time_now)

          post "/api/v1/posts", {title: "title", body: "body"}.merge(@auth_headers)
          response_time = JSON.parse(response.body)["published_at"]
          expect(response_time).to eq @time_now.strftime("%d %B, %H:%M:%S ")
        end

        it 'if published_at present' do
          user = create(:user)
          @auth_headers = user.create_new_auth_token

          time = Time.now.utc + 10.hours

          post "/api/v1/posts", {title: "title", body: "body", published_at: time}.merge(@auth_headers)
          response_time = JSON.parse(response.body)["published_at"]
          expect(response_time).to eq time.strftime("%d %B, %H:%M:%S ")
        end

        it 'if title nil' do
          user = create(:user)
          @auth_headers = user.create_new_auth_token

          post "/api/v1/posts", {title: "", body: "body"}.merge(@auth_headers)
          response_errors = JSON.parse(response.body)["errors"]
          expect(response_errors["title"]).to eq ["can't be blank"]
        end

        it 'if body nil' do
          user = create(:user)
          @auth_headers = user.create_new_auth_token

          post "/api/v1/posts", {title: "title", body: ""}.merge(@auth_headers)
          response_errors = JSON.parse(response.body)["errors"]
          expect(response_errors["body"]).to eq ["can't be blank"]
        end
      end

      context 'with invalid attributes' do

        it 'does not create a new post' do
          user = create(:user)
          @auth_headers = user.create_new_auth_token
          expect { post "/api/v1/posts", {  title: "", body: "", published_at: "" }.merge!(@auth_headers) }.to_not change(Post, :count)
        end

        it 'returns 422 code' do
          user = create(:user)
          @auth_headers = user.create_new_auth_token
          post "/api/v1/posts", {  title: "", body: "", published_at: "" }.merge!(@auth_headers)
          expect(response.status).to eq 422
        end
      end
    end

    context 'non authorization' do
      it 'returns 401 code' do
        post "/api/v1/posts", attributes_for(:post)
        expect(response.status).to eq 401
      end

      it 'error authorized' do
        post "/api/v1/posts", attributes_for(:post)
        response_errors = JSON.parse(response.body)
        expect(response_errors["errors"]).to eq ["Authorized users only."]
      end
    end

  end


end

