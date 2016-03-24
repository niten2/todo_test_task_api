class Api::V1::ReportsController < Api::V1::BaseController

  def by_author
    start_date = params[:start_date]
    end_date = params[:end_date]
    email = params[:email]

    if User.send_report(start_date, end_date, email)
      render json: { "message" => "Report generation started" }
    else
      render json: { "errors" => "Report can't send, format date: 'DD/MM/YYYY'" }
    end

  end

end

