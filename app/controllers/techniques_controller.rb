class TechniquesController <ApplicationController

  def index
    @technique = Technique.all
  end

  def new
    @entry = Entry.find(params[:entry_id])
    @technique = Technique.new
    @roadmap = Roadmap.where({user_id: current_user.id})
  end

  def create
    @entry = Entry.find(params[:entry_id])
    @technique = Technique.create!(technique_params.merge(user: current_user, entry: @entry))
    redirect_to (entry_path(params[:entry_id]))
  end

# nice use of authorization (I'm assuming that's part of can-can-can?)
  def show
    @entry = Entry.find(params[:entry_id])
    @technique = Technique.find(params[:id])
    authorize! :read, @technique
  end

  def edit
    @entry = Entry.find(params[:entry_id])
    @technique = Technique.find(params[:id])
    @roadmap = Roadmap.where({user_id: current_user.id})
    authorize! :update, @technique
  end

  def update
    @entry = Entry.find(params[:entry_id])
    @technique = Technique.find(params[:id])
    @technique.update(technique_params.merge(user: current_user))
    authorize! :update, @technique
    redirect_to entry_technique_path(params[:entry_id], params[:id])
  end

  def destroy
    @entry = Entry.find(params[:entry_id])
    @technique = Technique.find(params[:id])
    @technique.destroy
    redirect_to entry_path(@entry)
  end

  # t.integer  "entry_id"
  # t.integer  "user_id"

  private
  def technique_params
    params.require(:technique).permit(:name, :description, :video_url, :roadmap_id)
  end
end
