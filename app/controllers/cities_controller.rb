class CitiesController < ApplicationController

	def show
		if params[:id] && params[:state_id]
			state, city = get_jurisdiction(params[:state_id],params[:id])
			render json: {counties: city.counties}.to_json
		else
			render json: {fail: 'Invlalid API query'}
		end
	end

	def get_jurisdiction(state,city)
		state = State.where(abbreviation: state).first
		state = State.where(id: state) unless state
		
		city = City.where(name: city, state_id: state.id).first
		city = City.where(id: city, state_id: state.id) unless city

		return [state,city]
	end
end
