class Api::AuthController < ApplicationController

  before_filter :authenticate_user

  def authenticate_user
    token = request.headers['userToken']
    render status: 401, json: {} unless current_user(token)
  end
end
