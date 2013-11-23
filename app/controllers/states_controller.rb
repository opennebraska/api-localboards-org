class StatesController < ApplicationController

	def index
		states = State.all
		render json: states
	end
	
	def show
		if params[:id]
			state = get_jurisdiction(params[:id])
			render json: {cities: state.cities}
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
