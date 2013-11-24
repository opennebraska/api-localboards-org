# lib/utility/rest_response
module RestResponseHelper
	def failed( reason )
		render json: { success: false, message: reason, data: nil }
	end
	
	def success( content)
		render json: { success: true, message: '', data: content }
	end
	
	def notFound( reason )
		raise ActionController::RoutingError.new( reason )
	end
end