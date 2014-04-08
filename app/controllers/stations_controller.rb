class StationsController < ActionController::Base
  def new
    @station = Station.new
  end

  def create
    @station = Station.new(params[:station])
    if @station.save
      flash[:notice] = "Station Created."
      redirect_to('/stations')
    else
      render 'new'
    end
  end

  def index
    @stations = Station.all
  end

  def show
    @station = Station.find(params[:id])
  end

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(params[:station])
      flash[:notice] = "Station Updated"
      redirect_to("/stations/#{@station.id}")
    else
      render 'edit'
    end
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:notice] = "Station Deleted."
    redirect_to("/stations")
  end

  private
  def station_params
    params.require(:station).permit(:name)
  end

end
