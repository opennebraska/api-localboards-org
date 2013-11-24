class SeatsController < OptionsController
	include RestResponseHelper

	def index
		# inject_option_headers
		if board = get_board(params[:board_id], params)
			success(board.board_seats)
		else
			notFound('No board found')
		end
	end

	def show
		# inject_option_headers
		if board = get_board(params[:board_id], params)
			success(board.seats.where(id: params[:id]))
		else
			notFound('No board found')
		end

	end
end