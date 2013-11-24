# lib/utility/rest_response
class RestResponse
	def self.failed( reason )
		return { success: false, message: reason, data: nil }.to_json
	end
	
	def self.success( content)
		return { success: true, message: '', data: content }.to_json
	end
	
	def self.notFound( reason )
		raise ActionController::RoutingError.new( reason )
	end
end