require "application_responder"

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  self.responder = ApplicationResponder
  respond_to :html

  # protect_from_forgery with: :exception

  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken


end
