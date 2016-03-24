require 'rails_helper'

describe 'Reports' do

  describe 'POST /api/v1/reports/by_author' do

    it "reports send" do
      post api_v1_reports_by_author_path, start_date: "11/02/2012", end_date: "11/02/2015", email: "test@test.com", format: :json
      expect(response.body).to be_json_eql("Report generation started".to_json).at_path("message")
    end

    it "reports send status" do
      post api_v1_reports_by_author_path, start_date: "11/02/2012", end_date: "11/02/2015", email: "test@test.com", format: :json
      expect(response.status).to eq 200
    end

    it "reports can't send" do
      post api_v1_reports_by_author_path
      expect(response.body).to be_json_eql("Report can't send, format date: 'DD/MM/YYYY'".to_json).at_path("errors")
    end

  end

end

