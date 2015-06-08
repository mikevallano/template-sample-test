class Admin::ThingiesController < ApplicationController
  before_action :set_thingie, only: [:edit, :update, :destroy]

  # GET /thingies
  # GET /thingies.json
  def index
    @thingies = Thingie.all
    respond_to do |format|
      format.html
      format.json { render json: @thingies}
      format.xml { render xml: @thingies}
    end
  end

  # GET /thingies/1
  # GET /thingies/1.json
  def show
    @thingie = Thingie.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @thingie}
      format.xml { render xml: @thingie}
    end
  end

  # GET /thingies/new
  def new
    @thingie = Thingie.new
  end

  # GET /thingies/1/edit
  def edit
  end

  # POST /thingies
  # POST /thingies.json
  def create
    @thingie = Thingie.new(thingie_params)

    respond_to do |format|
      if @thingie.save
        format.html { redirect_to admin_thingies_path, notice: 'thingie was successfully created.' }
        format.json { render :show, status: :created, location: @thingie }
      else
        format.html { render :new }
        format.json { render json: @thingie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thingies/1s
  # PATCH/PUT /thingies/1.json
  def update
    respond_to do |format|
      if @thingie.update(thingie_params)
        format.html { redirect_to admin_thingies_path, notice: 'thingie was successfully updated.' }
        format.json { render :show, status: :ok, location: @thingie }
      else
        format.html { render :edit }
        format.json { render json: @thingie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thingies/1
  # DELETE /thingies/1.json
  def destroy
    @thingie.destroy
    respond_to do |format|
      format.html { redirect_to admin_thingies_url, notice: 'thingie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thingie
      @thingie = Thingie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thingie_params
      params.require(:thingie).permit(:name, :description)
    end
end
