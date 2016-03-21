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

    # it "count page" do
    #   per_page = rand(1...5)
    #   get '/api/v1/posts', page: 1, per_page: per_page
    #   expect(response.body).to have_json_size(per_page)
    # end

    # it "empty model" do
    #   get '/api/requests/find_nomenclature_repairs', format: :json
    #   expect(response.body).to have_json_size(0).at_path("requests")
    # end

  end

end

