class BoardSeatsController < OptionsController
	def show
		inject_option_headers
		
		if params[:board_id]
			seats = get_boardSeats(params[:id],page,page_start)
			if params[:pg] && params[:pgStart]
				render json: {board_seats: seats.paginate(page: params[:pg], per_page: params[:pgStart])}
			else
				render json: {board_seats: seats.pageinate}
			end
		else	
			render json: {fail: 'Invalid API query'}
		end
	end
	
	def get_boardSeats( id, page=null, page_start=null )
		board = BoardSeats.where(board_id: id).first
		return [board]
	end
end
