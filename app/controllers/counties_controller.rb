class CountiesController < ApplicationController

	def show
		if params[:state_id] && params[:id]
			state, county = get_jurisdiction(params[:state_id],params[:county_id])
			render json: {success: "Will return #{county.name} county in #{state.name} state info"}
		else	
			render json: {fail: 'Invalid API query'}
		end
	end

	def get_jurisdiction(state,county)
		state = State.where(abbreviation: state).first
		state = State.where(id: state) unless state
		
		county = County.where(name: county, state_id: state.id).first
		county = County.where(id: county, state_id: state.id) unless county

		return [state,county]
	end
end
