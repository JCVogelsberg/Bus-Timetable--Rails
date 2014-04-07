class LinesController < ApplicationController
  def new
    @stations = Station.all
    @line = Line.new
  end

  def create
    @line = Line.new(params[:line])
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
    if @line.update(params[:line])
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

end
