require 'rails_helper'

describe 'User' do

  describe 'POST /user' do


    it "create user status 200" do
      post '/api/v1/auth', attributes_for(:user), format: :json
      expect(response.status).to eq 200
    end

    it "change count User" do
      expect { post "/api/v1/auth/", attributes_for(:user) }.to change(User, :count).by(1)
    end

    it "sign in" do
      user = create(:user)
      post '/api/v1/auth/sign_in', format: :json, email: user.email, password: user.password
      expect(response.status).to eq 200
    end

  end

end

