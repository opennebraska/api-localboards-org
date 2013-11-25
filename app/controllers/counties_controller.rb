class CountiesController < OptionsController

	def index 
		inject_option_headers

		if params[:state_id]
			state, counties = get_jurisdiction(params[:state_id],nil)
			render json: RestResponse.success(counties)
		else	
			RestResponse.notFound('Invalid API query')
		end
	end

	def show
		inject_option_headers

		if params[:state_id] && params[:id]
			state, county = get_jurisdiction(params[:state_id],params[:id],page,page_start)
			if params[:pg] && params[:pgStart]
				render json: RestResponse.success(county.cities.paginate(page: params[:pg], per_page: params[:pgStart]))
			else
				render json: RestResponse.success(county.cities.pageinate)
			end
		else	
			RestResponse.notFound('Invalid API query')
		end
	end

	def get_jurisdiction(state,county,page=nil,page_start=nil)
		state = State.where("lower(abbreviation) = ?", state.downcase ).first
		if county
			county = County.where(id: county, state_id: state.id).first	
		else
			if state
				county = state.counties
			else
				county = nil
			end
		end

		if county
			return [state,county]
		else
			RestResponse.notFound('Invalid API query')
		end
	end
end