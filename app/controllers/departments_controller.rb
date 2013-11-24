class DepartmentsController < OptionsController
	def index
		inject_option_headers
		render json: RestResponse.success(Department.all)
	end
end
