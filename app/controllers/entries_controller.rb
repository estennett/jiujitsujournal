class EntriesController <ApplicationController

  def index
    @entry =Entry.all

  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.create!(entry_params.merge(user: current_user))
    redirect_to (entries_path)
  end

  def show
    @entry = Entry.find(params[:id])
    @technique = Technique.all
    authorize! :read, @entry
  end

  def edit
    @entry = Entry.find(params[:id])
    authorize! :update, @entry
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update(entry_params)
    authorize! :update, @entry
    redirect_to entry_path(@entry)
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entries_path
  end



  private
  def entry_params
    params.require(:entry).permit(:title, :comments, :sparring_partners)
  end

end
