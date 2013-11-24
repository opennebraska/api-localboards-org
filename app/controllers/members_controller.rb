class MembersController < OptionsController
	def index
		inject_option_headers
		
		if board = get_board(params[:board_id], params)
			render json: RestResponse.success(board.members)
		else
			RestResponse.notFound('No board found')
		end
	end

	def show
		inject_option_headers
		if params[:board_id]
			if board = get_board(params[:board_id], params)
				render json: RestResponse.success(board.members.where(id: params[:id]))
			else
				RestResponse.notFound('No board found')
			end
		else
			if member = Member.find(params[:id])
				render json: RestResponse.success(member)
			else
				RestResponse.notFound('No board found')
			end
		end
	end
end
