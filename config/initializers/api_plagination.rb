ApiPagination.configure do |config|
  config.paginator = :will_paginate

  config.total_header = 'X-Total'
  config.per_page_header = 'X-Per-Page'
  config.page_header = 'X-Page'

  config.page_param = :page
  # or
  config.page_param do |params|
    params[:page][:number]
  end

  # Optional: what parameter should be used to set the per page option
  config.per_page_param = :per_page
  # or
  # config.per_page_param do |params|
  #   params[:page][:size]
  # end
end
