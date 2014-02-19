class Api::KindlesController < Api::AuthController

  load_and_authorize_resource

  respond_to :json

  PER_PAGE_RECORDS = 9

  skip_before_filter :verify_authenticity_token

  def index
    kindles_paginated = Kindle.order('id').page(params[:page]).per(PER_PAGE_RECORDS)
    json_response = {
      models: kindles_paginated,
      current_page: params[:page].to_i,
      perPage: PER_PAGE_RECORDS,
      total_pages: kindles_paginated.num_pages
    }
    respond_with json_response
  end

  def create
    kindle = Kindle.create(kindle_params)
    respond_with kindle, location: nil
  end

  def show
    respond_with Kindle.find(params[:id])
  end

  def update
    respond_with Kindle.update(params[:id], kindle_params)
  end

  def destroy
    respond_with Kindle.destroy(params[:id])
  end

  def available
    respond_with Kindle.available.pluck(:id, :inventory_id), root: false
  end

  private

  def kindle_params
    params.require(:kindle).permit(:inventory_id, :status)
  end
end
