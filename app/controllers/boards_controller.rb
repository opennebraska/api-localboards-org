class BoardsController < ApplicationController
	
	def index
		# Find the state by the abbreviation
		state, county, city = get_jurisdiction(params[:state_id],params[:county_id],params[:city_id])

		if state && !county && !city
			render json: {success: 'this shows a states info'}
		elsif state && county && city || state && city && !county
			render json: {success: 'this shows a cities info'}
		elsif state && county && !city 
			render json: {success: 'this shows a counties info'}
		else
			render json: {fail: 'Invalid API format'}
		end
	end

	def state

	end

	def update

	end

	def destroy

	end

	def get_jurisdiction(state,city,county)
		state = State.where(abbreviation: state).first
		state = State.where(id: state) unless state
		
		if params[:county_id]
			county = County.where(name: county, state_id: state.id).first
			county = County.where(id: county, state_id: state.id) unless county
		else
			county = nil
		end

		if params[:city_id]
			city = City.where(name: city, state_id: state.id).first
			city = City.where(id: city) unless city
		else
			city = nil
		end

		return [state,county,city]
	end

end
