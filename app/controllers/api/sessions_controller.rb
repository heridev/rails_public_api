class Api::SessionsController < ApplicationController
  respond_to :json

  def create
    client_id = ENV['CLIENT_ID']
    access_token = params[:access_token]
    is_google_client_present? client_id
    token_status = AuthTokenService.verify_token(access_token, client_id)
    user_info = AuthUserService.create(access_token) if token_status

    if user_info && user_info['errors'].nil?
      render status: :ok, json: user_info
    else
      render status: :unprocessable_entity, json: user_info
    end
  end

  def destroy
    access_token = params[:access_token]
    user = User.destroy_session(access_token)
    respond_with user
  end

  private

  def is_google_client_present? client_id
    if client_id.blank?
      Rails.logger.error '====================================================='
      Rails.logger.error 'The Google Client id is empty please do the following'
      Rails.logger.error 'run in console export CLIENT_ID=yournumberofclientid'
      Rails.logger.error '====================================================='
    end
  end
end

