class RoadmapsController < ApplicationController

  def index
    # NHO: When would you have more than one roadmap?
    @roadmap = Roadmap.all # NHO: @roadmaps
  end

  def show
    @technique = Technique.all # NHO: @techniques
    @user = current_user # NHO: is this instance variable necessary?
    @roadmap = Roadmap.find(params[:id])
    # NHO: would it be more appropriate to have @techniques = @roadmap.techniques?
    authorize! :read, @roadmap
  end

  def new
    @roadmap = Roadmap.new
  end

  def create
    @roadmap = Roadmap.create!(roadmap_params.merge(user: current_user))
    redirect_to roadmaps_path
  end

  def edit
    @roadmap = Roadmap.find(params[:id])
    authorize! :update, @roadmap
  end

  def update
    @roadmap = Roadmap.find(params[:id])
    @roadmap.update(roadmap_params)
    authorize! :update, @roadmap
    redirect_to roadmap_path
  end

  def destroy
    @roadmap = Roadmap.find(params[:id])
    @roadmap.destroy
    redirect_to roadmaps_path
  end


  private
  def roadmap_params
    params.require(:roadmap).permit(:category)
  end






end
