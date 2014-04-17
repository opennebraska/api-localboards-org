class StatesController < OptionsController
	def index
		if params[:pg] && params[:pgSize]
			states = State.paginate(page: params[:pg], per_page: params[:pgSize])
		else
			states = State.all
		end
		render json: RestResponse.success(states)
	end
	
	def show
		if params[:id]
			state = get_jurisdiction(params[:id])
			render json: RestResponse.success(state.cities)
		else	
			RestResponse.notFound( 'Invalid API query')
		end
	end

	def get_jurisdiction(state_abbr)
		state = State.where("lower(abbreviation) = ?", state_abbr.downcase).first
		if state
			return state
		else
			RestResponse.notFound('Invalid API query')
		end
	end

end
