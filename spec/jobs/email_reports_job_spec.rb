require 'rails_helper'

describe EmailReportsJob do
  let!(:user) { create(:user) }

  it 'send mail' do
    start_date = "11/02/2005"
    end_date   = "11/02/2019"
    email      = "test@test.com"

    expect(UserMailer).to receive(:report).with(start_date, end_date, email).and_call_original
    EmailReportsJob.perform_now(start_date, end_date, email)
  end

end
