class UserMailer < ApplicationMailer

  def report(start_date, end_date, email)
    @users = User.all

    @start_date = start_date
    @end_date = end_date

    @email = email

    mail(to: @email, subject: "Аналитический отчёт c #{@start_date} по #{@end_date}")
  end

end
