class Api::V1::ProfilesController < Api::V1::BaseController

  before_action :set_user, only: [:show]

  def show
    if @user.present?
      respond_with @user
    else
      render json: { error: "User not found" }, status: 404
    end
  end

private

  def set_user
    @user = User.where(id: params[:id]).take
  end

end

