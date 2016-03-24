require 'rails_helper'

describe 'Reports' do

  describe 'POST /api/v1/reports/by_author' do

    it "reports send" do
      user = create(:user)
      auth_headers = user.create_new_auth_token

      post api_v1_api_v1_reports_by_author_path, auth_headers

      expect(response.status).to eq 200
    end

    it "reports can't send" do
      user = create(:user)
      get api_v1_profile_path(user)
      expect(response.status).to eq 200
    end

  end

end

