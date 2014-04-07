class LinesController < ActionController::Base
  def new
    @stations = Station.all
    @line = Line.new
  end

  def create
    @line = Line.new(line_params)
    if @line.save
      flash[:notice] = "Line Added!"
      redirect_to("/lines/#{@line.id}")
    else
      render "new"
    end
  end

  def index
    @lines = Line.all
  end

  def show
    @line = Line.find(params[:id])
  end

  def edit
    @stations = Station.all
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      flash[:notice] = "Line Updated!"
      redirect_to ("/lines/#{@line.id}")
    else
      render "edit"
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:notice] = "Line Deleted."
    redirect_to("/lines")
  end

  private
  def line_params
    params.require(:line).permit(:name, :station_ids => [])
  end

end
