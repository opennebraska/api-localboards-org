# lib/utility/rest_response
class RestResponse
	def self.failed( reason )
		return json: { success: false, message: reason, data: nil }
	end
	
	def self.success( content, code )
		return json: { success: true, message: '', data: content }
	end
	
	def self.notFound( reason )
		raise ActionController::RoutingError.new( reason )
	end
end