class ApplicationController < ActionController::Base
  protect_from_forgery
  # after_filter :set_access_control_headers

  # def set_access_control_headers 
    
  #   headers['Access-Control-Allow-Origin'] = 'http://localhost:3000' 
  #   headers['Content-Type'] = 'application/json'
  #   headers["Access-Control-Allow-Methods"] = 'POST, GET, OPTIONS, PUT, DELETE'
  #   headers["Access-Control-Allow-Headers"] = '*'
    
  # end

  def get_board(board_id, params)
    if params[:state_id] 
      state = State.where("lower(abbreviation) = ?", params[:state_id]).first
      board = Board.where(id: board_id, state_id: state.id).first
      if board
        return board
      else
        return nil
      end

    elsif params[:county_id]
      board = Board.where(id: board_id, county_id: params[:county_id]).first
      if board
        return board
      else
        return nil
      end

    elsif params[:city_id]

      board = Board.where(id: board_id, city_id: params[:city_id]).first
      if board
        return board
      else
        return nil
      end

    else
      return nil
    end
  end


end
