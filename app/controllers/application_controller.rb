class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :set_access_control_headers

	def set_access_control_headers 
		headers['Access-Control-Allow-Origin'] = 'localhost:3000' 
		headers['Access-Control-Request-Method'] = '*' 
	end


end
