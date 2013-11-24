# class SeatsController < OptionsController
# 	def index
# 		inject_option_headers
# 		if board = get_board(params[:board_id], params)
# 			RestResponse.success(board.board_seats)
# 		else
# 			RestResponse.notFound('No board found')
# 		end
# 	end

# 	def show
# 		inject_option_headers
# 		if board = get_board(params[:board_id], params)
# 			RestResponse.success(board.seats.where(id: params[:id]))
# 		else
# 			RestResponse.notFound('No board found')
# 		end
# 	end


# end

# DELETE THIS