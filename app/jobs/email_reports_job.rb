class EmailReportsJob < ActiveJob::Base

  def perform(start_date, end_date, email)
    UserMailer.report(start_date, end_date, email).deliver_now
  end

end



