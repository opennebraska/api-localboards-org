class BoardsController < OptionsController
	before_filter :verified_request?

	def index
		inject_option_headers
		# Find the state by the abbreviation
		state, county, city = get_jurisdiction(params[:state_id],params[:county_id],params[:city_id])

		if state && !county && !city
			render json: RestResponse.success( state.boards )
		elsif state && county && city || state && city && !county
			render json: RestResponse.success( city.boards )
		elsif state && county && !city 
			render json: RestResponse.success( county.boards )
		else
			RestResponse.notFound( 'No Response from database' )
		end
	end

	def show
		inject_option_headers
		board = Board.where(id: params[:id]).first
		if board
			render json: RestResponse.success(board)
		else
			RestResponse.notFound( 'Not Found' )
		end
	end

	def create
		inject_option_headers
		state, county, city = get_jurisdiction(params[:state_id],params[:county_id],params[:city_id])
		
		params[:board][:state_id] = state.try(:id)
		params[:board][:county_id] = county.try(:id)
		params[:board][:city_id] = city.try(:id)

		board = Board.new(params[:board])
		if board.save
			RestResponse.success(board)
		else
			RestResponse.failed("Failed to save board with paramaters: #{params[:board]}")
		end
	end

	def update
		inject_option_headers

		board = Board.where(id: params[:id]).first
		if board = board.update_attributes(params[:board])
			render json: RestResponse.success(board)
		else
			RestResponse.notFound( 'Could not update' )
		end
	end

	def destroy

	end

	def get_jurisdiction(state,county,city)
		state = State.where("lower(abbreviation) = ?", state.downcase ).first
		if county
			county = County.where(code_id: county, state_id: state.id).first
			RestResponse.notFound( 'Not Found' ) unless county
		else
			county = nil
		end

		if city
			city = City.where(id: city).first
			RestResponse.notFound( 'Not Found' ) unless city
		else
			city = nil
		end

		return [state,county,city]
	end
end
