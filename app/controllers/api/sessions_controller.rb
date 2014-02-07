class Api::SessionsController < ApplicationController
  respond_to :json

  def create
    client_id = ENV['CLIENT_ID']
    access_token = params[:access_token]
    token_status = AuthTokenService.verify_token(access_token, client_id)
    user_info = AuthUserService.create(access_token, token_status)

    if user_info['errors'].nil?
      render status: :ok, json: user_info
    else
      render status: :unprocessable_entity, json: user_info['errors']
    end
  end

  def destroy
    access_token = params[:access_token]
    user = User.destroy_session(access_token)
    respond_with user
  end
end

