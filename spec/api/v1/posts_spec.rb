require 'rails_helper'

describe 'Request API' do

  describe 'GET /index' do

    let!(:user) { create(:user) }
    let!(:post) { create_list(:post, 5, user: user) }

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

    # it "header count page and recording" do
      #   get '/api/requests/find_nomenclature_repairs', format: :json
      #   expect(response.body).to have_json_size(0).at_path("requests")
      # end
    # end
  end

end

