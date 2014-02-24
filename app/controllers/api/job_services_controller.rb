class Api::JobServicesController < ApplicationController

  respond_to :json

  def check_expired_kindle_requests
    users_with_expired_requests = User.expired_requests.pluck(:name)
    Notifier.expired_requests(users_with_expired_requests).deliver
    respond_with :ok
  end
end

