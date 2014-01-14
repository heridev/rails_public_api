class Api::KindlesController < ApplicationController
  respond_to :json
  PER_PAGE_RECORDS = 9

  def index
    kindles_paginated = Kindle.order('id').page(params[:page]).per(PER_PAGE_RECORDS)

    respond_to do |format|
      format.json { render :json => { models: kindles_paginated, current_page: params[:page].to_i, perPage: PER_PAGE_RECORDS, total_pages: kindles_paginated.num_pages }, callback: params[:callback] }
    end
  end
end
