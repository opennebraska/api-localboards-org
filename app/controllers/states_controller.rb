class StatesController < ApplicationController

	def index
		
	end
	
	def show
		if params[:id]
			state = get_jurisdiction(params[:id])
			render json: {success: "Shows #{state.name} state info"}
		else	
			render json: {fail: 'Invalid API query'}
		end
	end

	def get_jurisdiction(state)
		state = State.where(abbreviation: state).first
		state = State.where(id: state) unless state

		return state
	end

end
