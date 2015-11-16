class TechniquesController <ApplicationController

  def index
    @technique = Technique.all
  end

  def new
    @entry = Entry.find(params[:entry_id])
    @technique = Technique.new
  end

  def create
    @entry = Entry.find(params[:entry_id])
    @technique = Technique.create!(technique_params.merge(user: current_user, entry: @entry))
    redirect_to (entry_path(params[:entry_id]))
  end

  def show
    @entry = Entry.find(params[:entry_id])
    @technique = Technique.find(params[:id])
  end

  def edit
    @entry = Entry.find(params[:entry_id])
    @technique = Technique.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:entry_id])
    @technique = Technique.find(params[:id])
    @technique.update(technique_params.merge(user: current_user))
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
    params.require(:technique).permit(:name, :description, :video_url)
  end
end
