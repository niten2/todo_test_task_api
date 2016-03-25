class UserMailer < ApplicationMailer

  def report(start_date, end_date, email)
    @users = User.all

    @start_date = start_date
    @end_date = end_date

    @email = email

    mail(to: @email, subject: "Analytical report by #{@start_date} to #{@end_date}")
  end

end
