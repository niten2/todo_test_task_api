class Api::V1::BaseController < ApplicationController

  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken

  respond_to :json

end
