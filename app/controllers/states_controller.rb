class StatesController < ApplicationController

	def index
		if params[:pg] && params[:pgSize]
			states = State.paginate(page: params[:pg], per_page: params[:pgSize])
		else
			states = State.all
		end
		render json: {states: states}
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
		state = State.where("lower(abbreviation) = ?", state.downcase).first
		state = State.where(id: state) unless state
		if state
			return state
		else
			render json: {fail: 'Invalid API query'}
		end
	end

end
