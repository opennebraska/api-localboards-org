class OptionsController < ApplicationController
  before_filter :inject_option_headers
  
  def options
      inject_cors_headers
      head :ok
  end

  def inject_option_headers( )
    if whitelist_headers?
      headers['Content-Type'] = 'application/json'
      if request.env['HTTP_ORIGIN']
        headers["Access-Control-Allow-Origin"] = request.env['HTTP_ORIGIN']
        headers["Access-Control-Allow-Methods"] = 'POST, GET, OPTIONS, PUT, DELETE'
        headers["Access-Control-Allow-Headers"] = '*'
      end
    else
      head :bad_request
      return false
    end

  end

  def inject_cors_headers( )
    headers["Access-Control-Allow-Origin"] = request.env['HTTP_ORIGIN']
    headers['Content-Type'] = 'application/json'
    headers["Access-Control-Allow-Methods"] = 'POST, GET, OPTIONS, PUT, DELETE'
    headers["Access-Control-Allow-Headers"] = '*,Content-Type'

    head(:ok) if request.request_method == "OPTIONS"
    # or, render text: ''
    # if that's more your style
  end
end