class Api::AuthController < ApplicationController

  before_filter :authenticate_user

  def authenticate_user
    render status: 401, json: {} unless current_user
  end
end
