class StatesController < OptionsController

	def index
		inject_option_headers

		if params[:pg] && params[:pgSize]
			states = State.paginate(page: params[:pg], per_page: params[:pgSize])
		else
			states = State.all
		end
		render json: RestResponse.success(states)
	end
	
	def show
		inject_option_headers

		if params[:id]
			state = get_jurisdiction(params[:id])
			render json: RestResponse.success(state.cities)
		else	
			RestResponse.notFound( 'Invalid API query')
		end
	end

	def get_jurisdiction(state)
		state = State.where("lower(abbreviation) = ?", state.downcase).first
		state = State.where(id: state) unless state
		if state
			return state
		else
			RestResponse.notFound('Invalid API query')
		end
	end

end
