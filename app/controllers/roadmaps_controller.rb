class RoadmapsController < ApplicationController

# So techniques are part of a road map, and are also linked to an entry? It was kind of confusing to 
# me that I couldn't see techniques through the road map, but couldn't add any. I guess you're supposed
# to include the technique you practiced in your entry?

  def index
    @roadmap = Roadmap.all
  end

  def show
    @technique = Technique.all
    @user = current_user
    @roadmap = Roadmap.find(params[:id])
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
