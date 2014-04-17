class ApiKeysController < ApplicationController
  # GET /api_keys
  # GET /api_keys.json

  # GET /api_keys/1
  # GET /api_keys/1.json
  before_filter :logged_id?

  def index
    @api_keys = current_user.api_keys.where(active: true)
  end

  def show
    @api_key = ApiKey.find(params[:id])
    return false unless authenticated?
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api_key }
    end
  end

  # GET /api_keys/new
  # GET /api_keys/new.json
  def new
    redirect_to root_url unless current_user
    @api_key = ApiKey.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @api_key }
    end
  end

  # GET /api_keys/1/edit
  def edit
    @api_key = ApiKey.find(params[:id])
    return false unless authenticated?
  end

  # POST /api_keys
  # POST /api_keys.json
  def create
    redirect_to root_url unless current_user
    params[:api_key][:user_id] = current_user.id
    params[:api_key][:active] = true
    @api_key = ApiKey.new(params[:api_key])

    respond_to do |format|
      if @api_key.save
        format.html { redirect_to @api_key, notice: 'Api key was successfully created.' }
        format.json { render json: @api_key, status: :created, location: @api_key }
      else
        format.html { render action: "new" }
        format.json { render json: @api_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api_keys/1
  # PUT /api_keys/1.json
  def update
    @api_key = ApiKey.find(params[:id])
    return false unless authenticated?
    respond_to do |format|
      if @api_key.update_attributes(params[:api_key])
        format.html { redirect_to @api_key, notice: 'Api key was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @api_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api_keys/1
  # DELETE /api_keys/1.json
  def destroy
    @api_key = ApiKey.find(params[:id])
    return false unless authenticated?
    @api_key.destroy

    respond_to do |format|
      format.html { redirect_to api_keys_url }
      format.json { head :no_content }
    end
  end

  private
  def authenticated?
    unless @api_key.user == current_user
      redirect_to root_url
      return false
    end
  end 

  def logged_id?
    unless current_user
      redirect_to root_url
      return false
    end
  end
end
