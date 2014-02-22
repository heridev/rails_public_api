class Api::KindleRequestsController < Api::AuthController

  load_and_authorize_resource

  respond_to :json

  PER_PAGE_RECORDS = 9

  skip_before_filter :verify_authenticity_token

  def index
    type = (params[:type] && params[:type].empty?) ? 'in_progress' : params[:type]
    kindles_paginated = KindleRequest.created_status_order(type)
                                     .page(params[:page])
                                     .per(PER_PAGE_RECORDS)
    json_response = {
      models: decorate_kindle_requests(kindles_paginated),
      current_page: params[:page].to_i,
      perPage: PER_PAGE_RECORDS,
      total_pages: kindles_paginated.num_pages
    }
    respond_with json_response
  end

  def create
    kindle = current_user.kindle_requests.create(kindle_request_params)
    decorated_kindle = KindleRequestDecorator.decorate(kindle)
    Notifier.create_request(current_user).deliver if kindle.errors.empty?
    respond_with decorated_kindle, location: nil
  end

  def show
    kindle = KindleRequest.find(params[:id])
    respond_with KindleRequestDecorator.decorate(kindle), root: false
  end

  def update
    respond_with KindleRequest.update(params[:id], kindle_request_params)
  end

  def destroy
    respond_with KindleRequest.destroy(params[:id])
  end

  def return_kindle
    respond_with KindleRequest.find(params[:id]).return_kindle
  end

  private

  def decorate_kindle_requests(kindle_requests)
    kin_requests_decorated = KindleRequestDecorator.decorate_collection(kindle_requests)
    ActiveModel::ArraySerializer.new(kin_requests_decorated).as_json
  end

  def kindle_request_params
    params.require(:kindle_request).permit(:status, :user_id, :kindle_id, :amount_day)
  end
end

