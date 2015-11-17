class RoadmapsController < ApplicationController

  def index
    @roadmap = Roadmap.all
  end

  def show
    @roadmap = Roadmap.find(params[:id])
  end

  def new
    @roadmap = Roadmap.new
  end

  def create
    @roadmap = Roadmap.create!(roadmap_params)
    redirect_to roadmaps_path
  end

  def edit
    @roadmap = Roadmap.find(params[:id])
  end

  def update
    @roadmap = Roadmap.find(params[:id])
    @roadmap.update(roadmap_params)
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
