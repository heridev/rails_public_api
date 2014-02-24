class Api::JobServicesController < ApplicationController

  respond_to :json

  def check_expired_kindle_requests
    users = User.expired_requests.pluck(:name)
    Notifier.expired_requests(users).deliver unless users.empty?
    respond_with :ok
  end
end

