class UsersController < ApplicationController
   before_action :set_user, only: [:destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users}
      format.xml { render xml: @users}
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user}
      format.xml { render xml: @user}
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    puts "form params: #{user_params}"
    puts "role ids: #{user_params["role_ids"]}"
    user_params["role_ids"].each do |id|
      id = id.to_i
      if id > 0
        rolename = Role.find(id).name
        @user.add_role(:rolename)
      end
    end

    respond_to do |format|
      if @user.save!
        format.html { redirect_to users_path, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    puts "previous roles: #{@user.role_ids}"
    # if user_params["role_ids"].size > 0
    #   @user.role_ids =[]
    # end
    # puts "cleared roles: #{@user.role_ids}"
    # user_params["role_ids"].each do |id|
    #   id = id.to_i
    #   if id > 0
    #     rolename = Role.find(id).name
    #     @user.add_role(:rolename)
    #   end
    # end

    respond_to do |format|
      if @user.update(user_params)
        puts "after roles: #{@user.role_ids}"
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :email, :role_ids => [])
    end
end
