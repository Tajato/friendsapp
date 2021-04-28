class FriendsInfosController < ApplicationController
  before_action :set_friends_info, only: %i[ show edit update destroy ]
  before_action :authenticate_user!,except:[:index, :show]
  before_action :correct_user, only:[:edit, :update, :destroy]
  # GET /friends_infos or /friends_infos.json
  def index
    @friends_infos = FriendsInfo.all
  end

  # GET /friends_infos/1 or /friends_infos/1.json
  def show
  end

  # GET /friends_infos/new
  def new
    #@friends_info = FriendsInfo.new
    @friends_info = current_user.friends_infos.build
  end

  # GET /friends_infos/1/edit
  def edit
  end

  # POST /friends_infos or /friends_infos.json
  def create
    #@friends_info = FriendsInfo.new(friends_info_params)
    @friends_info = current_user.friends_infos.build(friends_info_params)

    respond_to do |format|
      if @friends_info.save
        format.html { redirect_to @friends_info, notice: "Friends info was successfully created." }
        format.json { render :show, status: :created, location: @friends_info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friends_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends_infos/1 or /friends_infos/1.json
  def update
    respond_to do |format|
      if @friends_info.update(friends_info_params)
        format.html { redirect_to @friends_info, notice: "Friends info was successfully updated." }
        format.json { render :show, status: :ok, location: @friends_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friends_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends_infos/1 or /friends_infos/1.json
  def destroy
    @friends_info.destroy
    respond_to do |format|
      format.html { redirect_to friends_infos_url, notice: "Friends info was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friends_infos = current_user.friends_infos.find_by(id:params[:id])
    redirect_to friends_infos_path, notice: "Not authorized To Edit This friend" if @friends_infos.nil?
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friends_info
      @friends_info = FriendsInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friends_info_params
      params.require(:friends_info).permit(:first_name, :last_name, :instagram, :phone_number, :user_id)
    end
  end
