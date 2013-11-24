class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :set_access_control_headers

  def set_access_control_headers 
  	headers['Access-Control-Allow-Origin'] = 'http://localhost:3000' 
      headers['Content-Type'] = 'application/json'
  	headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Request-Headers'] = '*' 
  end
end
