class BoardSeatsController < OptionsController

	def index
		inject_option_headers
		if board = get_board(params[:board_id], params)
			render json: RestResponse.success(board.board_seats)
		else
			notFound('No board found')
		end
	end

	def show
		inject_option_headers
		if board = get_board(params[:board_id], params)
			render json: RestResponse.success(board.seats.where(id: params[:id]))
		else
			RestResponse.notFound('No board found')
		end

	end

	def new

	end

	
	def create
		inject_option_headers
		params[:board_seat][:board_id] = params[:board_id]
		board_seat = BoardSeat.new(params[:board_seat])
		if board_seat.save!
			render json: RestResponse.success(board_seat)
		else
			RestResponse.notFound('Could not create Board Seat')
		end
	end

end
