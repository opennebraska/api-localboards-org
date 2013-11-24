class DepartmentsController < OptionsController
	def index
		inject_option_headers
		if params[:city_id] 
			if city =City.where(id: params[:city_id].to_i).first
				render json: RestResponse.success(city.departments)
			else
				RestResponse.notFound("Not a city")
			end
		elsif params[:county_id]
			if county =County.where(id: params[:county_id].to_i).first
				render json: RestResponse.success(county.departments)
			else
				RestResponse.notFound("Not a city")
			end
		elsif params[:state_id]
			if state =State.where('lower(abbreviation) = ?', params[:state_id]).first
				render json: RestResponse.success(state.departments)
			else
				RestResponse.notFound("Not a city")
			end
		else
			render json: RestResponse.success(Department.all)
		end
	end
end
