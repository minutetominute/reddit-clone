class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]
  before_action :check_moderator, only: [:edit, :update, :destroy]
  before_action :check_for_user, only: [:new, :create]

  # GET /subs
  # GET /subs.json
  def index
    @subs = Sub.all
  end

  # GET /subs/1
  # GET /subs/1.json
  def show
  end

  # GET /subs/new
  def new
    @sub = Sub.new
  end

  # GET /subs/1/edit
  def edit
  end

  # POST /subs
  # POST /subs.json
  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  # PATCH/PUT /subs/1
  # PATCH/PUT /subs/1.json
  def update
    @sub.update(sub_params)
    if @sub.save
      flash[:success] = "Sub updated!"
      redirect_to sub_url(@sub)
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  # DELETE /subs/1
  # DELETE /subs/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to subs_url, notice: 'Sub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub
      @sub = Sub.find(params[:id])
    end

    def check_moderator
      redirect_to sub_url(@sub) unless current_user == @sub.moderator
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_params
      params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
