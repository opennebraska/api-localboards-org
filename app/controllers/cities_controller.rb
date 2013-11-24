class CitiesController < ApplicationController

	def index
		inject_option_headers

		
		if params[:state_id]
			state, cities = get_jurisdiction(params[:state_id])
			render json: RestResponse.success(cities)
		else
			RestResponse.notFound('Invalid API query')
		end
	end

	def show
		inject_option_headers

		if params[:id] && params[:state_id]
			state, city = get_jurisdiction(params[:state_id],params[:id])
			render json: RestResponse.success(city.counties)
		else
			RestResponse.notFound('Invalid API query')
		end
	end

	def get_jurisdiction(state,city = nil)
		state = State.where('lower(abbreviation) = ?', state).first

		if city
			city = City.where(name: city, state_id: state.id).first
			city = City.where(id: city, state_id: state.id) unless city
		else
			cities = City.where(state_id: state.id)
		end

		if city || cities
			return [state,city]
		else
			RestResponse.notFound('Invalid API query')
		end
	end
end
