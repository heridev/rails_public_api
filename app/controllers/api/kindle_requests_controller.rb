class Api::KindleRequestsController < Api::AuthController

  load_and_authorize_resource

  respond_to :json

  PER_PAGE_RECORDS = 9

  skip_before_filter :verify_authenticity_token

  def index
    kindles_paginated = KindleRequest.order('id').page(params[:page]).per(PER_PAGE_RECORDS)
    json_response = {
      models: kindles_paginated,
      current_page: params[:page].to_i,
      perPage: PER_PAGE_RECORDS,
      total_pages: kindles_paginated.num_pages
    }
    respond_with json_response
  end

  def create
    kindle = current_user.kindle_requests.create(kindle_request_params)
    respond_with kindle, location: nil
  end

  def show
    respond_with current_user.kindle_requests.find(params[:id])
  end

  def update
    respond_with current_user.kindle_requests.update(params[:id], kindle_params)
  end

  def destroy
    respond_with current_user.kindle_requests.destroy(params[:id])
  end

  private

  def kindle_request_params
    params.require(:kindle_request).permit(:status, :user_id, :kindle_id)
  end
end
