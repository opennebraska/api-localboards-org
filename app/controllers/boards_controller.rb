class BoardsController < ApplicationController
	


	def index
		headers['Content-Type'] = 'application/json'
	    headers["Access-Control-Allow-Origin"] = request.env['HTTP_ORIGIN']
	    headers["Access-Control-Allow-Headers"] = '*'

		# Find the state by the abbreviation
		state, county, city = get_jurisdiction(params[:state_id],params[:county_id],params[:city_id])

		if state && !county && !city
			render json: {success: true, message: nil, data: state.boards}
		elsif state && county && city || state && city && !county
			render json: {success: true, message: nil, data: city.boards}
		elsif state && county && !city 
			render json: {success: true, message: nil, data: county.boards}
		else
			render json: {success: fail, message: 'Invalid API format', data: nil}
		end
	end

	def show
		headers['Content-Type'] = 'application/json'
	    headers["Access-Control-Allow-Origin"] = request.env['HTTP_ORIGIN']
	    headers["Access-Control-Allow-Headers"] = '*'
	    
		p params[:q]
		board = Board.where(id: params[:id]).first
		render json: {board: board}
	end

	def options
        allow_cors
        head :ok
      end

	def update

	end

	def destroy

	end

	def get_jurisdiction(state,county,city)
		state = State.where(abbreviation: state).first
		state = State.where(id: state) unless state
		
		if county
			county = County.where(code_id: county, state_id: state.id)
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
	  headers["Access-Control-Allow-Origin"] = request.env['HTTP_ORIGIN']
      headers['Content-Type'] = 'application/json'
	  headers["Access-Control-Allow-Methods"] = 'POST, GET, OPTIONS, PUT, DELETE'
	  headers["Access-Control-Allow-Headers"] = '*,Content-Type'

	  head(:ok) if request.request_method == "OPTIONS"
	  # or, render text: ''
	  # if that's more your style
	end
end
