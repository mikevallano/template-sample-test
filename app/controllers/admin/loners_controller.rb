class Admin::LonersController < ApplicationController
  before_action :set_loner, only: [:show, :edit, :update, :destroy]

  # GET /loners
  # GET /loners.json
  def index
    @loners = Loner.all
  end

  # GET /loners/1
  # GET /loners/1.json
  def show
  end

  # GET /loners/new
  def new
    @loner = Loner.new
  end

  # GET /loners/1/edit
  def edit
  end

  # POST /loners
  # POST /loners.json
  def create
    @loner = Loner.new(loner_params)
    puts "loner params: #{loner_params}"

    respond_to do |format|
      if @loner.save
        format.html { redirect_to admin_loner_path(@loner), notice: 'Loner was successfully created.' }
        puts "loner successfully saved"
        format.json { render :show, status: :created, location: @loner }
      else
        format.html { render :new }
        format.json { render json: @loner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loners/1
  # PATCH/PUT /loners/1.json
  def update
    respond_to do |format|
      if @loner.update(loner_params)
        format.html { redirect_to admin_loner_path, notice: 'Loner was successfully updated.' }
        format.json { render :show, status: :ok, location: @loner }
      else
        format.html { render :edit }
        format.json { render json: @loner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loners/1
  # DELETE /loners/1.json
  def destroy
    @loner.destroy
    respond_to do |format|
      format.html { redirect_to admin_loners_path, notice: 'Loner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loner
      @loner = Loner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loner_params
      params.require(:loner).permit(:name, :taco)
    end
end
