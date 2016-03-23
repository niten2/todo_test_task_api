require 'rails_helper'

describe 'Profiles' do

  describe 'GET /api/v1/profiles/:id' do

    it "user exist status 200" do
      user = create(:user)
      get api_v1_profile_path(user)
      expect(response.status).to eq 200
    end

    it "user not exist" do
      not_found = { "error" => "User not found" }.to_json
      get api_v1_profile_path(999)
      expect(response.body).to eq not_found
    end

    %w(email nickname).each do |attr|
      it "does contain #{attr}" do
        user = create(:user)
        get api_v1_profile_path(user)
        expect(response.body).to have_json_path("#{attr}")
      end
    end
  end

end

