class BoardsController < ApplicationController
	
	before_filter :allow_cors


	def index
		# Find the state by the abbreviation
		state, county, city = get_jurisdiction(params[:state_id],params[:county_id],params[:city_id])

		if state && !county && !city
			render json: {state_boards: state.boards}
		elsif state && county && city || state && city && !county
			render json: {city_boards: city.boards}
		elsif state && county && !city 
			render json: {county_boards: county.boards}
		else
			render json: {fail: 'Invalid API format'}
		end
	end

	def show
		p params[:q]
		board = Board.where(id: params[:id]).first
		render json: {board: board}
	end

	def update

	end

	def destroy

	end

	def get_jurisdiction(state,county,city)
		state = State.where(abbreviation: state).first
		state = State.where(id: state) unless state
		
		if county
			county = County.where(name: county, state_id: state.id).first
			county = County.where(id: county, state_id: state.id) unless county
		else
			county = nil
		end

		if city
			city = City.where(name: city, state_id: state.id).first
			city = City.where(id: city) unless city
		else
			city = nil
		end

		return [state,county,city]
	end

	def allow_cors
	  headers["Access-Control-Allow-Origin"] = "*"
	  headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
	  headers["Access-Control-Allow-Headers"] =
	    %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")

	  head(:ok) if request.request_method == "OPTIONS"
	  # or, render text: ''
	  # if that's more your style
	end
end
