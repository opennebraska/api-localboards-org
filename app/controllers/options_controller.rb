class OptionsController < ApplicationController
  def options
    p 'start options def'
    inject_cors_headers
    p 'end before head ok'
    head :ok
  end
  
  def inject_option_headers( )
    p 'start inject options'
    headers['Content-Type'] = 'application/json'
    # if request.remote_ip == '184.187.10.3'
    p 'end conetent type'
    headers["Access-Control-Allow-Origin"] = request.env['HTTP_ORIGIN']
    p 'end origin'
    headers["Access-Control-Allow-Headers"] = '*'
    # end
    p 'end inject options'
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